function sigma0=NRL09(ss,fre,agr,pol)
agrr = agr *pi/180;
%agrr=agr
fre = fre/1e9;
const = [-72.76,21.11,24.78,4.917,0.6216,-0.02949,26.19,0.09345,0.05031;-48.56,26.30,29.05,-0.5183,1.057,0.04839,21.37,0.07466,0.04623];
if all(pol == 'vv')
    consta = const(2,:);
elseif all(pol == 'hh')
    consta = const(1,:);
else
    disp("Polarizition Error")
end

sigma0 = consta(1)+consta(2)*log10(sin(agrr))+((consta(3)+consta(4)*agrr)*log10(fre))/(1+consta(5)*agrr+consta(6)*ss)+consta(7)*((1+ss)^(1/(2+consta(8)*agrr+consta(9)*ss)))-15;



end