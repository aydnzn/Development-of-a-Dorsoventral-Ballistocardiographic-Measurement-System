% ChirpSignalTest.m
% This script uses the NI-DAQ to create a test signal (a chirp) and measure its output.

clear
close all
clc

%% Define Recording Parameters
Fs = 1e3; % Sampling frequency
duration = 200; % Duration of the signal
amplitude = 0.07; % Amplitude of the signal

Fmin = 1; % Minimum frequency of the chirp
Fmax = 80; % Maximum frequency of the chirp

test_time = (0:1/Fs:duration)'; % Define the time vector for the test signal
x_t = amplitude*chirp(test_time, Fmin, duration, Fmax,'quadratic'); % Create the test signal (chirp)

%% Setup the DAQ (Data Acquisition) Session
daqSession = daq.createSession('ni');
addAnalogInputChannel(daqSession,'Dev1', 2, 'Voltage'); % Add analog input channel
addAnalogOutputChannel(daqSession,'Dev1', 0, 'Voltage'); % Add analog output channel

daqSession.Rate = Fs; % Set the rate of the DAQ session

%% Start Recording
disp('Recording started...');

queueOutputData(daqSession,x_t); % Queue the data for the output channel
[y_t, time] = daqSession.startForeground; % Start the DAQ session and get the output data

disp('Recording finished...');

%% Calculate and Plot FFT for the Processed Signal
figure,
[~, x_f] = FastFourierTransformAnalysis(x_t, Fs, 1); % Calculate the FFT of the input signal
[f, y_f] = FastFourierTransformAnalysis(y_t, Fs, 1); % Calculate the FFT of the output signal

% Plot the difference between the output and input signal spectrums
semilogx(f, y_f-x_f, 'k');
xlim([Fmin*1.1 Fmax*0.95]);
xlabel('Frequency [Hz]');
ylabel('Power Spectrum [dB/Hz]', 'FontSize', 12),
set(gca, 'FontSize', 12)

%% Plot the Input and Output Signals Over Time
figure,
subplot(2,1,1), plot(time, x_t), legend('Input');
subplot(2,1,2), plot(time, y_t), legend('Output');
xlabel('Time [s]');
