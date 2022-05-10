disp('creating rectangles');

for ind = 1:number_of_rectangles
    % convert rectangle end coordinates to node indices 
    blx = round((rectangles(ind).min_x - fdtd_domain.min_x)/dx) + 1; 
    bly = round((rectangles(ind).min_y - fdtd_domain.min_y)/dy) + 1; 

    bux = round((rectangles(ind).max_x - fdtd_domain.min_x)/dx)+1; 
    buy = round((rectangles(ind).max_y - fdtd_domain.min_y)/dy)+1; 

    % assign material type of the rectangle to the cells
    material_2d_space (blx:bux-1, bly:buy-1) ...
        = rectangles(ind).material_type;
end
