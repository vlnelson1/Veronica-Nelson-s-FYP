%% My initial Earth Parameters
%Assume propagation over just soil for right now - this assumption can be
%This is the command to show the example 
%openExample('spc_channel/PermittivityOfVariousSoilMixturesExample') %to pull up in search bar

fc = 25e3; % Frequency in Hz
temp = 23; % Temperature in °C
vwc = 0.5; % Volumetric water content
pSand = [51.52; 41.96; 30.63; 5.02]; % Sand percentage
pClay = [13.42; 8.53; 13.48; 47.38]; % Clay percentage
sg = [2.66; 2.70; 2.59; 2.56]; % Specific gravity
bd = [1.6006; 1.5781; 1.5750; 1.4758]; % Bulk density (g/cm^3)

[Permittivity,Conductivity] = arrayfun(@(w,x,y,z)earthSurfacePermittivity( ...
    'soil',fc,temp,w,x,y,vwc,z),pSand,pClay,sg,bd);

pSilt = 100 - (pSand + pClay); % Silt percentage
soilType = ["Sandy Loam";"Loam";"Silty Loam";"Silty Clay"];
varNames1 = ["Soil Textual Classification";"Sand";"Clay";"Silt";"Specific Gravity";"Bulk Density"];
varNames2 = ["Soil Textual Classification";"Permittivity";"Conductivity"];

table(soilType,pSand,pClay,pSilt,sg,bd,'VariableNames',varNames1)

table(soilType,Permittivity,Conductivity,'VariableNames',varNames2)

