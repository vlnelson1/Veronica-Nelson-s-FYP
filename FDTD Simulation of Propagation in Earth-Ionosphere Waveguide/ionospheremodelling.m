 %% Perturbations 

 %Solar Eclipse 1 
Beta = 0.34; 
hprime = 74; %bound of waveguide %%idk what I set this value as 
h = 70;
%outerRadius = 6441000 + 4000
% sigma =5.6979e-07
% ep = 1.9583e+23

%Solar Eclipse 2 
Beta = 0.32; 
hprime = 73; %bound of waveguide %%idk what I set this value as 
h = 70;
%outerRadius = 6441000 + 3000
% sigma = 8.5002e-07
% ep = 2.3919e+23

%Cyclone 1
Beta = 0.3; 
hprime = 77.5; %bound of waveguide %%idk what I set this value as 
h = 70;
% sigma = 2.3399e-07
% ep =  2.6968e+23
%outerRadius = 6441000+7500


%Cyclone 2
Beta = 0.44; 
hprime = 80; %bound of waveguide %%idk what I set this value as 
h = 70;
% sigma = 2.7256e-08
% ep =   1.6400e+22
%outerRadius = 6441000+5021


%Geomagnetic Storm 1 
Beta = 0.3; 
hprime = 68.8; %bound of waveguide %%idk what I set this value as 
h = 70;
% sigma = 3.1820e-06
% ep = 2.6968e+23
%outerRadius = 6441000-1200


%Geomagnetic Storm 2
Beta = 0.29; 
hprime = 75.21; %bound of waveguide %%idk what I set this value as 
h =70;
% sigma = 4.8998e-07
% ep =  2.9930e+23
%outerRadius = 6441000+5021

%Earthquake 1
Beta = 0.3; 
hprime = 69; %bound of waveguide %%idk what I set this value as 
h = 70;
% sigma = 2.9967e-06
% ep = 2.6968e+23
%outerRadius = 6441000-1000

%Earthquake 2 
Beta = 0.3; 
hprime = 68.5; %bound of waveguide %%idk what I set this value as 
h =70;
% sigma = 3.4817e-06
% ep = 2.6968e+23
%outerRadius = 6441000-1500

%% Ionospheric Modelling

%unperturbed:
% Beta = 0.3; 
% hprime = 70; %bound of waveguide 
% h = 70;

%Wait's Params
Ne = (1.43e+7)*(exp(0.15*hprime))*(exp((Beta -0.15)*(h -hprime)))
ve = (1.816e+11)*exp(-0.15*h)
ep = Ne^2 
sigma = 2.22e-6*exp(Beta*(h-hprime))
