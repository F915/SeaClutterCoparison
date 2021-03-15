clear all
close all
ss = 3;
fre = 9.3e9;
pol = 'hh';
wdir = 90;
windspeed = 3.16*(ss^0.8);
u = 3.16*(ss^0.8);
answer = zeros(8,101)*nan;
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

%answer(3,:) = answer(1,:) - 15;
%answer(4,:) = answer(2,:) - 15;

answer(8,1) = -51;
answer(8,3) = -45;
answer(8,10) = -39;
answer(8,30) = -38;
answer(8,99) = -32;

avr = zeros(10,1);
for index = 1:7
    avr(index,:) = (abs(answer(index,1)-answer(8,1))+abs(answer(index,3)-answer(8,3))+abs(answer(index,10)-answer(8,10))+abs(answer(index,30)-answer(8,30))+abs(answer(index,99)-answer(8,99)))/5
end
figure
x = [1:99];
plot(x,answer(1,1:99),x,answer(3,1:99),x,answer(4,1:99),x,answer(6,1:99),x,answer(7,1:99),x,answer(8,1:99),'o')
axis
grid on
legend('GIT78','NRL09','NRL12','SIT','TSC','NATHANSON')

