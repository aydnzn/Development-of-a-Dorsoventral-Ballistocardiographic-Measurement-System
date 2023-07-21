% File: RefinePeakLocations.m
% This function refines the locations of detected peaks in a signal. It 
% examines a window around each peak and identifies the maximum value within 
% that window, which is taken as the refined peak location.

function refinedPeaks = RefinePeakLocations(inputSignal, initialPeaks, samplingRate, windowSize)

% inputSignal: The signal in which the peaks are to be located
% initialPeaks: Initial estimates for the peak locations
% samplingRate: The sampling rate of the signal (in Hz), default is 1000 Hz
% windowSize: The size of the window to examine around each peak (in ms), default is 50 ms

% Check if the sampling rate and window size are provided, otherwise set default values
if ~exist('samplingRate', 'var')
    samplingRate = 1000;  % in Hz
end
if ~exist('windowSize', 'var')
    windowSize = 50;  % in ms
end

% Compute the length of the window in terms of samples
windowLengthSamples = 2 * floor((ceil(windowSize/1000 * samplingRate))/2);

% Loop over each initial peak location
for i = 1:length(initialPeaks)
    % If the window does not exceed the signal length
    if initialPeaks(i) + windowLengthSamples/2 <= length(inputSignal)
        % Extract the window around the peak
        windowedSignal = inputSignal(initialPeaks(i)-windowLengthSamples:initialPeaks(i)+windowLengthSamples/2);
        
        % Find the maximum value in the window
        [~, maxIdx] = max(windowedSignal);
        
        % Adjust the peak location based on the location of the maximum
        refinedPeaks(i) = initialPeaks(i) - windowLengthSamples - 1 + maxIdx;
    end
end
