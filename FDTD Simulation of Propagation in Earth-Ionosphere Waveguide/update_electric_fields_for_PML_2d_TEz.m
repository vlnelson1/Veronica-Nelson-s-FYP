% update electric fields at the PML regions
% TEz
if is_pml_xn
    Ey(2:pis,:)  = Ceye_xn .* Ey(2:pis,:) ...
        + Ceyhz_xn .* (Hz(2:pis,:)-Hz(1:pis-1,:)); 
end

if is_pml_xp
    Ey(pie:nx,:) = Ceye_xp .* Ey(pie:nx,:) ...
        + Ceyhz_xp .* (Hz(pie:nx,:)-Hz(pie-1:nx-1,:)); 
end

if is_pml_yn
    Ex(:,2:pjs)   = Cexe_yn .* Ex(:,2:pjs) ...
        + Cexhz_yn .* (Hz(:,2:pjs)-Hz(:,1:pjs-1));   
end

if is_pml_yp
    Ex(:,pje:ny) = Cexe_yp .* Ex(:,pje:ny) ...
        + Cexhz_yp .* (Hz(:,pje:ny)-Hz(:,pje-1:ny-1));   
end

