% Script: PhysioDataPlottingAndAnalysis.m
%
% This script loads and plots already processed physiological recordings.

clear
close all

plot_lines = 0;  % Changed to 0 as the previous line was overwritten immediately
ALPHA = 0.05;

%% Load the recording
[file,path,indx] = uigetfile('*.mat', 'Select a session');
if isequal(file,0)
    disp('User selected Cancel')
else
    disp(['User selected ', fullfile(path, file)])
    load(fullfile(path, file));
    for i = 1:length(channelNames)
        fprintf('\t\t %s -- %s\n', channelNames{i}, sensors{i});
    end
    fprintf('\t\t\n');
    for i = 1:length(comments)
        fprintf('\t\t %s\n', comments{i});
    end
end

%% Set plot window if not already defined
if ~exist('plot_window', 'var')
    plot_window = [min(time) max(time)];        % in ms
end

%% Plot recordings
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
plot(time, bcg, 'b', 'LineWidth', 1.5), hold on,
if plot_lines~=0
    for i =1:length(peaks_r)
        xline(time(peaks_r(i)), '--g');
    end
end
ylabel('Pressure [mmHg]'),
legend('BCG', 'R-peaks'),
xlim(plot_window),

subplot(6,1,3),
plot(time, C_coupling*1e12, 'g', 'LineWidth', 1.5), hold on,
if plot_lines~=0
    for i =1:length(peaks_r)
        xline(time(peaks_r(i)), '--g');
    end
end
ylabel('Capacitance [pF]'),
legend('Coupling Capacitance', 'R-peaks'),
xlim(plot_window)

subplot(6,1,4),
plot(time, bcg_filtered, 'b', 'LineWidth', 1.5), hold on,
if plot_lines~=0
    for i =1:length(peaks_r)
        xline(time(peaks_r(i)), '--g');
    end
end
ylabel('Pressure [mmHg]'),
legend('BCG', 'R-peaks'),
xlim(plot_window),


subplot(6,1,5),
plot(time, C_filtered*1e12, 'g', 'LineWidth', 1.5), hold on,
if plot_lines~=0
    for i =1:length(peaks_r)
        xline(time(peaks_r(i)), '--g');
    end
end
ylabel('Capacitance [pF]'),
legend('Coupling Capacitance', 'R-peaks'),
xlim(plot_window),


subplot(6,1,6),
plot(time, imp_env, 'r', 'LineWidth', 1.5), hold on,
if plot_lines~=0
    for i =1:length(peaks_r)
        xline(time(peaks_r(i)), '--g');
    end
end
ylabel('Voltage [V]'),
xlabel('Time [s]'),
legend('Impedance Envelope', 'R-peaks'),
xlim(plot_window),

%% Compute average shape
% Add your code here. Example:
average_window = [250 800];
[ecg_average, ecg_std] = PeakAlignedAverageShape(ecg, peaks_r, Fs, average_window);
[bcg_average, bcg_std] = PeakAlignedAverageShape(bcg_filtered, peaks_r, Fs, average_window);
[imp_env_average, imp_env_std] = PeakAlignedAverageShape(imp_env, peaks_r, Fs, average_window);
[C_average, C_std] = PeakAlignedAverageShape(C_filtered, peaks_r, Fs, average_window);

time_for_average = linspace(-1*average_window(1),average_window(2),length(ecg_average))';

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
% Scale the standard deviations
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



%% Analysis on Correlation

[r,p,timeDiff] = segment_correlation(bcg_average,C_average);
if p < ALPHA
    fprintf('\nCross-Correlation between BCG AVERAGE and C AVERAGE is %f with a lag of %f ms',...
        r, timeDiff*1000/Fs);
end


[r,p,timeDiff] = segment_correlation(bcg_average,imp_env_average);
if p < ALPHA
    fprintf('\nCross-Correlation between BCG AVERAGE and ENV AVERAGE is %f with a lag of %f ms',...
        r, timeDiff*1000/Fs);
end


[r,p,timeDiff] = segment_correlation(bcg_filtered,C_filtered);
if p < ALPHA
    fprintf('\nCross-Correlation between BCG and COUPLING is %f with a lag of %f ms',...
        r, timeDiff*1000/Fs);
end


[r,p,timeDiff] = segment_correlation(bcg_filtered,imp_env);
if p < ALPHA
    fprintf('\nCross-Correlation between BCG and ENVELOPE is %f with a lag of %f ms\n',...
        r, timeDiff*1000/Fs);
end

%% Multi-Spectral Analysis
cospectra_analysis(bcg_filtered, C_filtered, Fs, 1);

% Uncomment the lines below if you wish to run these analyses as well.
% cospectra_analysis(bcg_filtered, ecg, Fs, 1);
% cospectra_analysis(C_filtered, ecg, Fs, 1);
