disp('defining the problem geometry');

rectangles  = [];
circles = [];

% Earth
circles(1).center_x = 0;
circles(1).center_y = 0;
circles(1).radius   = 6371e3; %km 
circles(1).material_type = 6; %earth 

% Earth-Ionosphere Waveguide (From earth surface to waveguide reflection height from literature,
% it is typically around 70 km
centerX = 0;
centerY = 0;
innerRadius = 6371e3; 
outerRadius = 6441000;
ringmaterial_type =1; %it is just air 1

% Upper boundary of the waveguide: The ionosphere
%D layer - E layer height
%ring to prevent leakage from waveguide 
centerX2 = 0;
centerY2 = 0;
innerRadius2 = 6441000;
outerRadius2 = 6479e3;
ringmaterial_type2 = 7;%ionosphere parameters 7


