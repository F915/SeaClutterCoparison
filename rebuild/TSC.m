function sigma0 = TSC(ss,agr,pol,fre,wdir)
agrr = agr *pi/180;
wdirr = wdir *pi/180;
c = physconst('LightSpeed');
lambda = c/fre;
sigmaz = 0.03505*(ss^1.95);
sigmaa=4.5416*agrr*(3.2808*sigmaz+0.25)/lambda;
gaa = (sigmaa^1.5)/(1+sigmaa^1.5);
u = 3.189*(ss^0.8);
q = agrr^0.6;
a1 = (1+(lambda/0.00914)^3)^0.1;
a2 = (1+(lambda/0.00305)^3)^0.1;
a3 = (1+(lambda/0.00914)^3)^(q/3);
a4 = 1+0.35*q;
a = 2.63*a1/(a2*a3*a4);
gw=((1.9438*u+4.0)/15)^a;
if agr == 90
    gu = 1;
elseif agr<90
    gu = exp(0.3*cos(wdirr)*exp(-agrr/0.17)/(10.7636*(lambda^2)+0.005)^0.2);
end

sigma0hh = 10*log10(1.7e-5*(agrr^0.5)*gu*gw*gaa/(3.2808*lambda+0.05)^1.8);

if fre<2e9
    sigma0vv = sigma0hh - 1.73*log(8.225*sigmaz+0.05)+3.76*log(lambda)+2.46*log(sin(agrr)+0.0001)+24.2672;
else
    sigma0vv = sigma0hh - 1.05*log(8.225*sigmaz+0.05)+1.09*log(lambda)+1.27*log(sin(agrr)+0.0001)+10.945;
end

if all(pol == 'vv')
    sigma0 = sigma0vv;
elseif all(pol == 'hh')
    sigma0 = sigma0hh;
else
    disp("Polarizition Error")
end

end