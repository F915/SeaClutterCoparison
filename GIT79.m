function sigma0 = GIT79(ss, agr, fre, wdir,pol)
%1nmi=1852m
%1ft=0.3048m 10ft=3.048m
agrr = agr *pi/180;
wdirr = wdir *pi/180;
c = physconst('LightSpeed');
lambda = c/fre/0.3048;

u = 3.16*(ss^0.8);
hav = 0.00452*(u^2.5)/0.3048;

sigmaphi = (4.4*lambda+5.5)*agrr*hav/lambda;
ai = (sigmaphi^4)/(1+sigmaphi^4);
au = exp(0.3*cos(wdirr)*(1-2.8*agrr)*(lambda+0.05)^(-0.4));
qw = 1.7*((lambda+0.05)^(-0.4));
%vw=10.47*(hav^(-0.4));
aw = (u/(1+u/30))^qw;

sigma0hh = 10*log10(1.2e-6*lambda*(agrr^0.4)*ai*au*aw);
sigma0vv = sigma0hh - 1.05*log(hav+0.05)+1.09*log(lambda)+1.27*log(agrr+0.0001)+9.65;

if all(pol == 'vv')
    if agr >= 0.1 && agr <=10
        sigma0 = sigma0vv;
    else
        disp("Grazing Angle Error")
    end
elseif all(pol == 'hh')
    if agr >= 0.1 && agr <=10
        sigma0 = sigma0hh;
    else
        disp("Grazing Angle Error")
    end
else
    disp("Polarizition Error")
end


end