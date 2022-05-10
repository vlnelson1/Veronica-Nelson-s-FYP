%%source power check 

A=impressed_J(1).magnitude
source1 = A * sin(2 * pi * waveforms.sinusoidal(1).frequency * time);
L=length(source1)
omega= 2 * pi * waveforms.sinusoidal(1).frequency;
%%average power
N = number_of_time_steps; %  let say you want to average 
        %  10 terms of x
px = zeros(1,L);
for n = 1:N
    px = px + (abs(A*sin(n*omega*time))).^2;
end
px = (1/(2*N+1))*px;
avgpower = ((sum(px, 'all')) / N)/1e3
