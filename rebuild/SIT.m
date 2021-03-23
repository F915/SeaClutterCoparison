function sigma0 = SIT(agr,wdir,windspeed,pol)
if all(pol == 'vv')
    if wdir == 90 || wdir == 270
        const = [-58,19.0,50,-33];
    elseif wdir == 180 || wdir == 0
        const = [-49,17.0,30,12.4];
    else
        disp("Grazing Angle Error")
    end
elseif all(pol == 'hh')
    if wdir == 90 || wdir == 270
        const = [-53, 6.5,34,0];
    elseif wdir == 180 || wdir == 0
        const = [-50,12.6,34,13.2];
    else
        disp("Grazing Angle Error")
    end
else
    disp("Polarizition Error")
end

sigma0 = const(1)+const(2)*log10(agr/0.5)+(const(3)+const(4)*log10(agr/0.5))*log10(windspeed/5);

end