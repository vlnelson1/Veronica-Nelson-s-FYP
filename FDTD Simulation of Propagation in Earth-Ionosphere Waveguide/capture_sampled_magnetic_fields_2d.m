% Capturing magnetic fields

for ind=1:number_of_sampled_magnetic_fields
    is = sampled_magnetic_fields(ind).is;
    js = sampled_magnetic_fields(ind).js;

    switch (sampled_magnetic_fields(ind).component)
        case 'x'
            sampled_value = 0.5 * sum(Hx(is,js-1:js)); 
        case 'y'
            sampled_value = 0.5 * sum(Hy(is-1:is,js)); 
        case 'z'
            sampled_value = 0.25 * sum(sum(Hz(is-1:is,js-1:js))); 
        case 'm'
            svx = 0.5 * sum(Hx(is,js-1:js)); 
            svy = 0.5 * sum(Hy(is-1:is,js)); 
            svz = 0.25 * sum(sum(Hz(is-1:is,js-1:js))); 
            sampled_value = sqrt(svx^2 + svy^2 + svz^2);
    end
    sampled_magnetic_fields(ind).sampled_value(time_step) = sampled_value;
end
