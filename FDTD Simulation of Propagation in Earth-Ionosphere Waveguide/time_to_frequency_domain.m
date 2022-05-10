function [X] = time_to_frequency_domain(x, dt, frequency_array, time_shift)
% x  : array including the sampled values at discrete time steps
% dt : sampling period, duration of an FDTD time step
% frequency_array : list of frequencies for which transform is performed
% time_shift : a value in order to account for the time shift between 
% electric and magnetic fields

number_of_time_steps  = size(x,2);
number_of_frequencies = size(frequency_array,2);
X = zeros(1, number_of_frequencies);
w = 2 * pi * frequency_array;
for n = 1:number_of_time_steps
    t = n * dt + time_shift;
    X = X + x(n) * exp(-j*w*t);
end
X = X * dt;
