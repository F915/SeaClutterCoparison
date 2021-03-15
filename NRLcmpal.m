clear all
close all
ss = 3;
fre = 9.3e9;
wdir = 90;
pol = 'vv';
windspeed = 3.16*(ss^0.8);
u = 3.16*(ss^0.8);
answer = zeros(2,101);
for agri = 1:99
    agr = agri/10;

    answer(1,agri)=NRL09(ss,fre,agr,pol);
    answer(2,agri)=NRL12(ss,fre,agr,pol);

end


figure
x = [1:99];
plot(x,answer(1,1:99),x,answer(2,1:99))
axis
grid on
legend('NRL09', 'NRL12')

