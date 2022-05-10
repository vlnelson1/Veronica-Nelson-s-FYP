% initializing PML boundary conditions for TEz
disp('initializing PML boundary conditions for TEz');

Hzx_xn = zeros(n_pml_xn,ny);
Hzy_xn = zeros(n_pml_xn,ny-n_pml_yn-n_pml_yp);
Hzx_xp = zeros(n_pml_xp,ny);
Hzy_xp = zeros(n_pml_xp,ny-n_pml_yn-n_pml_yp);
Hzx_yn = zeros(nx-n_pml_xn-n_pml_xp, n_pml_yn);
Hzy_yn = zeros(nx,n_pml_yn);
Hzx_yp = zeros(nx-n_pml_xn-n_pml_xp, n_pml_yp);
Hzy_yp = zeros(nx,n_pml_yp);

pml_order = boundary.pml_order;
R_0 = boundary.pml_R_0;

if is_pml_xn
    sigma_pex_xn = zeros(n_pml_xn,ny);
    sigma_pmx_xn = zeros(n_pml_xn,ny);
    
    sigma_max = -(pml_order+1)*eps_0*c*log(R_0)/(2*dx*n_pml_xn);
    rho_e = ([n_pml_xn:-1:1] - 0.75)/n_pml_xn;
    rho_m = ([n_pml_xn:-1:1] - 0.25)/n_pml_xn;
    for ind = 1:n_pml_xn
        sigma_pex_xn(ind,:) = sigma_max * rho_e(ind)^pml_order;
        sigma_pmx_xn(ind,:) = ...
            (mu_0/eps_0) * sigma_max * rho_m(ind)^pml_order;
    end
    
    % Coeffiecients updating Ey
    Ceye_xn  =  (2*eps_0 - dt*sigma_pex_xn)./(2*eps_0 + dt*sigma_pex_xn);
    Ceyhz_xn = -(2*dt/dx)./(2*eps_0 + dt*sigma_pex_xn);
    
    % Coeffiecients updating Hzx
    Chzxh_xn  =  (2*mu_0 - dt*sigma_pmx_xn)./(2*mu_0 + dt*sigma_pmx_xn);
    Chzxey_xn = -(2*dt/dx)./(2*mu_0 + dt*sigma_pmx_xn);

    % Coeffiecients updating Hzy
    Chzyh_xn  =  1;
    Chzyex_xn =  dt/(dy*mu_0);
end

if is_pml_xp
    sigma_pex_xp = zeros(n_pml_xp,ny);
    sigma_pmx_xp = zeros(n_pml_xp,ny);

    sigma_max = -(pml_order+1)*eps_0*c*log(R_0)/(2*dx*n_pml_xp);
    rho_e = ([1:n_pml_xp] - 0.75)/n_pml_xp;
    rho_m = ([1:n_pml_xp] - 0.25)/n_pml_xp;
    for ind = 1:n_pml_xp
        sigma_pex_xp(ind,:) = sigma_max * rho_e(ind)^pml_order;
        sigma_pmx_xp(ind,:) = ...
            (mu_0/eps_0) * sigma_max * rho_m(ind)^pml_order;
    end

    % Coeffiecients updating Ey
    Ceye_xp  =  (2*eps_0 - dt*sigma_pex_xp)./(2*eps_0 + dt*sigma_pex_xp);
    Ceyhz_xp = -(2*dt/dx)./(2*eps_0 + dt*sigma_pex_xp);

    % Coeffiecients updating Hzx
    Chzxh_xp  =  (2*mu_0 - dt*sigma_pmx_xp)./(2*mu_0 + dt*sigma_pmx_xp);
    Chzxey_xp = -(2*dt/dx)./(2*mu_0 + dt*sigma_pmx_xp);

    % Coeffiecients updating Hzy
    Chzyh_xp  =  1;
    Chzyex_xp =  dt/(dy*mu_0);
end

if is_pml_yn
    sigma_pey_yn = zeros(nx,n_pml_yn);
    sigma_pmy_yn = zeros(nx,n_pml_yn);

    sigma_max = -(pml_order+1)*eps_0*c*log(R_0)/(2*dy*n_pml_yn);
    rho_e = ([n_pml_yn:-1:1] - 0.75)/n_pml_yn;
    rho_m = ([n_pml_yn:-1:1] - 0.25)/n_pml_yn;
    for ind = 1:n_pml_yp
        sigma_pey_yn(:,ind) = sigma_max * rho_e(ind)^pml_order;
        sigma_pmy_yn(:,ind) = ...
            (mu_0/eps_0) * sigma_max * rho_m(ind)^pml_order;
    end

    % Coeffiecients updating Ex
    Cexe_yn  =  (2*eps_0 - dt*sigma_pey_yn)./(2*eps_0 + dt*sigma_pey_yn);
    Cexhz_yn =  (2*dt/dy)./(2*eps_0 + dt*sigma_pey_yn);
    
    % Coeffiecients updating Hzx
    Chzxh_yn  = 1;
    Chzxey_yn = -dt/(dx*mu_0);

    % Coeffiecients updating Hzy
    Chzyh_yn  =  (2*mu_0 - dt*sigma_pmy_yn)./(2*mu_0 + dt*sigma_pmy_yn);
    Chzyex_yn =  (2*dt/dy)./(2*mu_0 + dt*sigma_pmy_yn);
end

if is_pml_yp
    sigma_pey_yp = zeros(nx,n_pml_yp);
    sigma_pmy_yp = zeros(nx,n_pml_yp);

    sigma_max = -(pml_order+1)*eps_0*c*log(R_0)/(2*dy*n_pml_yp);
    rho_e = ([1:n_pml_yp] - 0.75)/n_pml_yp;
    rho_m = ([1:n_pml_yp] - 0.25)/n_pml_yp;
    for ind = 1:n_pml_yp
        sigma_pey_yp(:,ind) = sigma_max * rho_e(ind)^pml_order;
        sigma_pmy_yp(:,ind) = ...
            (mu_0/eps_0) * sigma_max * rho_m(ind)^pml_order;
    end

    % Coeffiecients updating Ex
    Cexe_yp  =  (2*eps_0 - dt*sigma_pey_yp)./(2*eps_0 + dt*sigma_pey_yp);
    Cexhz_yp =  (2*dt/dy)./(2*eps_0 + dt*sigma_pey_yp);
    
    % Coeffiecients updating Hzx
    Chzxh_yp  = 1;
    Chzxey_yp = -dt/(dx*mu_0);

    % Coeffiecients updating Hzy
    Chzyh_yp  =  (2*mu_0 - dt*sigma_pmy_yp)./(2*mu_0 + dt*sigma_pmy_yp);
    Chzyex_yp =  (2*dt/dy)./(2*mu_0 + dt*sigma_pmy_yp);
end
