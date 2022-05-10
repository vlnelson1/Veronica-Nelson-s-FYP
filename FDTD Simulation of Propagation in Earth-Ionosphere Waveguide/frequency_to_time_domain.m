function [x] = frequency_to_time_domain(X, df, time_array)
% X  : array including the sampled values at discrete frequency steps
% df : sampling period in frequency domain
% time_array : list of time steps for which inverse transform is performed

number_of_frequencies  = size(X,2);
number_of_time_points = size(time_array,2);
x = zeros(1, number_of_time_points);
dw = 2 * pi * df;
x = X(1); % zero frequency component
for m = 2:number_of_frequencies
    w = (m-1) * dw;
    x = x + X(m)* exp(j*w*time_array)+ conj(X(m)) * exp(-j*w*time_array);
end 
x = x * df;
