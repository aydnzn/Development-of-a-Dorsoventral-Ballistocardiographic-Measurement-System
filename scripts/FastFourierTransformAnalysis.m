function [freq, mag, phi] = FastFourierTransformAnalysis(x, Fs, N, fig, smoothing)
% FastFourierTransformAnalysis(x, Fs, N, fig, smoothing)
% This function computes the magnitude and phase spectrums of a signal using FFT.
%
% Inputs:
% x - The input signal
% Fs - The sampling frequency
% N - Zero padding parameter; if unsure, set to 0
% fig - Set to 1 if you want to plot the spectrum, otherwise set to 0
% smoothing - Set to 1 to apply a moving average filter on the spectrum, otherwise set to 0
%
% Outputs:
% freq - Frequency vector
% mag - Magnitude spectrum in dB/Hz
% phi - Phase spectrum in degrees

% Handle the default parameter cases
if nargin < 5, smoothing = 0; end
if nargin < 4, fig = 0; end
if nargin < 3, N = 0; end
if nargin < 2, Fs = 1000; end

% Ensure the signal is a column vector
if size(x,1) < size(x,2), x = x'; end

% Calculate the FFT of the signal with Hamming window and zero padding
lpad = pow2(N+nextpow2(length(x)));
xdft = fft(x.*hamming(length(x)),lpad);
xdft = xdft(1:lpad/2+1);
xdft = xdft/length(x);
xdft(2:end-1) = 2*xdft(2:end-1);

% Calculate the magnitude and phase spectrums
mag = 20*log10(abs(xdft));
freq = (0:Fs/lpad:Fs/2)';
phi = unwrap(angle(xdft))*180/pi;

% Apply smoothing if specified
if smoothing ~= 0
    b_ma = ones(ceil(length(mag)/(Fs/2)*0.5),1)/ceil(length(mag)/(Fs/2)*0.5);
    mag = filtfilt(b_ma,1,mag);
    phi = filtfilt(b_ma,1,phi);
end

% Plot the magnitude and phase spectrums if specified
if fig ~= 0
    figure,
    subplot(2,1,1),
    semilogx(freq, mag, 'k'), title(strcat('Zero-padded FFT with N=',num2str(N)));
    ylabel('Power Spectrum [dB/Hz]');
    xlim([0.5 Fs/2-10]);
    set(gca, 'FontSize', 12);
    grid on;
    
    subplot(2,1,2),
    semilogx(freq, phi, 'r');
    xlim([0.5 Fs/2-10]);
    set(gca, 'FontSize', 12);
    ylabel('Phase [°]');
    xlabel('Frequency [Hz]');
    grid on;
end
end
