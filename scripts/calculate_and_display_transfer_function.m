function [freq, mag, phi, delay] = calculate_and_display_transfer_function(x_t, y_t, Fs, Fmin, Fmax)
% Calculate and plot the transfer function of two input signals
%
% Inputs:
%   x_t: the first input signal
%   y_t: the second input signal
%   Fs: the sampling frequency (optional, default = 1000Hz)
%   Fmin: the minimum frequency of interest (optional, default = 1Hz)
%   Fmax: the maximum frequency of interest (optional, default = 400Hz)
%
% Outputs:
%   freq: the frequency vector
%   mag: the magnitude of the transfer function
%   phi: the phase of the transfer function
%   delay: the group delay of the transfer function

% Default values for optional parameters
if ~exist('Fs', 'var') || isempty(Fs)
    Fs = 1000;
end
if ~exist('Fmin', 'var') || isempty(Fmin)
    Fmin = 1;
end
if ~exist('Fmax', 'var') || isempty(Fmax)
    Fmax = 400;
end

% Transpose signals if necessary
if size(x_t,1) < size(x_t,2)
    x_t = x_t';
end
if size(y_t,1) < size(y_t,2)
    y_t = y_t';
end

% Compute the FFT and get the magnitude and phase for each signal
[~, x_mag, x_phi] = FastFourierTransformAnalysis(x_t, Fs, 2,0,1);
[freq, y_mag, y_phi] = FastFourierTransformAnalysis(y_t, Fs, 2,0,1);

% Compute the magnitude and phase of the transfer function
mag = y_mag - x_mag;
phi = y_phi - x_phi;

% Compute the group delay
delay = 0.5*([0; -1*diff(phi)]+[-1*diff(phi); 0])/(freq(2))/360;    % in s

% Plot the transfer function
figure,
subplot(3,1,1)
semilogx(freq, mag, 'k'), title('Transfer Function');
xlim([Fmin*1.1 Fmax*0.95]);
ylabel('Power Spectrum [dB/Hz]');
set(gca, 'FontSize', 12)
grid on;

subplot(3,1,2)
semilogx(freq, phi, 'k');
xlim([Fmin*1.1 Fmax*0.95]);
ylabel('Phase (°)');
set(gca, 'FontSize', 12)
grid on;

subplot(3,1,3)
semilogx(freq, delay*1e3, 'k');
xlim([Fmin*1.1 Fmax*0.95]);
xlabel('Frequency [Hz]');
ylabel('Group Delay (ms)');
set(gca, 'FontSize', 12)
grid on;
end
