% File: BioimpedanceAnalysis.m
% This script performs analysis on a bio-impedance dataset, demonstrating 
% the calculation of resistance, force, pressure, and filtering methods.

clear
close all
clc

% Load the provided BCG dataset
load('goodbcg1.mat')

% Define constants for the experiment
area = 40*40e-6;
ref_resistance = 2.2e3;
measurement_duration = 25;

% Remove the first 5 seconds of data to avoid initial transients
data(1:fs*5) = [];
Vref(1:fs*5) = [];

% Define the time vector 
time = ((1:fs*measurement_duration)/fs)';

% Compute the resistance value using the provided formula
resistance = ref_resistance./(Vref./data - 1); 

% Convert physical units for further calculations
Pa_to_mmHg = 0.0075006156130264;
mmHg_to_cmH2O = 1.3595100263597;

% Compute the force value
force = (10.^((log10(resistance)-5.146)/(-0.684)))/100;

% Compute the pressure value
pressure = force/area*Pa_to_mmHg;

% Plot the calculated resistance and pressure values over time
figure,
subplot(2,1,1), plot(time, resistance), legend('Measured resistance values');
ylabel('Resistance [Ohm]');
subplot(2,1,2), plot(time, pressure), legend('Pressure');
ylabel('Pressure [mmHg]');
xlabel('Time [s]');

% Decimate the computed values and the time vector by a factor of 10 
resistance_dec = decimate(resistance,10,'fir');
force_dec = decimate(force,10,'fir');
pressure_dec = decimate(pressure,10,'fir');
time_dec = decimate(time,10,'fir');
fs = fs/10;

% Filter the decimated values using a Butterworth bandpass filter
[bp_b, bp_a] = butter(3, [0.7 8]/(fs/2));
resistance_filt = filtfilt(bp_b, bp_a, resistance_dec);
force_filt = filtfilt(bp_b, bp_a, force_dec);
pressure_filt = filtfilt(bp_b, bp_a, pressure_dec);

% Compute the estimated thickness based on the filtered pressure
thickness_est = (1./(pressure_filt+1e2)).^2;

% Plot the filtered resistance and pressure, and estimated thickness
figure,
subplot(2,1,1), plot(time_dec, resistance_filt), title('Filtered'), legend('Measured resistance values');
ylabel('Resistance [Ohm]');
subplot(2,1,2), plot(time_dec, force_filt), legend('Pressure');
ylabel('Pressure [mmHg]');
xlabel('Time [s]');

figure, 
subplot(3,1,1), 
plot(time_dec, pressure_dec, 'LineWidth', 2), title('Pressure on Electrodes'),ylabel('Pressure [mmHg]');
subplot(3,1,2),
plot(time_dec, pressure_filt, 'LineWidth', 2),
ylabel('Pressure [mmHg]'), xlim([4 13]), legend('Filter & Zoom');
subplot(3,1,3),
plot(time_dec, thickness_est, 'LineWidth', 2),
ylabel('Thickness [a.u.]'), xlabel('Time [s]'), xlim([4 13]), legend('Estimated thickness');
