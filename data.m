clc
clear all
close all
nathanson = NaN(2,7,7,7);
degname = ["0.1","0.3","1","3","10","30","60"];
ssname = ["0","1","2","3","4","5","6"];
polname = ["vv","hh"];
frename = ["UHF","L","S","C","X","Ku","Ka"];
load('57.mat')
for deg = 6:7
    for ss = 1:7
        for pol = 1:2
            for fre = 1:7
                dd = [" deg ",degname(deg);" ss ",ssname(ss);" pol ",polname(pol);" fre ",frename(fre)];
                disp(dd)
                temp = input('')
                if any(temp)
                     nathanson(pol,ss,fre,deg) = temp;
                else
                     nathanson(pol,ss,fre,deg) = nan;
                end
            end 
        end
        name = [num2str(deg),num2str(ss),'.mat'];
        save(name,'nathanson')
    end
end