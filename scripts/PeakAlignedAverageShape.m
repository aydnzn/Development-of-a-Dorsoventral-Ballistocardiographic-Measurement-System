% PeakAlignedAverageShape
%
% This function takes a signal and corresponding peak locations. It segments the
% signal, aligns them w.r.t. the given peaks, and calculates the average shape
% and standard deviation (std) of the resulting segments.
%

function [signal_mean, signal_std] = PeakAlignedAverageShape(signal, peaks, Fs, window)
    % Check if mandatory arguments 'signal' and 'peaks' are provided
    if ~exist('signal', 'var') || ~exist('peaks', 'var')
        error('Both "signal" and "peaks" arguments must be provided');
    end

    % Set default values for optional arguments if they are not provided
    if ~exist('Fs', 'var') || isempty(Fs)
        Fs = 1000;  % Default sampling frequency
    end

    if ~exist('window', 'var') || isempty(window)
        window = 200;  % Default window length in milliseconds
    end

    % Check if window is a single value or a two-element vector
    if length(window) == 1
        window_left = window;
        window_right = window;
    else
        window_left = window(1);
        window_right = window(2);
    end

    % Convert window lengths from milliseconds to number of samples
    WINDOW_LEFT_LENGTH = ceil(window_left/1000*Fs);
    WINDOW_RIGHT_LENGTH = ceil(window_right/1000*Fs);

    % Preallocate space for segments for speed
    segments = zeros(length(peaks),WINDOW_LEFT_LENGTH+WINDOW_RIGHT_LENGTH+1);

    % Loop over all peaks
    for i = 1:length(peaks)
        % Only include segments that are fully within the signal
        if peaks(i)-WINDOW_LEFT_LENGTH >= 1 && peaks(i)+WINDOW_RIGHT_LENGTH <= length(signal)
            segments(i,:) = signal(peaks(i)-WINDOW_LEFT_LENGTH:peaks(i)+WINDOW_RIGHT_LENGTH);
        end
    end

    % Remove zero rows that were not filled
    segments( ~any(segments,2), : ) = [];

    % Calculate mean and standard deviation of the segments
    signal_mean = mean(segments);
    signal_std = std(segments);
end
