disp('initializing FDTD material grid');

% initialize some boundary parameters
set_boundaries;

% calculate problem space size based on the object 
% locations and boundary conditions
calculate_domain_size_2d;

% Array to store material type indices for every cell
% in the problem space. By default the space is filled 
% with air by initializing the array by ones
material_2d_space = ones(nx, ny); 

% Create the 2D objects in the problem space by
% assigning indices of material types in the cells 
% to material_2d_space  

% create circles
create_circles;

% create bricks
% create_rectangles;

% Material component arrays for a problem space
% composed of (nx, ny) cells

% TEz components
eps_r_x     = ones (nx  , nyp1);
eps_r_y     = ones (nxp1, ny);
mu_r_z      = ones (nx  , ny);
sigma_e_x   = zeros(nx  , nyp1);
sigma_e_y   = zeros(nxp1, ny);
sigma_m_z   = zeros(nx  , ny);

% TMz components
eps_r_z     = ones (nxp1, nyp1);
mu_r_x      = ones (nxp1, ny);
mu_r_y      = ones (nx  , nyp1);
sigma_e_z   = zeros(nxp1, nyp1);
sigma_m_x   = zeros(nxp1, ny);
sigma_m_y   = zeros(nx  , nyp1);

% calculate material component values by averaging
calculate_material_component_values_2d;


