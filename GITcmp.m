clear all
close all
ss = 2;
fre = 10e9;
wdir = 90;
pol = 'hh';
windspeed = 3.16*(ss^0.8);
u = 3.16*(ss^0.8);
answer = zeros(2,101);
for agri = 1:99
    agr = agri/10;

    answer(1,agri)=GIT78(ss, agr, fre, wdir,pol);
    answer(2,agri)=GIT79(ss, agr, fre, wdir,pol);

end

figure
x = [1:99];
plot(x,answer(1,1:99),x,answer(2,1:99))
axis
legend('GIT78', 'GIT79')

