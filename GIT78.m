function sigma0 = GIT78(ss, agr, fre, wdir,pol)
% GIT 1978
% frequency 1-10GHZ
% agr in
agrr = agr *pi/180;
wdirr = wdir *pi/180;
u = 3.16*(ss^0.8);
hav = 0.00452*(u^2.5);
c = physconst('LightSpeed');
lambda = c/fre;
sigmaphi = (14.4*lambda+5.5)*(agrr*hav/lambda);
ai = (sigmaphi^4)/(1+(sigmaphi^4));
au = exp(0.2*cos(wdirr)*(1-2.8*agrr)*((lambda+0.015)^(-0.4)));
aw = ((1.94*u)/(1+(u/15.4)))^(1.1/((lambda+0.015)^0.4));
sigma0hh = 10*log10(lambda*(agrr^0.4)*ai*au*aw)-54.09;
sigma0vv = sigma0hh - 1.05*log(hav+0.015)+1.09*log(lambda)+1.27*log(agrr+0.0001)+9.7;

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