function C_test = DemodulateAndInterpolate(raw,Fc,Fs,V_excitation,C_ref,N_WAVE)
% This function performs Quadrature Amplitude Modulation (QAM) demodulation 
% and interpolation on the given raw signal. It also computes the test capacitance (C_test).

% Assign default values to optional parameters if they're not provided
if ~exist('N_WAVE', 'var') || isempty(N_WAVE)
    N_WAVE = 10;
end
if ~exist('V_excitation', 'var') || isempty(V_excitation)
    V_excitation = 1;
end
if ~exist('C_ref', 'var') || isempty(C_ref)
    C_ref = 150e-12;
end

% Create the time vector
time = (0:1/Fs:(length(raw)-1)/Fs)';

% Initialize output variables
amplitude_ratio = [];
time_instances = [];
STEP = floor(Fs/1000);
WINDOW = 1 + N_WAVE*Fs/Fc;

% Iterate over the signal with a step size determined by the sampling frequency
for i = 1:(floor((length(raw)-WINDOW)/STEP)-1)
    % Update time instances
    time_instances = [time_instances; time(STEP*(i-1)+(WINDOW-1)/2+1)];
    % Get the sample of the raw signal for the current window
    imp_sample = raw((STEP*(i-1)+1):(STEP*(i-1)+WINDOW));
    % Update the amplitude ratio
    amplitude_ratio = [amplitude_ratio ...
        sqrt(bandpower(imp_sample, Fs, [Fc-0.1 Fc+0.1])*2)/V_excitation];
end

% Compute the test capacitance (C_test)
C_test = C_ref * amplitude_ratio ./ (1 - amplitude_ratio);

% Interpolate the C_test values over the time vector
C_test = interp1(time_instances, C_test, time);

% Replace any NaN values in C_test with the mean of C_test
C_test(isnan(C_test)) = mean(C_test(floor(length(C_test)/2)));
end
