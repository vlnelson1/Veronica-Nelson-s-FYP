disp('defining output parameters');

sampled_electric_fields = [];
sampled_magnetic_fields = [];
sampled_transient_E_planes = [];
sampled_frequency_E_planes = [];

% figure refresh rate
plotting_step = 10;

% frequency domain parameters
frequency_domain.start = 3e3; %VLF start
frequency_domain.end   = 25e3; %VLF end
frequency_domain.step  = (25e3 - 3e3)/number_of_time_steps; %1kHz
r = 6371e3+100; 
    
for j=1:300
    angles = linspace(0, 2*pi,300);
    radius = r;
    xCenter = 0;
    yCenter = 0;
    x = radius * cos(angles(j)) + xCenter; 
    y = radius * sin(angles(j)) + yCenter;
    sampled_electric_fields(j).x = -x
    sampled_electric_fields(j).y = y
    sampled_electric_fields(j).component = 'z';
    sampled_electric_fields(j).display_plot = false;
end 

% define sampled electric field distributions
% component can be 'x', 'y', 'z', or 'm' (magnitude)
% transient
sampled_transient_E_planes(1).component = 'z';

% frequency domain
sampled_frequency_E_planes(1).component = 'z';
sampled_frequency_E_planes(1).frequency = 1e3; %1kHz

draw_domain.enable = true;
draw_domain.draw_axis = false;
draw_domain.draw_grid = false;
