disp('initializing source waveforms');

% initialize sinusoidal waveforms
if isfield(waveforms,'sinusoidal')
    for ind=1:size(waveforms.sinusoidal,2)
        waveforms.sinusoidal(ind).waveform = ...
            sin(2 * pi * waveforms.sinusoidal(ind).frequency * time);
    end
end

% initialize unit step waveforms
if isfield(waveforms,'unit_step')
    for ind=1:size(waveforms.unit_step,2)
        start_index = waveforms.unit_step(ind).start_time_step;
        waveforms.unit_step(ind).waveform(1:number_of_time_steps) = 1;
        waveforms.unit_step(ind).waveform(1:start_index-1) = 0;
    end
end

% initialize Gaussian waveforms
if isfield(waveforms,'gaussian')
    for ind=1:size(waveforms.gaussian,2)
        if waveforms.gaussian(ind).number_of_cells_per_wavelength == 0
            nc = number_of_cells_per_wavelength;
        else
            nc = waveforms.gaussian(ind).number_of_cells_per_wavelength;
        end
        waveforms.gaussian(ind).maximum_frequency = c/(nc*max([dx,dy]));
        tau = (nc*max([dx,dy]))/(2*c);
        waveforms.gaussian(ind).tau = tau;
        t_0 = 4.5 * waveforms.gaussian(ind).tau;
        waveforms.gaussian(ind).t_0 = t_0;
        waveforms.gaussian(ind).waveform = exp(-((time - t_0)/tau).^2);
    end
end

% initialize derivative of Gaussian waveforms
if isfield(waveforms,'derivative_gaussian')
    for ind=1:size(waveforms.derivative_gaussian,2)
    if waveforms.derivative_gaussian(ind).number_of_cells_per_wavelength == 0
        nc = number_of_cells_per_wavelength;
    else
        nc = ...
            waveforms.derivative_gaussian(ind).number_of_cells_per_wavelength;
    end
    waveforms.derivative_gaussian(ind).maximum_frequency = ...
        c/(nc*max([dx,dy]));
    tau = (nc*max([dx,dy]))/(2*c);
    waveforms.derivative_gaussian(ind).tau = tau;
    t_0 = 4.5 * waveforms.derivative_gaussian(ind).tau;
    waveforms.derivative_gaussian(ind).t_0 = t_0;
    waveforms.derivative_gaussian(ind).waveform = ...
        -(sqrt(2*exp(1))/tau)*(time - t_0).*exp(-((time - t_0)/tau).^2);
    end
end

% initialize cosine modulated Gaussian waveforms
if isfield(waveforms,'cosine_modulated_gaussian')
    for ind=1:size(waveforms.cosine_modulated_gaussian,2)
        frequency = ...
            waveforms.cosine_modulated_gaussian(ind).modulation_frequency;
        tau = 0.966/waveforms.cosine_modulated_gaussian(ind).bandwidth;
        waveforms.cosine_modulated_gaussian(ind).tau = tau;
        t_0 = 4.5 * waveforms.cosine_modulated_gaussian(ind).tau;
        waveforms.cosine_modulated_gaussian(ind).t_0 = t_0;
        waveforms.cosine_modulated_gaussian(ind).waveform = ...
            cos(2*pi*frequency*(time - t_0)).*exp(-((time - t_0)/tau).^2);
    end
end
