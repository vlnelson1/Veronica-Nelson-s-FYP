disp('calculating the number of cells in the problem space');

number_of_circles = size(circles,2);
number_of_rectangles  = size(rectangles,2);

% find the minimum and maximum coordinates of a 
% box encapsulating the objects
number_of_objects = 0;
for i=1:number_of_circles
    number_of_objects = number_of_objects + 1;
    min_x(number_of_objects) = circles(i).center_x - circles(i).radius; 
    min_y(number_of_objects) = circles(i).center_y - circles(i).radius; 
    max_x(number_of_objects) = circles(i).center_x + circles(i).radius; 
    max_y(number_of_objects) = circles(i).center_y + circles(i).radius; 
end
for i=1:number_of_rectangles
    number_of_objects = number_of_objects + 1;
    min_x(number_of_objects) = rectangles(i).min_x; 
    min_y(number_of_objects) = rectangles(i).min_y; 
    max_x(number_of_objects) = rectangles(i).max_x; 
    max_y(number_of_objects) = rectangles(i).max_y; 
end

if number_of_objects == 0
    fdtd_domain.min_x = 0;
    fdtd_domain.min_y = 0;
    fdtd_domain.max_x = 0;
    fdtd_domain.max_y = 0;
else
    fdtd_domain.min_x = min(min_x);
    fdtd_domain.min_y = min(min_y);
    fdtd_domain.max_x = max(max_x);
    fdtd_domain.max_y = max(max_y);
end

% Determine the problem space boundaries including air buffers 
fdtd_domain.min_x = fdtd_domain.min_x ...
    - dx * (boundary.air_buffer_number_of_cells_xn + n_pml_xn);
fdtd_domain.min_y = fdtd_domain.min_y ...
    - dy * (boundary.air_buffer_number_of_cells_yn + n_pml_yn);
fdtd_domain.max_x = fdtd_domain.max_x ...
    + dx * (boundary.air_buffer_number_of_cells_xp + n_pml_xp);
fdtd_domain.max_y = fdtd_domain.max_y ...
    + dy * (boundary.air_buffer_number_of_cells_yp + n_pml_yp);

% Determining the problem space size
fdtd_domain.size_x = fdtd_domain.max_x - fdtd_domain.min_x;
fdtd_domain.size_y = fdtd_domain.max_y - fdtd_domain.min_y;

% number of cells in x, y, and z directions
nx = round(fdtd_domain.size_x/dx);  
ny = round(fdtd_domain.size_y/dy);

% adjust domain size by snapping to cells
fdtd_domain.size_x = nx * dx;
fdtd_domain.size_y = ny * dy;

fdtd_domain.max_x = fdtd_domain.min_x + fdtd_domain.size_x;
fdtd_domain.max_y = fdtd_domain.min_y + fdtd_domain.size_y;

% some frequently used auxiliary parameters 
nxp1 = nx+1;  nxm1 = nx-1; nxm2 = nx-2;
nyp1 = ny+1;  nym1 = ny-1; nym2 = ny-2; 

% create arrays storing the center coordinates of the cells
fdtd_domain.cell_center_coordinates_x = zeros(nx,ny);
fdtd_domain.cell_center_coordinates_y = zeros(nx,ny);
for ind = 1:nx
    fdtd_domain.cell_center_coordinates_x(ind,:) = ...
        (ind - 0.5) * dx + fdtd_domain.min_x;
end
for ind = 1:ny
    fdtd_domain.cell_center_coordinates_y(:,ind) = ...
       (ind - 0.5) * dy + fdtd_domain.min_y;
end

