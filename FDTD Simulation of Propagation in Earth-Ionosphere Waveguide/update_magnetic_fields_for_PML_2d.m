% update magnetic fields at the PML regions
if is_any_side_pml == false
    return;
end
if is_TEz
    update_magnetic_fields_for_PML_2d_TEz;
end
if is_TMz
    update_magnetic_fields_for_PML_2d_TMz;
end
