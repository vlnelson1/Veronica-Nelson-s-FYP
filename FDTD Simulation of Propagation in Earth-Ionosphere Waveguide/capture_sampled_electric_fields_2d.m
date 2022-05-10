% Capturing electric fields

for ind=1:number_of_sampled_electric_fields
    is = sampled_electric_fields(ind).is;
    js = sampled_electric_fields(ind).js;

    switch (sampled_electric_fields(ind).component)
        case 'x'
            sampled_value = 0.5 * sum(Ex(is-1:is,js)); 
        case 'y'
            sampled_value = 0.5 * sum(Ey(is,js-1:js)); 
        case 'z'
            sampled_value = 1.0 * Ez(is,js); 
        case 'm'
            svx = 0.5 * sum(Ex(is-1:is,js)); 
            svy = 0.5 * sum(Ey(is,js-1:js)); 
            svz = 1.0 * Ez(is,js); 
            sampled_value = sqrt(svx^2 + svy^2 + svz^2);
    end
    sampled_electric_fields(ind).sampled_value(time_step) = sampled_value;
end

% capture sampled time harmonic electric fields on a plane
if time_step>6000
    for ind=1:number_of_sampled_frequency_E_planes  
        Es = zeros(nxp1, nyp1);    
        component = sampled_frequency_E_planes(ind).component;
        switch (component)
            case 'x'
                Es(2:nx,:) = 0.5 * (Ex(1:nx-1,:) + Ex(2:nx,:)); 
            case 'y'
                Es(:,2:ny) = 0.5 * (Ey(:,1:ny-1) + Ey(:,2:ny)); 
            case 'z'
                Es = Ez;
            case 'm'
                Exs(2:nx,:) = 0.5 * (Ex(1:nx-1,:) + Ex(2:nx,:)); 
                Eys(:,2:ny) = 0.5 * (Ey(:,1:ny-1) + Ey(:,2:ny)); 
                Ezs = Ez;
                Es = sqrt(Exs.^2 + Eys.^2 + Ezs.^2);
        end
        I = find(Es > sampled_frequency_E_planes(ind).sampled_field); 
        sampled_frequency_E_planes(ind).sampled_field(I) = Es(I);
    end
end
