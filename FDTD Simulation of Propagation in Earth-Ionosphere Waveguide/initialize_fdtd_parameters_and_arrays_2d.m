disp('initializing FDTD parameters and arrays');

% constant parameters
eps_0 = 8.854187817e-12; % permittivity of free space               
mu_0  = 4*pi*1e-7; % permeability of free space                    
c = 1/sqrt(mu_0*eps_0); % speed of light in free space

% Duration of a time step in seconds
dt = 1/(c*sqrt((1/dx^2)+(1/dy^2)));
dt = courant_factor*dt;

% time array
time = ([1:number_of_time_steps]-0.5)*dt;

% Create and initialize field and current arrays
disp('creating field arrays');

Hx = zeros(nxp1,ny);   
Hy = zeros(nx,nyp1);   
Hz = zeros(nx,ny);
Ex = zeros(nx,nyp1);
Ey = zeros(nxp1,ny);
Ez = zeros(nxp1,nyp1);
