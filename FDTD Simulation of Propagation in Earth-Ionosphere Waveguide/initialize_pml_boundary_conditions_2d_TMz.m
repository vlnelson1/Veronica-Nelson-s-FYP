% initializing PML boundary conditions for TMz
disp('initializing PML boundary conditions for TMz');

Ezx_xn = zeros(n_pml_xn,nym1);
Ezy_xn = zeros(n_pml_xn,nym1-n_pml_yn-n_pml_yp);
Ezx_xp = zeros(n_pml_xp,nym1);
Ezy_xp = zeros(n_pml_xp,nym1-n_pml_yn-n_pml_yp);
Ezx_yn = zeros(nxm1-n_pml_xn-n_pml_xp, n_pml_yn);
Ezy_yn = zeros(nxm1,n_pml_yn);
Ezx_yp = zeros(nxm1-n_pml_xn-n_pml_xp, n_pml_yp);
Ezy_yp = zeros(nxm1,n_pml_yp);

pml_order = boundary.pml_order;
R_0 = boundary.pml_R_0;

if is_pml_xn
    sigma_pex_xn = zeros(n_pml_xn,nym1);
    sigma_pmx_xn = zeros(n_pml_xn,nym1);
    
    sigma_max = -(pml_order+1)*eps_0*c*log(R_0)/(2*dx*n_pml_xn);
    rho_e = ([n_pml_xn:-1:1] - 0.75)/n_pml_xn;
    rho_m = ([n_pml_xn:-1:1] - 0.25)/n_pml_xn;
    for ind = 1:n_pml_xn
        sigma_pex_xn(ind,:) = sigma_max * rho_e(ind)^pml_order;
        sigma_pmx_xn(ind,:) = ...
            (mu_0/eps_0) * sigma_max * rho_m(ind)^pml_order;
    end
    
    % Coeffiecients updating Hy
    Chyh_xn  =  (2*mu_0 - dt*sigma_pmx_xn)./(2*mu_0 + dt*sigma_pmx_xn);
    Chyez_xn =  (2*dt/dx)./(2*mu_0 + dt*sigma_pmx_xn);
    
    % Coeffiecients updating Ezx
    Cezxe_xn  =  (2*eps_0 - dt*sigma_pex_xn)./(2*eps_0 + dt*sigma_pex_xn);
    Cezxhy_xn =  (2*dt/dx)./(2*eps_0 + dt*sigma_pex_xn);

    % Coeffiecients updating Ezy
    Cezye_xn  =  1;
    Cezyhx_xn = -dt/(dy*eps_0);
end

if is_pml_xp
    sigma_pex_xp = zeros(n_pml_xp,nym1);
    sigma_pmx_xp = zeros(n_pml_xp,nym1);

    sigma_max = -(pml_order+1)*eps_0*c*log(R_0)/(2*dx*n_pml_xp);
    rho_e = ([1:n_pml_xp] - 0.75)/n_pml_xp;
    rho_m = ([1:n_pml_xp] - 0.25)/n_pml_xp;
    for ind = 1:n_pml_xp
        sigma_pex_xp(ind,:) = sigma_max * rho_e(ind)^pml_order;
        sigma_pmx_xp(ind,:) = ...
            (mu_0/eps_0) * sigma_max * rho_m(ind)^pml_order;
    end

    % Coeffiecients updating Hy
    Chyh_xp  =  (2*mu_0 - dt*sigma_pmx_xp)./(2*mu_0 + dt*sigma_pmx_xp);
    Chyez_xp =  (2*dt/dx)./(2*mu_0 + dt*sigma_pmx_xp);
    
    % Coeffiecients updating Ezx
    Cezxe_xp  =  (2*eps_0 - dt*sigma_pex_xp)./(2*eps_0 + dt*sigma_pex_xp);
    Cezxhy_xp =  (2*dt/dx)./(2*eps_0 + dt*sigma_pex_xp);

    % Coeffiecients updating Ezy
    Cezye_xp  =  1;
    Cezyhx_xp = -dt/(dy*eps_0);
end

if is_pml_yn
    sigma_pey_yn = zeros(nxm1,n_pml_yn);
    sigma_pmy_yn = zeros(nxm1,n_pml_yn);

    sigma_max = -(pml_order+1)*eps_0*c*log(R_0)/(2*dy*n_pml_yn);
    rho_e = ([n_pml_yn:-1:1] - 0.75)/n_pml_yn;
    rho_m = ([n_pml_yn:-1:1] - 0.25)/n_pml_yn;
    for ind = 1:n_pml_yp
        sigma_pey_yn(:,ind) = sigma_max * rho_e(ind)^pml_order;
        sigma_pmy_yn(:,ind) = ...
            (mu_0/eps_0) * sigma_max * rho_m(ind)^pml_order;
    end
   
    % Coeffiecients updating Hx
    Chxh_yn  =  (2*mu_0 - dt*sigma_pmy_yn)./(2*mu_0 + dt*sigma_pmy_yn);
    Chxez_yn = -(2*dt/dy)./(2*mu_0 + dt*sigma_pmy_yn);

    % Coeffiecients updating Ezx
    Cezxe_yn  =  1;
    Cezxhy_yn =  dt/(dx*eps_0);

    % Coeffiecients updating Ezy
    Cezye_yn  =  (2*eps_0 - dt*sigma_pey_yn)./(2*eps_0 + dt*sigma_pey_yn);
    Cezyhx_yn = -(2*dt/dy)./(2*eps_0 + dt*sigma_pey_yn);
end

if is_pml_yp
    sigma_pey_yp = zeros(nxm1,n_pml_yp);
    sigma_pmy_yp = zeros(nxm1,n_pml_yp);

    sigma_max = -(pml_order+1)*eps_0*c*log(R_0)/(2*dy*n_pml_yp);
    rho_e = ([1:n_pml_yp] - 0.75)/n_pml_yp;
    rho_m = ([1:n_pml_yp] - 0.25)/n_pml_yp;
    for ind = 1:n_pml_yp
        sigma_pey_yp(:,ind) = sigma_max * rho_e(ind)^pml_order;
        sigma_pmy_yp(:,ind) = ...
            (mu_0/eps_0) * sigma_max * rho_m(ind)^pml_order;
    end

    % Coeffiecients updating Hx
    Chxh_yp  =  (2*mu_0 - dt*sigma_pmy_yp)./(2*mu_0 + dt*sigma_pmy_yp);
    Chxez_yp = -(2*dt/dy)./(2*mu_0 + dt*sigma_pmy_yp);

    % Coeffiecients updating Ezx
    Cezxe_yp  =  1;
    Cezxhy_yp =  dt/(dx*eps_0);

    % Coeffiecients updating Ezy
    Cezye_yp  =  (2*eps_0 - dt*sigma_pey_yp)./(2*eps_0 + dt*sigma_pey_yp);
    Cezyhx_yp = -(2*dt/dy)./(2*eps_0 + dt*sigma_pey_yp);
end
