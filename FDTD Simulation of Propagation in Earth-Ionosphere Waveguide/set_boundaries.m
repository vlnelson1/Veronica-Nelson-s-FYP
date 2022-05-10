% initialize some boundary parameters

is_pml_xn = false; 
is_pml_xp = false; 
is_pml_yn = false; 
is_pml_yp = false; 
is_any_side_pml = false;
if strcmp(boundary.type_xn, 'pml')
    is_pml_xn = true;
else
    boundary.pml_number_of_cells_xn = 0;
end
if strcmp(boundary.type_xp, 'pml')
    is_pml_xp = true;
else
    boundary.pml_number_of_cells_xp = 0;
end
if strcmp(boundary.type_yn, 'pml')
    is_pml_yn = true;
else
    boundary.pml_number_of_cells_yn = 0;
end
if strcmp(boundary.type_yp, 'pml')
    is_pml_yp = true;
else
    boundary.pml_number_of_cells_yp = 0;
end
if (is_pml_xn || is_pml_xp || is_pml_yn || is_pml_yp)
    is_any_side_pml = true;
end

n_pml_xn = boundary.pml_number_of_cells_xn;
n_pml_xp = boundary.pml_number_of_cells_xp;
n_pml_yn = boundary.pml_number_of_cells_yn;
n_pml_yp = boundary.pml_number_of_cells_yp;
    