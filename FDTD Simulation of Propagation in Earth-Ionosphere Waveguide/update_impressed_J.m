% updating electric field components 
% associated with the impressed electric currents

 for ind = 1:number_of_impressed_J
    is = impressed_J(ind).is;
    js = impressed_J(ind).js;
    ie = impressed_J(ind).ie;
    je = impressed_J(ind).je;
    switch (impressed_J(ind).direction(1))
    case 'x'
        Ex(is:ie-1,js:je) = Ex(is:ie-1,js:je) ...
            + impressed_J(ind).Cexj * impressed_J(ind).waveform(time_step);
    case 'y'
        Ey(is:ie,js:je-1) = Ey(is:ie,js:je-1) ...
            + impressed_J(ind).Ceyj * impressed_J(ind).waveform(time_step);
    case 'z'
        Ez(is:ie,js:je) = Ez(is:ie,js:je) ...
            + impressed_J(ind).Cezj * impressed_J(ind).waveform(time_step);
    end
end
  