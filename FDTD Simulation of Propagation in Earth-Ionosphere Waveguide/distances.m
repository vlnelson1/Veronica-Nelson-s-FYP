
FF= 3342;
sourceinarray = [24000.5714285714];
num = 3500;

arclength = [];
fdvals(1) = mag2db(abs(frequencyvalues(FF,1)));
%% Plotting Signal vs Distance
figure
for ind=1:number_of_sampled_electric_fields 
    angleR = angles(ind);
    arc = angleR *(6371e3);
    arclength(ind+1) = arc/1e3;
    fd_value2 = mag2db(abs(frequencyvalues(FF,ind))); %%need to change the time steps so we have exact frequency tho! but just updating for now
    fd_value3 = angle((frequencyvalues(FF,ind)))*180/pi;
    fdvals(ind+1,:) = fd_value2;
    phases(ind+1,:) = fd_value3;
    subplot(2,1,1);
    line([arclength(ind), arclength(ind+1)], [fdvals(ind), fd_value2], 'Color', 'w');
    plot([arclength(ind),arclength(ind+1)], [fdvals(ind), fd_value2], 'm-', 'LineWidth', 1);
    title(['Unperturbed Ionosphere - Sampled Electric Field vs Distance from 24kHz Source']);
    xlabel('Distance from source (km)','fontsize',10);
    ylabel('Signal Magnitude (dB)','fontsize',10);
    legend('24kHz Signal')
%     axis([0 (4.003017359204114e+07)/1e3 -5000 100])
%     axis([0 8000 -600 100])
%     axis([0 5500 -200 100])
	axis([0 1200 -200 100])
    hold on;
    subplot(2,1,2);
    line([arclength(ind), arclength(ind+1)], [phases(ind), fd_value3], 'Color', 'w');
    plot([arclength(ind),arclength(ind+1)], [phases(ind), fd_value3], 'b-', 'LineWidth', 1);
%     title(['Unperturbed Ionosphere - Phase of Sampled Electric Field vs Distance from 24kHz Source']);
    xlabel('Distance from source (km)','fontsize',10);
    ylabel('Signal Phase (degrees)','fontsize',10);
    legend('24kHz Signal')
%     axis([0 (4.003017359204114e+07)/1e3 -200 200])
%      axis([0 8000 -200 200])
%       axis([0 5500 -200 200])
    axis([0 1200 -200 200])
    hold on;
end

%% 

for ind=1:number_of_sampled_electric_fields 
    %when using data loaded in 
    sampled_time = sampled_electric_fields(ind).time(1:num);
    sampled_value = sampled_electric_fields(ind).sampled_value(1:num);
    frequencyvalue = sampled_electric_fields(ind).frequency_domain_value
    w = 2 * pi *sourceinarray; %at this frequency (has to be in frequency array!)
    for n = 1:num %number of time steps
        t = sampled_time(:,n);
        signaltimedomain = sampled_value(:,n) * exp(-1i*w*t); %transforming to frequency of our signal 
        signalfreqval = mag2db(abs(signaltimedomain));
        signalfreqvals(:,n) = signalfreqval;
    end
    figure 
    plot (sampled_time, signalfreqvals,'r-', 'LineWidth', 0.25); %plotting how signal changes over time at that station in time domain
    title(['Time vs Signal Amplitude at Measurement Station ' num2str(ind) ' ']);
    xlabel('Time Sampled (s)');
    ylabel('Signal Magnitude (dB)');
end