disp('initializing the output parameters');

number_of_sampled_electric_fields  = size(sampled_electric_fields,2);
number_of_sampled_magnetic_fields  = size(sampled_magnetic_fields,2);
number_of_sampled_transient_E_planes=size(sampled_transient_E_planes,2);
number_of_sampled_frequency_E_planes=size(sampled_frequency_E_planes,2);

% intialize frequency domain parameters
frequency_domain.frequencies = [frequency_domain.start: ...
    frequency_domain.step:frequency_domain.end];
frequency_domain.number_of_frequencies = ...
    size(frequency_domain.frequencies,2);

% initialize sampled electric field terms
for ind=1:number_of_sampled_electric_fields  
    is = round((sampled_electric_fields(ind).x - fdtd_domain.min_x)/dx)+1;
    js = round((sampled_electric_fields(ind).y - fdtd_domain.min_y)/dy)+1;
    sampled_electric_fields(ind).is = is;
    sampled_electric_fields(ind).js = js;
    sampled_electric_fields(ind).sampled_value = ...
        zeros(1, number_of_time_steps);
    sampled_electric_fields(ind).time = ([1:number_of_time_steps])*dt;
end

% initialize sampled magnetic field terms
for ind=1:number_of_sampled_magnetic_fields  
    is = round((sampled_magnetic_fields(ind).x - fdtd_domain.min_x)/dx)+1;
    js = round((sampled_magnetic_fields(ind).y - fdtd_domain.min_y)/dy)+1;
    sampled_magnetic_fields(ind).is = is;
    sampled_magnetic_fields(ind).js = js;
    sampled_magnetic_fields(ind).sampled_value = ...
        zeros(1, number_of_time_steps);
    sampled_magnetic_fields(ind).time = ([1:number_of_time_steps]-0.5)*dt;
end

% initialize sampled transient electric field 
for ind=1:number_of_sampled_transient_E_planes  
    sampled_transient_E_planes(ind).figure = figure;
end

% initialize sampled time harmonic electric field
for ind=1:number_of_sampled_frequency_E_planes  
    sampled_frequency_E_planes(ind).sampled_field = zeros(nxp1,nyp1);
end
xcoor = linspace(fdtd_domain.min_x,fdtd_domain.max_x,nxp1);
ycoor = linspace(fdtd_domain.min_y,fdtd_domain.max_y,nyp1);
