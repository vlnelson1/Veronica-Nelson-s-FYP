disp('creating spheres');

cx = fdtd_domain.cell_center_coordinates_x;
cy = fdtd_domain.cell_center_coordinates_y;

for ind=1:number_of_circles
%distance of the centers of the cells from the center of the circle
    distance = sqrt((circles(ind).center_x - cx).^2 ...
            + (circles(ind).center_y - cy).^2);
    I = find(distance<=circles(ind).radius);
    material_2d_space(I) = circles(ind).material_type;
%     

array2D = sqrt((centerY-cy).^2 ...
    + (centerX-cx).^2); 
ring =find( array2D >= innerRadius & array2D <= outerRadius);
 material_2d_space(ring) = ringmaterial_type;
 
 array2D2 = sqrt((centerY2-cy).^2 ...
    + (centerX2-cx).^2); 
ring2 =find( array2D2 >= innerRadius2 & array2D2 <= outerRadius2);
 material_2d_space(ring2) = ringmaterial_type2;
end
clear cx cy;


