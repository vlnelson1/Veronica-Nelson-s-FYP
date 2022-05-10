disp('initializing general updating coefficients');

% Coeffiecients updating Ex
Cexe  =  (2*eps_r_x*eps_0 - dt*sigma_e_x)./(2*eps_r_x*eps_0 + dt*sigma_e_x);
Cexhz =  (2*dt/dy)./(2*eps_r_x*eps_0 + dt*sigma_e_x);

% Coeffiecients updating Ey
Ceye  =  (2*eps_r_y*eps_0 - dt*sigma_e_y)./(2*eps_r_y*eps_0 + dt*sigma_e_y);
Ceyhz = -(2*dt/dx)./(2*eps_r_y*eps_0 + dt*sigma_e_y);

% Coeffiecients updating Hz
Chzh  =  (2*mu_r_z*mu_0 - dt*sigma_m_z)./(2*mu_r_z*mu_0 + dt*sigma_m_z);
Chzey = -(2*dt/dx)./(2*mu_r_z*mu_0 + dt*sigma_m_z);
Chzex =  (2*dt/dy)./(2*mu_r_z*mu_0 + dt*sigma_m_z);

% Coeffiecients updating Ez
Ceze  =  (2*eps_r_z*eps_0 - dt*sigma_e_z)./(2*eps_r_z*eps_0 + dt*sigma_e_z);
Cezhy =  (2*dt/dx)./(2*eps_r_z*eps_0 + dt*sigma_e_z);
Cezhx = -(2*dt/dy)./(2*eps_r_z*eps_0 + dt*sigma_e_z);

% Coeffiecients updating Hx
Chxh  =  (2*mu_r_x*mu_0 - dt*sigma_m_x)./(2*mu_r_x*mu_0 + dt*sigma_m_x);
Chxez = -(2*dt/dy)./(2*mu_r_x*mu_0 + dt*sigma_m_x);

% Coeffiecients updating Hy
Chyh  =  (2*mu_r_y*mu_0 - dt*sigma_m_y)./(2*mu_r_y*mu_0 + dt*sigma_m_y);
Chyez =  (2*dt/dx)./(2*mu_r_y*mu_0 + dt*sigma_m_y);

% Initialize coeffiecients for impressed current sources
impressed_J_updating_coefficients;
impressed_M_updating_coefficients;

