disp('initializing boundary conditions');

% determine the boundaries of the non-pml region
pis = n_pml_xn+1;
pie = nx-n_pml_xp+1;
pjs = n_pml_yn+1;
pje = ny-n_pml_yp+1;

if is_any_side_pml
    if is_TEz
        initialize_pml_boundary_conditions_2d_TEz;
    end
    if is_TMz
        initialize_pml_boundary_conditions_2d_TMz;
    end
end
