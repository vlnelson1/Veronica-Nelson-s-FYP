current_time  = current_time + dt/2;

if is_TEz
    Ex(:,pjs+1:pje-1) = Cexe(:,pjs+1:pje-1).*Ex(:,pjs+1:pje-1) ...
                         + Cexhz(:,pjs+1:pje-1).*...
                         (Hz(:,pjs+1:pje-1)-Hz(:,pjs:pje-2));   

    Ey(pis+1:pie-1,:) = Ceye(pis+1:pie-1,:).*Ey(pis+1:pie-1,:) ...
                          + Ceyhz(pis+1:pie-1,:).*  ...
                          (Hz(pis+1:pie-1,:)-Hz(pis:pie-2,:)); 
end

if is_TMz
    Ez(pis+1:pie-1,pjs+1:pje-1) = ...
        Ceze(pis+1:pie-1,pjs+1:pje-1).*Ez(pis+1:pie-1,pjs+1:pje-1) ...
        + Cezhy(pis+1:pie-1,pjs+1:pje-1) ...
        .* (Hy(pis+1:pie-1,pjs+1:pje-1)-Hy(pis:pie-2,pjs+1:pje-1)) ...
        + Cezhx(pis+1:pie-1,pjs+1:pje-1) ...
        .* (Hx(pis+1:pie-1,pjs+1:pje-1)-Hx(pis+1:pie-1,pjs:pje-2));
end