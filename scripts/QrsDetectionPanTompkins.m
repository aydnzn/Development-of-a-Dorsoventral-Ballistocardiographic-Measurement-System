function peaks = QrsDetectionPanTompkins(signal, Fs, fig, T)
% This function applies a simplified Pan-Tompkins QRS detection algorithm.
% It applies a bandpass filter of 12-30 Hz, then conducts a finer window extraction 
% and peak detection. If you want to visualize the process, provide a non-zero value 
% for the third input (fig). The threshold T can also be adjusted manually if the 
% plot implies a need for manual selection of the threshold.

% Check for optional inputs and assign default values if not provided
if ~exist('T', 'var') || isempty(T)
    T = 0.1;       
end
if ~exist('fig', 'var') || isempty(fig)
    fig = 0;       
end

% Ensure the signal is a row vector
if size(signal,1) > 1
    signal = signal';
end

Fs_qrs = 250;  % Some parameters are set to this Fs
signal_qrs = resample(signal, Fs_qrs, Fs);

%% Low-pass filter
signal_qrs = lowpass(signal_qrs, 30/(Fs_qrs/2));

%% High-pass filter
signal_qrs = highpass(signal_qrs, 12/(Fs_qrs/2));

% Standardize the signal
signal_qrs = (signal_qrs-mean(signal_qrs))/std(signal_qrs);

%% Differentiator
b = [2 1 0 -1 -2]/8;
signal_qrs = filtfilt(b, 1, signal_qrs);

%% Squaring operation
signal_qrs = signal_qrs.^2;

%% Moving average
b = ones(1,32)/32;
signal_qrs = filtfilt(b, 1, signal_qrs);

%% Peak detection
peaks = [];    % Found peaks
max_val = 0;   % Maximum value
max_idx = 0;   % Index of the maximum

% Iterate through all samples
for i = 2:length(signal_qrs)
    if signal_qrs(i) > max_val && signal_qrs(i) > T && signal_qrs(i) >= signal_qrs(i-1)
        % New peak candidate
        max_val = signal_qrs(i);
        max_idx = i;
    elseif signal_qrs(i) <= max_val/2 && max_idx ~= 0
        % Peak is detected (we store the location of the 50% point)
        peaks = [peaks i];
        max_idx = 0;
        max_val = 0;
    end
end

% Plot the processed signal and peaks if requested
if fig ~= 0
    figure, plot(signal_qrs), hold on, plot(peaks, signal_qrs(peaks), 'r*'), hold off;
end

% Convert the index of peaks back to the original sampling rate
peaks = ceil(peaks*Fs/Fs_qrs);

% Apply additional bandpass filtering on the original signal
signal = lowpass(signal, 40/(Fs/2));
signal = highpass(signal, 0.8/(Fs/2));

% Find peaks using the refined method
peaks = RefinePeakLocations(signal, peaks, Fs, 100);
end
