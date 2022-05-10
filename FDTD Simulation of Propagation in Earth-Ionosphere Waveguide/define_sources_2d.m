disp('defining sources');

impressed_J = [];
impressed_M = [];

% define source waveform types and parameters
waveforms.gaussian(1).number_of_cells_per_wavelength = 0; 
waveforms.sinusoidal(1).frequency =24000; 
% waveforms.sinusoidal(2).frequency =19800; 

%Maine, USA Source 
impressed_J(1).min_x = -6371100;
impressed_J(1).min_y = 0;
impressed_J(1).max_x = -6371600;
impressed_J(1).max_y = 10; 
impressed_J(1).direction = 'zp';
impressed_J(1).magnitude = 1.4*1450;
impressed_J(1).waveform_type = 'sinusoidal';
impressed_J(1).waveform_index = 1;







