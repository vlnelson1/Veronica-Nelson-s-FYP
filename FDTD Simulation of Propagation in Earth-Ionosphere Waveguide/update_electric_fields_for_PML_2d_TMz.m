% update electric fields at the PML regions
% TMz
if is_pml_xn
    Ezx_xn = Cezxe_xn .* Ezx_xn ...
        + Cezxhy_xn .* (Hy(2:pis,2:ny)-Hy(1:pis-1,2:ny));
    Ezy_xn = Cezye_xn .* Ezy_xn ...
        + Cezyhx_xn .* (Hx(2:pis,pjs+1:pje-1)-Hx(2:pis,pjs:pje-2));
end
if is_pml_xp
    Ezx_xp = Cezxe_xp .* Ezx_xp + Cezxhy_xp.*  ...
        (Hy(pie:nx,2:ny)-Hy(pie-1:nx-1,2:ny));
    Ezy_xp = Cezye_xp .* Ezy_xp ...
        + Cezyhx_xp .* (Hx(pie:nx,pjs+1:pje-1)-Hx(pie:nx,pjs:pje-2));
end
if is_pml_yn
    Ezx_yn = Cezxe_yn .* Ezx_yn ...
        + Cezxhy_yn .* (Hy(pis+1:pie-1,2:pis)-Hy(pis:pie-2,2:pjs));
    Ezy_yn = Cezye_yn .* Ezy_yn ...
        + Cezyhx_yn .* (Hx(2:nx,2:pjs)-Hx(2:nx,1:pjs-1));
end
if is_pml_yp
    Ezx_yp = Cezxe_yp .* Ezx_yp ...
        + Cezxhy_yp .* (Hy(pis+1:pie-1,pje:ny)-Hy(pis:pie-2,pje:ny));
    Ezy_yp = Cezye_yp .* Ezy_yp ...
        + Cezyhx_yp .* (Hx(2:nx,pje:ny)-Hx(2:nx,pje-1:ny-1));
end
Ez(2:pis,2:pjs)   = Ezx_xn(:,1:pjs-1) + Ezy_yn(1:pis-1,:);
Ez(2:pis,pje:ny)  = Ezx_xn(:,pje-1:nym1) + Ezy_yp(1:pis-1,:);
Ez(pie:nx,pje:ny) = Ezx_xp(:,pje-1:nym1) + Ezy_yp(pie-1:nxm1,:);
Ez(pie:nx,2:pjs)  = Ezx_xp(:,1:pjs-1) + Ezy_yn(pie-1:nxm1,:);
Ez(pis+1:pie-1,2:pjs)  = Ezx_yn + Ezy_yn(pis:pie-2,:);
Ez(pis+1:pie-1,pje:ny) = Ezx_yp + Ezy_yp(pis:pie-2,:);
Ez(2:pis,pjs+1:pje-1)  = Ezx_xn(:,pjs:pje-2) + Ezy_xn;
Ez(pie:nx,pjs+1:pje-1) = Ezx_xp(:,pjs:pje-2) + Ezy_xp;
