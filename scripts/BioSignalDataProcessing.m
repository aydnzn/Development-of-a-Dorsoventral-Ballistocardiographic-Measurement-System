% BioSignalDataProcessing.m
% 
% This script loads and processes biomedical data for subsequent analysis. 
% Data includes ECG, raw BCG, BCG, raw impedance, and impedance. 
% Each of these is assumed to be a column in the input data. 
%
% Structure of the data:
% data(:,1) = ECG
% data(:,2) = BCG Raw
% data(:,3) = BCG
% data(:,4) = Impedance Raw
% data(:,5) = Impedance

% Clear workspace
clear


% Define analysis parameters
Fs_analysis = 5e3;
analysis_window = [5 120];
bcg_filter = [0.7 30];
ecg_filter = [0.7 45];

% Choose the recording
[file,path,indx] = uigetfile('*.mat', 'Select a session');
if isequal(file,0)
   disp('User selected Cancel')
else
   disp(['User selected ', fullfile(path, file)])
   load(fullfile(path, file)); 
   
   % Display channel names and sensors
   for i = 1:length(channelNames)
       fprintf('\t\t %s -- %s\n', channelNames{i}, sensors{i});
   end
   
   fprintf('\t\t\n');
   
   % Display comments
   for i = 1:length(comments)
       fprintf('\t\t %s\n', comments{i});
   end
   
   fprintf('\nTotal length of the measurement is %d seconds \n', floor(size(data,1)/Fs));
end

%% Design the filters
[b_notch, a_notch] = iirnotch(50/(Fs_analysis/2), 4/(Fs_analysis/2));
[b_hp, a_hp] = butter(3, ecg_filter(1)/(Fs_analysis/2), 'high');
[b_lp, a_lp] = butter(6, ecg_filter(2)/(Fs_analysis/2), 'low');
[b_hp_bcg, a_hp_bcg] = butter(3, bcg_filter(1)/(Fs_analysis/2), 'high');
[b_lp_bcg, a_lp_bcg] = butter(6, bcg_filter(2)/(Fs_analysis/2), 'low');

%%  Prepare the data

ecg = data(:,1);
bcg_raw = data(:,2);
bcg = data(:,3);
imp_raw = data(:,4);
imp_env = data(:,5);
time_high_fs = (0:1/Fs:(length(imp_raw)-1)/Fs)';

if exist('analysis_window', 'var')
    ecg = ecg(Fs*analysis_window(1)+1:Fs*analysis_window(2));
    bcg_raw = bcg_raw(Fs*analysis_window(1)+1:Fs*analysis_window(2));
    bcg = bcg(Fs*analysis_window(1)+1:Fs*analysis_window(2));    
    imp_raw = imp_raw(Fs*analysis_window(1)+1:Fs*analysis_window(2));
    imp_env = imp_env(Fs*analysis_window(1)+1:Fs*analysis_window(2));
    time_high_fs = time_high_fs(Fs*analysis_window(1)+1:Fs*analysis_window(2));
end

clear data

if measurement_mode == 2
    % To overcome the problem of Fc >= Fs
    Fc = Fs/10;
else
    % The following filter stage is redundant. Some of them can be reduced
    [b_peak,a_peak] = iirpeak(Fc/(Fs/2), 300/(Fs/2));
    imp_raw = filtfilt(b_peak, a_peak, imp_raw);

    [b_peak_hp, a_peak_hp] = butter(12, 3000/(Fs/2), 'high');
    imp_raw = filtfilt(b_peak_hp, a_peak_hp, imp_raw);

    [b_peak_lp, a_peak_lp] = butter(12, 7000/(Fs/2), 'low');
    imp_raw = filtfilt(b_peak_lp, a_peak_lp, imp_raw);

end

imp_raw = imp_raw*1.0295;
imp_env = imp_env*1.0295;

%% Resample

samples_to_delete = Fs_analysis*0.2;

ecg = resample(ecg, Fs_analysis, Fs,50);
bcg_raw = resample(bcg_raw, Fs_analysis, Fs,50);
bcg = resample(bcg, Fs_analysis, Fs,50);
imp_env = resample(imp_env, Fs_analysis, Fs,50);

Fs_original = Fs;
Fs = Fs_analysis;
clear Fs_analysis

% Create the time array for reduced Fs
ecg(1:samples_to_delete) = [];
bcg_raw(1:samples_to_delete) = [];
bcg(1:samples_to_delete) = [];
imp_env(1:samples_to_delete) = [];
ecg(end-samples_to_delete:end) = [];
bcg_raw(end-samples_to_delete:end) = [];
bcg(end-samples_to_delete:end) = [];
imp_env(end-samples_to_delete:end) = [];

%% Channel group delay recompensation

ecg_delay = 25e-3;
bcg_delay = 23.8e-3;
env_delay = 12.6e-3;

ecg_delay = floor(ecg_delay*Fs);
bcg_delay = floor(bcg_delay*Fs);
env_delay = floor(env_delay*Fs);

ecg(1:ecg_delay) = [];
bcg(1:bcg_delay) = [];
imp_env(1:env_delay) = [];


min_length = min([length(ecg), length(bcg), length(imp_env)]);
ecg = ecg(1:min_length);
bcg = bcg(1:min_length);
imp_env = imp_env(1:min_length);

time = (0:1/Fs:(length(imp_env)-1)/Fs)';

%% ECG Processing

ecg = filtfilt(b_notch, a_notch, ecg);
ecg = filtfilt(b_hp, a_hp, ecg);
ecg = filtfilt(b_lp, a_lp, ecg);

%% BCG Processing

if strcmp(sensors{3},'FSR-CA') || strcmp(sensors{2},'FSR-CA')
    A = 40*40e-6;       % Sensor area for FSR
    if ~exist('R_ref', 'var')   % Reference resistance for voltage divider FSR
        R_ref = 680;
    end
    if ~exist('V_ref', 'var')   % Reference resistance for voltage divider FSR
        V_ref = 5;
    end    

    bcg(abs(bcg)<=eps) = eps;
    bcg = -1*V_ref./bcg*R_ref;
    F = (10.^((log10(bcg)-5.146)/(-0.684)))/100;
       
    Pa_to_mmHg = 0.0075006156130264;
    bcg = F/A*Pa_to_mmHg;
    clear R F A Pa_to_mmHg mmHg_to_cmH2O R_ref V
   
    disp('FSR-CA is converted to mmHg');
else
    bcg = -1*bcg;
    bcg_raw = -1*bcg_raw;
    disp('PVDF-CM assumed and inverted')
end


%% BCG Filtering

bcg_filtered = filtfilt(b_notch, a_notch, bcg);
bcg_filtered = filtfilt(b_hp_bcg, a_hp_bcg, bcg_filtered);
bcg_filtered = filtfilt(b_lp_bcg, a_lp_bcg, bcg_filtered);



%% Impedance-Raw Processing

if ~exist('V_excitation', 'var')
    V_excitation = 1;
end

% Calculate the demodulated signal using DemodulateAndInterpolate
C_coupling = DemodulateAndInterpolate(imp_raw, Fc, Fs_original, V_excitation, 152e-12,250);
C_coupling = resample(C_coupling, Fs, Fs_original);

C_coupling(1:samples_to_delete) = [];
C_coupling(end-samples_to_delete:end) = [];
C_coupling = C_coupling(1:min_length);
C_filtered = filtfilt(b_notch, a_notch, C_coupling(isfinite(C_coupling)));
C_filtered = filtfilt(b_hp_bcg, a_hp_bcg, C_filtered);
C_filtered = filtfilt(b_lp_bcg, a_lp_bcg, C_filtered);

%% Impedance-Envelope Processing

imp_env = filtfilt(b_notch, a_notch, imp_env);
imp_env = filtfilt(b_hp_bcg, a_hp_bcg, imp_env);
imp_env = filtfilt(b_lp_bcg, a_lp_bcg, imp_env);

%% ECG R-Peak detection

% Find the R-peaks, if they are not already stored
if ~exist('peaks_r', 'var')
    peaks_r = QrsDetectionPanTompkins(ecg, Fs);
end
%%
if ~exist('plot_window', 'var')
    plot_window = [min(time) max(time)];        % in ms
end


figure,
subplot(6,1,1),
title(file);
plot(time, ecg, 'k', 'LineWidth', 1.5), hold on,
plot(time(peaks_r), ecg(peaks_r), '*g'), legend('ECG', 'R-peaks'), hold off,
ylabel('Voltage [V]'),
xlim(plot_window),


subplot(6,1,2),
plot(time, bcg, 'b', 'LineWidth', 1.5),
ylabel('Pressure [mmHg]'),
legend('BCG'),
xlim(plot_window),

subplot(6,1,3),
plot(time, C_coupling*1e12, 'g', 'LineWidth', 1.5),
ylabel('Capacitance [pF]'),
legend('Coupling Capacitance'),
xlim(plot_window)

subplot(6,1,4),
plot(time, bcg_filtered, 'b', 'LineWidth', 1.5),
ylabel('Pressure [mmHg]'),
legend('BCG'),
xlim(plot_window),


subplot(6,1,5),
plot(time, C_filtered*1e12, 'g', 'LineWidth', 1.5),
ylabel('Capacitance [pF]'),
legend('Coupling Capacitance'),
xlim(plot_window),


subplot(6,1,6),
plot(time, imp_env, 'r', 'LineWidth', 1.5),
ylabel('Voltage [V]'),
xlabel('Time [s]'),
legend('Impedance Envelope'),
xlim(plot_window),

%% get average shape


average_window = [250 800];
[ecg_average, ecg_std] = PeakAlignedAverageShape(ecg, peaks_r, Fs, average_window);
[bcg_average, bcg_std] = PeakAlignedAverageShape(bcg_filtered, peaks_r, Fs, average_window);
[imp_env_average, imp_env_std] = PeakAlignedAverageShape(imp_env, peaks_r, Fs, average_window);
[C_average, C_std] = PeakAlignedAverageShape(C_filtered, peaks_r, Fs, average_window);

time_for_average = linspace(-1*average_window(1),average_window(2),length(ecg_average))';



%%
figure,
subplot(4,1,1),
plot(time_for_average, ecg_average, 'k', 'LineWidth', 1.5), hold on,
fill([time_for_average' flip(time_for_average)'],...
    [(ecg_average-std(ecg_std)) flip(ecg_average+std(ecg_std))],'k','LineStyle', 'none'),
alpha(0.35),
hold off,
legend('ECG'),
ylabel('Voltage [V]'),
xlim([min(time_for_average) max(time_for_average)]),


subplot(4,1,2),
plot(time_for_average, bcg_average, 'b', 'LineWidth', 1.5), hold on,
fill([time_for_average' flip(time_for_average)'],...
    [(bcg_average-std(bcg_std)) flip(bcg_average+std(bcg_std))],'b','LineStyle', 'none'),
alpha(0.2),
hold off,
legend('BCG'),
ylabel('Voltage [V]'),
xlim([min(time_for_average) max(time_for_average)]),

subplot(4,1,3),
plot(time_for_average, C_average*1e12, 'g', 'LineWidth', 1.5), hold on,
fill([time_for_average' flip(time_for_average)'],...
    [(C_average*1e12-std(C_std)*1e12) flip(C_average*1e12+std(C_std)*1e12)],'g','LineStyle', 'none'),
alpha(0.2),
hold off,
legend('C_{coupling}'),
ylabel('Capacitance [pF]'),
xlim([min(time_for_average) max(time_for_average)]),


subplot(4,1,4),
plot(time_for_average, imp_env_average, 'r', 'LineWidth', 1.5), hold on,
fill([time_for_average' flip(time_for_average)'],...
    [(imp_env_average-std(imp_env_std)) flip(imp_env_average+std(imp_env_std))],'r','LineStyle', 'none'),
alpha(0.32),
hold off,
legend('Impedance Envelope'),
ylabel('Voltage [V]'),
xlim([min(time_for_average) max(time_for_average)]),
xlabel('Time [ms]'),

%% Scale the average shapes for plotting together
% Scale the standard deviations

% Scale option 2
% Scale the average waveforms
ecg_average_norm = (ecg_average - mean(ecg_average))./std(ecg_average);
bcg_average_norm = (bcg_average - mean(bcg_average))./std(bcg_average);
C_average_norm = (C_average - mean(C_average))./std(C_average);
imp_env_average_norm = (imp_env_average - mean(imp_env_average))./std(imp_env_average);


% Scale the standard deviations
ecg_std = ecg_std/(eps+max(ecg_average)-min(ecg_average));
bcg_std = bcg_std/(eps+max(bcg_average)-min(bcg_average));
imp_env_std = imp_env_std/(eps+max(imp_env_average)-min(imp_env_average));
C_std = C_std/(eps+max(C_average)-min(C_average));


% Scale the average waveforms
ecg_average = (ecg_average-min(ecg_average))/(eps+max(ecg_average)-min(ecg_average));
bcg_average = (bcg_average-min(bcg_average))/(eps+max(bcg_average)-min(bcg_average));
imp_env_average = (imp_env_average-min(imp_env_average))/(eps+max(imp_env_average)-min(imp_env_average));
C_average = (C_average-min(C_average))/(eps+max(C_average)-min(C_average));


%% Plot the scaled average shapes
figure,
title('Compare the average shapes after segmentation'),
plot(time_for_average, ecg_average, 'k', 'LineWidth', 1.5), hold on,
plot(time_for_average, bcg_average, 'b', 'LineWidth', 1.5),
plot(time_for_average, C_average, 'g', 'LineWidth', 1.5),
plot(time_for_average, imp_env_average, 'r', 'LineWidth', 1.5),
fill([time_for_average' flip(time_for_average)'],...
    [(ecg_average-std(ecg_std)) flip(ecg_average+std(ecg_std))],'k','LineStyle', 'none'),
alpha(0.35),
fill([time_for_average' flip(time_for_average)'],...
    [(bcg_average-std(bcg_std)) flip(bcg_average+std(bcg_std))],'b','LineStyle', 'none'),
alpha(0.2),
fill([time_for_average' flip(time_for_average)'],...
    [(C_average-std(C_std)) flip(C_average+std(C_std))],'g','LineStyle', 'none'),
alpha(0.2),
fill([time_for_average' flip(time_for_average)'],...
    [(imp_env_average-std(imp_env_std)) flip(imp_env_average+std(imp_env_std))],'r','LineStyle', 'none'),
alpha(0.2),
xlim([min(time_for_average) max(time_for_average)]),

 
hold off,
legend('ECG', 'BCG', 'C_{coupling}', 'Envelope'),
ylabel('Normalized [a.u.]'),
xlabel('Time [ms]'),

%% Plot the scaled average shapes with method 2
figure,
title('Compare the average shapes after segmentation'),
plot(time_for_average, ecg_average_norm, 'k', 'LineWidth', 1.5), hold on, title(file),
plot(time_for_average, bcg_average_norm, 'b', 'LineWidth', 1.5),
plot(time_for_average, C_average_norm, 'g', 'LineWidth', 1.5),
plot(time_for_average, imp_env_average_norm, 'r', 'LineWidth', 1.5),

 
hold off,
legend('ECG', 'BCG', 'Impedance', 'Envelope'),
ylabel('Normalized [a.u.]'),
xlabel('Time [ms]'),
xlim([min(time_for_average) max(time_for_average)]),


%% Save the processed data

file_name = strsplit(file, '_');
file_name = strcat('_processed_data\rec_proc_',file_name{2});
save(file_name, 'bcg', 'bcg_filter', 'bcg_filtered', 'comments', 'channelNames', ...
    'date', 'ecg', 'ecg_filter', 'C_coupling', 'C_filtered', 'Fs', ...
    'imp_env', 'peaks_r', 'sensors', 'time');

disp(strcat('Results were saved to', {' '}, file_name));
