% updating magnetic field components 
% associated with the impressed magnetic currents

 for ind = 1:number_of_impressed_M
    is = impressed_M(ind).is;
    js = impressed_M(ind).js;
    ie = impressed_M(ind).ie;
    je = impressed_M(ind).je;
    switch (impressed_M(ind).direction(1))
    case 'x'
        Hx(is:ie,js:je-1) = Hx(is:ie,js:je-1) ...
            + impressed_M(ind).Chxm * impressed_M(ind).waveform(time_step);
    case 'y'
        Hy(is:ie-1,js:je) = Hy(is:ie-1,js:je) ...
            + impressed_M(ind).Chym * impressed_M(ind).waveform(time_step);
    case 'z'
        Hz(is:ie-1,js:je-1) = Hz(is:ie-1,js:je-1) ...
            + impressed_M(ind).Chzm * impressed_M(ind).waveform(time_step);
    end
end
 

 