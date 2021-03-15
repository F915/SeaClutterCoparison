clear all
close all
ss = 3;
fre = 9.3e9;
wdir = 90;
pol = 'hh';
windspeed = 3.16*(ss^0.8);
u = 3.16*(ss^0.8);
answer = zeros(10,101)*nan;
for agri = 1:99
    agr = agri/10;
    answer(1,agri)=GIT78(ss, agr, fre, wdir,pol);
    answer(2,agri)=GIT79(ss, agr, fre, wdir,pol);
    answer(3,agri)=NRL09(ss,fre,agr,pol);
    answer(4,agri)=NRL12(ss,fre,agr,pol);
    answer(5,agri)=RRE(ss, agr, pol);
    answer(6,agri)=SIT(agr,wdir,windspeed,pol);
    answer(7,agri)=TSC(ss,agr,pol,fre,wdir);
end
answer(10,1) = -51;
answer(10,3) = -45;
answer(10,10) = -39;
answer(10,30) = -38;
answer(10,99) = -32;
%answer(8,:) = answer(3,:) - 15;
%answer(9,:) = answer(4,:) - 15;
figure
x = [1:99];
plot(x,answer(1,1:99),x,answer(2,1:99),x,answer(3,1:99),x,answer(4,1:99),x,answer(5,1:99),x,answer(6,1:99),x,answer(7,1:99),x,answer(8,1:99),x,answer(9,1:99),x,answer(10,1:99),'o')
axis
legend('GIT78', 'GIT79', 'NRL09', 'NRL12', 'RRE', 'SIT', 'TSC','FIXNRL09', 'FIXNRL12','NATHANSON')

