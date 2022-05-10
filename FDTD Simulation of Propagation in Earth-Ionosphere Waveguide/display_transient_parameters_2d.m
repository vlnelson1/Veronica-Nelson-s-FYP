disp('plotting the transient parameters');

% figures for sampled electric fields
for ind=1:number_of_sampled_electric_fields 
    if sampled_electric_fields(ind).display_plot == false
        sampled_electric_fields(ind).figure_number = figure;
        xlabel('time (ns)','fontsize',12);
        ylabel('(volt/meter)','fontsize',12);
        title(['sampled electric field [' num2str(ind) ']'],'fontsize',12);
        grid on; hold on;
    else
        figure(sampled_electric_fields(ind).figure_number);
        delete(sampled_electric_fields(ind).plot_handle);
    end
    sampled_time = sampled_electric_fields(ind).time(1:time_step);
    sampled_value = sampled_electric_fields(ind).sampled_value(1:time_step);
    plot(sampled_time, sampled_value(1:time_step),'b-','linewidth',1.5);
    drawnow;
end

% figures for sampled magnetic fields
for ind=1:number_of_sampled_magnetic_fields
    if sampled_magnetic_fields(ind).display_plot == false
        sampled_magnetic_fields(ind).figure_number = figure;
        xlabel('time (ns)','fontsize',12);
        ylabel('(ampere/meter)','fontsize',12);
        title(['sampled magnetic field [' num2str(ind) ']'],'fontsize',12);
        grid on; hold on;
    else
        figure(sampled_magnetic_fields(ind).figure_number);
        delete(sampled_magnetic_fields(ind).plot_handle);
    end
    sampled_time = sampled_magnetic_fields(ind).time(1:time_step)*1e9;
    sampled_value = sampled_magnetic_fields(ind).sampled_value(1:time_step);
    plot(sampled_time, sampled_value(1:time_step),'b-','linewidth',1.5);
    drawnow;
end
