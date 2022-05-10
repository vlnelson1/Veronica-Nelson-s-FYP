% displaying sampled parameters

if mod(time_step,plotting_step) ~= 0   
    return;
end

disp([num2str(time_step) ' of ' ...
    num2str(number_of_time_steps) ' is completed.']) ; 

% display sampled electric fields
for ind = 1:number_of_sampled_electric_fields
    if sampled_electric_fields(ind).display_plot == true
%     sampled_time = sampled_electric_fields(ind).time(1:time_step)*1e9;
    sampled_time = sampled_electric_fields(ind).time(1:time_step)
    sampled_value = sampled_electric_fields(ind).sampled_value(1:time_step);
    figure(sampled_electric_fields(ind).figure_number);
    delete(sampled_electric_fields(ind).plot_handle);
    sampled_electric_fields(ind).plot_handle = ...
    plot(sampled_time, sampled_value(1:time_step),'b-','linewidth',1.5);
    drawnow;
    end
end

% display sampled magnetic fields
for ind = 1:number_of_sampled_magnetic_fields
    if sampled_magnetic_fields(ind).display_plot == true
    sampled_time = sampled_magnetic_fields(ind).time(1:time_step)*1e9;
    sampled_value = sampled_magnetic_fields(ind).sampled_value(1:time_step);
    figure(sampled_magnetic_fields(ind).figure_number);
    delete(sampled_magnetic_fields(ind).plot_handle);
    sampled_magnetic_fields(ind).plot_handle = ...
    plot(sampled_time, sampled_value(1:time_step),'b-','linewidth',1.5);
    drawnow;
    end
end

%%
% display sampled electric field distribution
for ind=1:number_of_sampled_transient_E_planes  
    %while running:
%     figure %new figure for each step
    figure(sampled_transient_E_planes(ind).figure);
    Es = zeros(nxp1, nyp1);    
    component = sampled_transient_E_planes(ind).component;
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
    imagesc(xcoor,ycoor,Es.');
    axis equal; axis xy; colorbar; 
    title(['Electric field <' component '>[' num2str(ind) ']']);
    drawnow;
end

