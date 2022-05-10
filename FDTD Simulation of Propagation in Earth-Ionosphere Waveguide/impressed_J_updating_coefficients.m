disp('initializing impressed electric current updating coefficients');

for ind = 1:number_of_impressed_J
    is = impressed_J(ind).is;
    js = impressed_J(ind).js;
    ie = impressed_J(ind).ie;
    je = impressed_J(ind).je;
    switch (impressed_J(ind).direction(1))
    case 'x'
        impressed_J(ind).Cexj = -(2*dt)./ ...
        (2*eps_r_x(is:ie-1,js:je)*eps_0 + dt*sigma_e_x(is:ie-1,js:je));
    case 'y'
        impressed_J(ind).Ceyj = -(2*dt)./ ...
        (2*eps_r_y(is:ie,js:je-1)*eps_0 + dt*sigma_e_y(is:ie,js:je-1));
    case 'z'
        impressed_J(ind).Cezj = -(2*dt)./ ...
        (2*eps_r_z(is:ie,js:je)*eps_0 + dt*sigma_e_z(is:ie,js:je));
    end
end

 