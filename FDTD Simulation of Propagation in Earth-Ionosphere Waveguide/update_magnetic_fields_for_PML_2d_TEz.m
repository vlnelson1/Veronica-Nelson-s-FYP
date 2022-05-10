% update magnetic fields at the PML regions
% TEz
if is_pml_xn
    Hzx_xn = Chzxh_xn .* Hzx_xn + Chzxey_xn.*(Ey(2:pis,:)-Ey(1:pis-1,:)); 
    Hzy_xn = Chzyh_xn .* Hzy_xn + Chzyex_xn.*(Ex(1:pis-1,pjs+1:pje)-Ex(1:pis-1,pjs:pje-1)); 
end
if is_pml_xp
    Hzx_xp = Chzxh_xp .* Hzx_xp + Chzxey_xp.*(Ey(pie+1:nxp1,:)-Ey(pie:nx,:));
    Hzy_xp = Chzyh_xp .* Hzy_xp + Chzyex_xp.*(Ex(pie:nx,pjs+1:pje)-Ex(pie:nx,pjs:pje-1)); 
end
if is_pml_yn
    Hzx_yn = Chzxh_yn .* Hzx_yn + Chzxey_yn.*(Ey(pis+1:pie,1:pjs-1)-Ey(pis:pie-1,1:pjs-1)); 
    Hzy_yn = Chzyh_yn .* Hzy_yn + Chzyex_yn.*(Ex(:,2:pjs)-Ex(:,1:pjs-1)); 
end
if is_pml_yp
    Hzx_yp = Chzxh_yp .* Hzx_yp + Chzxey_yp.*(Ey(pis+1:pie,pje:ny)-Ey(pis:pie-1,pje:ny)); 
    Hzy_yp = Chzyh_yp .* Hzy_yp + Chzyex_yp.*(Ex(:,pje+1:nyp1)-Ex(:,pje:ny)); 
end
Hz(1:pis-1,1:pjs-1) = Hzx_xn(:,1:pjs-1) + Hzy_yn(1:pis-1,:);
Hz(1:pis-1,pje:ny)  = Hzx_xn(:,pje:ny) + Hzy_yp(1:pis-1,:);
Hz(pie:nx,1:pjs-1)  = Hzx_xp(:,1:pjs-1) + Hzy_yn(pie:nx,:);
Hz(pie:nx,pje:ny)   = Hzx_xp(:,pje:ny) + Hzy_yp(pie:nx,:);
Hz(1:pis-1,pjs:pje-1) = Hzx_xn(:,pjs:pje-1) + Hzy_xn;
Hz(pie:nx,pjs:pje-1)  = Hzx_xp(:,pjs:pje-1) + Hzy_xp;
Hz(pis:pie-1,1:pjs-1) = Hzx_yn + Hzy_yn(pis:pie-1,:);
Hz(pis:pie-1,pje:ny)  = Hzx_yp + Hzy_yp(pis:pie-1,:);
