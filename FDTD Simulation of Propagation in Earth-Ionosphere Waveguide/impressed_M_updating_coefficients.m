disp('initializing impressed magnetic current updating coefficients');

 for ind = 1:number_of_impressed_M
    is = impressed_M(ind).is;
    js = impressed_M(ind).js;
    ie = impressed_M(ind).ie;
    je = impressed_M(ind).je;
    switch (impressed_M(ind).direction(1))
    case 'x'
        impressed_M(ind).Chxm = -(2*dt)./ ...
        (2*mu_r_x(is:ie,js:je-1)*mu_0 + dt*sigma_m_x(is:ie,js:je-1));
    case 'y'
        impressed_M(ind).Chym = -(2*dt)./ ...
        (2*mu_r_y(is:ie-1,js:je)*mu_0 + dt*sigma_m_y(is:ie-1,js:je));
    case 'z'
        impressed_M(ind).Chzm = -(2*dt)./ ...
        (2*mu_r_z(is:ie-1,js:je-1)*mu_0 + dt*sigma_m_z(is:ie-1,js:je-1));
    end
end
 