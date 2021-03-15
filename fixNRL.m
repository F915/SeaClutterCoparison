clear all
close all
ss = 3;
fre = 9.3e9;
pol = 'vv';
wdir = 90;
windspeed = 3.16*(ss^0.8);
u = 3.16*(ss^0.8);
answer = zeros(5,101)*nan;
for agri = 1:99
    agr = agri/10;

    answer(1,agri)=NRL09(ss,fre,agr,pol);
    answer(2,agri)=NRL12(ss,fre,agr,pol);
    answer(3,agri)=GIT78(ss, agr, fre, wdir, pol);

end

answer(4,:) = answer(1,:) - 15;
answer(5,1) = -51;
answer(5,3) = -45;
answer(5,10) = -39;
answer(5,30) = -38;
answer(5,99) = -32;

figure
x = [1:99];
plot(x,answer(1,1:99),x,answer(2,1:99),x,answer(3,1:99),x,answer(4,1:99),x,answer(5,1:99),'o')
axis
grid on
legend('NRL', 'FIXNRL','GIT78', 'NRL-15','NATHANSON')

