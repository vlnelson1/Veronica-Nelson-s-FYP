disp('initializing sources');

number_of_impressed_J = size(impressed_J,2);
number_of_impressed_M = size(impressed_M,2);

% initialize waveforms
initialize_waveforms;

% electric current sources
for ind = 1:number_of_impressed_J
    is = round((impressed_J(ind).min_x - fdtd_domain.min_x)/dx)+1;
    js = round((impressed_J(ind).min_y - fdtd_domain.min_y)/dy)+1;
    ie = round((impressed_J(ind).max_x - fdtd_domain.min_x)/dx)+1;
    je = round((impressed_J(ind).max_y - fdtd_domain.min_y)/dy)+1;
    impressed_J(ind).is = is;
    impressed_J(ind).js = js;
    impressed_J(ind).ie = ie;
    impressed_J(ind).je = je;

    if strcmp(impressed_J(ind).direction(2),'n')
        j_magnitude_factor = -1*impressed_J(ind).magnitude;
    else
        j_magnitude_factor =  impressed_J(ind).magnitude;
    end

    % copy waveform of the waveform type to waveform of the source 
    wt_str = impressed_J(ind).waveform_type;
    wi_str = num2str(impressed_J(ind).waveform_index);
    eval_str = ['a_waveform = waveforms.' wt_str '(' wi_str ').waveform;'];
    eval(eval_str);
    impressed_J(ind).waveform = j_magnitude_factor * a_waveform;
end

% magnetic current sources
for ind = 1:number_of_impressed_M
    is = round((impressed_M(ind).min_x - fdtd_domain.min_x)/dx)+1;
    js = round((impressed_M(ind).min_y - fdtd_domain.min_y)/dy)+1;
    ie = round((impressed_M(ind).max_x - fdtd_domain.min_x)/dx)+1;
    je = round((impressed_M(ind).max_y - fdtd_domain.min_y)/dy)+1;
    impressed_M(ind).is = is;
    impressed_M(ind).js = js;
    impressed_M(ind).ie = ie;
    impressed_M(ind).je = je;

    if strcmp(impressed_M(ind).direction(2),'n')
        m_magnitude_factor = -1*impressed_M(ind).magnitude;
    else
        m_magnitude_factor =  impressed_M(ind).magnitude;
    end

    % copy waveform of the waveform type to waveform of the source 
    wt_str = impressed_M(ind).waveform_type;
    wi_str = num2str(impressed_M(ind).waveform_index);
    eval_str = ['a_waveform = waveforms.' wt_str '(' wi_str ').waveform;'];
    eval(eval_str);
    impressed_M(ind).waveform = m_magnitude_factor * a_waveform;
end

% determine if TEz or TMz
is_TEz = false;
is_TMz = false;
for ind = 1:number_of_impressed_J
    switch impressed_J(ind).direction(1)
        case 'x'
            is_TEz = true;
        case 'y'
            is_TEz = true;
        case 'z'
            is_TMz = true;
    end
end
for ind = 1:number_of_impressed_M
    switch impressed_M(ind).direction(1)
        case 'x'
            is_TMz = true;
        case 'y'
            is_TMz = true;
        case 'z'
            is_TEz = true;
    end
end
