function sigma0 = RRE(ss, agr, pol)
% ss is sea stare, agr is grazing angle in degree.
% grazing angle < 10 degrees.
% pol is polization in 'vv' or 'hh'
%frequency is between 9 and 10 GHZ.
ahh = [-52, -46,-42,-39,-37,-35.5];
bhh = [21,17.5,12.5,10.5,7,3.5];
chh = [1.015, 3.39, 2.03, 1.35, 2.03, 2.37];

avv = [-51.5,-45.5,-41,-38.5,-36, -34.5];
bvv = [15,12,11.5,11,9.5,8];
cvv = [8.2,9.5,8,7.5,7,6.5];



if all(pol == 'vv')
    if agr <=1.0
        sigma0 = avv(ss)+bvv(ss)*log10(180*agr/pi);
    elseif agr > 1.0 && agr < 10
        sigma0 = avv(ss)+cvv(ss)*log10(180*agr/pi);
    else
        disp("Grazing Angle Error")
    end
elseif all(pol == 'hh')
    if agr <=1.0
        sigma0 = ahh(ss)+bhh(ss)*log10(180*agr/pi);
    elseif agr > 1.0 && agr < 10
        sigma0 = ahh(ss)+chh(ss)*log10(180*agr/pi);
    else
        disp("Grazing Angle Error")
    end
else
    disp("Polarizition Error")
end
end
