% BioSignalAcquisition
%
% This script measures and records the ECG, BCG, and impedance signals
% using a data structure with NI-DAQ.
%

% Clear variables, close all figures and clear command window
clear; close all; clc;

%% Set recording parameters
measurement_mode = 1;  % ECG-BCG-Imp = 1, ECG-BCG = 2, ECG-Imp = 3
Fs = 200e3;            % Sampling frequency (Hz)
duration = 120;        % Recording duration (s)
date = '....';   % Date of recording
file_name = '....'; % Output file name

% Comments and sensor information
comments = {'Left back', 'aydin', '...', 'leaning back'};
sensors = {'Voltage Divider v2.3 no DRL', 'PVDF CM, with insulating layer raw', 'PVDF CM, with insulating layer', 'Sensing Unit v1.0 after BP', 'rect-BP'};
channelNames = {'ECG', 'BCG Raw', 'BCG', 'Impedance Raw', 'Impedance Envelope'};
channelUnits = {'V','V','V','V', 'V'};

%% Set BCG Measurement Parameters
V_ref = 5;     % Reference Voltage
R_ref = 680;   % Reference Resistance

%% Set Impedance Measurement Parameters
Fc = 5000;          % Excitation frequency
V_excitation = 9;   % Amplitude(V) of the excitation signal

%% Generate the Excitation Signal
time = (0:1/Fs:duration)';
signal_excitation = V_excitation*sin(2*pi*Fc*time);

%% Create Data Acquisition Session and configure channels
daqSession = daq.createSession('ni');
daqSession.Rate = Fs;

% Configure Channels based on the measurement mode
switch measurement_mode
    case 1  % ECG - BCG - Impedance
        daqSession.addAnalogInputChannel('Dev1', 0:4, 'Voltage');
        daqSession.addAnalogOutputChannel('Dev1', 0, 'Voltage');
        daqSession.queueOutputData(signal_excitation);
    case 2  % ECG - BCG
        daqSession.addAnalogInputChannel('Dev1', 0:2, 'Voltage');
        daqSession.DurationInSeconds = duration;
    case 3  % ECG - Impedance
        daqSession.addAnalogInputChannel('Dev1', [0, 3:4], 'Voltage');
        daqSession.queueOutputData(signal_excitation);
end

%% Announce recording start
disp('Recording will start in 5 seconds...');
pause(5); % Wait for 5 seconds before starting recording
disp('Recording Started...');

%% Start Recording and simultaneous plotting
data_record1 = fopen('temp1.bin','w');
lh1 = daqSession.addlistener('DataAvailable',@plotData);
lh2 = daqSession.addlistener('DataAvailable',@(src,event)logData(src, event, data_record1));

daqSession.NotifyWhenDataAvailableExceeds = 4*Fs;

daqSession.startBackground(); % Start recording
daqSession.wait();

delete(lh1);
daqSession.stop;
delete(lh2);
fclose(data_record1);

%% Save the session
data_record2 = fopen('temp1.bin','r');
[data_temp,~] = fread(data_record2,[(numel(channelNames)+1),inf],'double');
fclose(data_record2);

data(:,1) = data_temp(2,:);
switch measurement_mode
    case 1  % ECG - BCG - Impedance
        data(:,2:5) = data_temp(3:6,:);
    case 2  % ECG - BCG
        data(:,2:3) = data_temp(3:4,:);
        data(:,4:5) = zeros(size(data_temp,2),1);
    case 3  % ECG - Impedance
        data(:,2:3) = zeros(size(data_temp,2),1);
        data(:,4:5) = data_temp(5:6,:);
end

save(file_name, 'channelNames', 'channelUnits', 'comments', 'data', 'date', 'Fc', 'Fs', 'sensors', 'V_excitation', 'V_ref', 'R_ref', 'measurement_mode');

%% LogData Function
function logData(src, evt, fid)
    data = [evt.TimeStamps, evt.Data]' ;
    fwrite(fid,data,'double');
end

%% Plot Function
function plotData(src,event)
    subplot(3,1,1);
    plot(event.TimeStamps,event.Data(:,1));
    xlabel("Time (s)");
    ylabel("Voltage (V)");

    subplot(3,1,2);
    plot(event.TimeStamps,event.Data(:,2:3));
    xlabel("Time (s)");
    ylabel("Voltage (V)");

    subplot(3,1,3);
    plot(event.TimeStamps,event.Data(:,4:5));
    xlabel("Time (s)");
    ylabel("Voltage (V)");
end
