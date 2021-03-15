function sigma0=NRL12(ss,fre,agr,pol)
agrr = agr *pi/180;
%agrr = agr;
fre = fre/1e9;
const = [-73.0,20.78,7.351,25.65,0.00540;-50.79,25.93,0.7093,21.58,0.00211];
if all(pol == 'vv')
    consta = const(2,:);
elseif all(pol == 'hh')
    consta = const(1,:);
else
    disp("Polarizition Error")
end

sigma0 = consta(1)+consta(2)*log10(sin(agrr))+((27.5+consta(3)*agr)*log10(fre))/(1+0.95*agr)+consta(4)*((1+ss)^(1/(2+0.085*agr+0.033*ss)))+consta(5)*agr*agr;


end