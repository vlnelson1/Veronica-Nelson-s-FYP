% update magnetic fields at the PML regions
% TMz
if is_pml_xn
    Hy(1:pis-1,2:ny) = Chyh_xn .* Hy(1:pis-1,2:ny) ...
        + Chyez_xn .* (Ez(2:pis,2:ny)-Ez(1:pis-1,2:ny)); 
end

if is_pml_xp
    Hy(pie:nx,2:ny) = Chyh_xp .* Hy(pie:nx,2:ny) ...
    + Chyez_xp .* (Ez(pie+1:nxp1,2:ny)-Ez(pie:nx,2:ny)); 
end

if is_pml_yn
    Hx(2:nx,1:pjs-1) = Chxh_yn .* Hx(2:nx,1:pjs-1) ...
        + Chxez_yn.*(Ez(2:nx,2:pjs)-Ez(2:nx,1:pjs-1)); 
end

if is_pml_yp
    Hx(2:nx,pje:ny) = Chxh_yp .* Hx(2:nx,pje:ny) ...
        + Chxez_yp.*(Ez(2:nx,pje+1:nyp1)-Ez(2:nx,pje:ny)); 
end

                  
