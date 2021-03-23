clear all
close all
ss = 2;
fre = 456e6;
pol = 'hh';
wdir = 90;
answer = zeros(6,101)*nan;
for agri = 1:99
    agr = agri/10;
    answer(1,agri)=HYB(ss,fre,agr,pol,wdir);
    answer(2,agri)=NRL12(ss,fre,agr,pol);
    answer(3,agri)=GIT78(ss, agr, fre, wdir, pol);
    answer(4,agri)=TSC(ss,agr,pol,fre,wdir);
    answer(5,agri)=NRL09(ss,fre,agr,pol)-15;

end

answer(6,1) = -95;
answer(6,3) = -78;
answer(6,10) = -82;
answer(6,30) = -66;
answer(6,99) = -54;

figure
x = [1:99];
plot(x,answer(1,1:99),x,answer(2,1:99),x,answer(3,1:99),x,answer(4,1:99),x,answer(5,1:99),x,answer(6,1:99),'o')
axis
grid on
legend('HYB', 'NRL','GIT', 'TSC','NRL-ERROR','NATHANSON')
