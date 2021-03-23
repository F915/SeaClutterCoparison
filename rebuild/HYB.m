function sigma0 = HYB(ss,fre,agr,pol,wdir)
    c =  physconst('LightSpeed');
    lambda  = c/fre;
    fre = fre / 1e9;
    if fre >12.5
        sigmaref = 3.25*log10(fre)-42.0;
    else
        sigmaref = 24.4*log10(fre)-65.2;
    end
    

    thetaref = 0.1;
    sigmah = 0.031*ss*ss;
    thetat = asin(0.0632*lambda/sigmah)*180/pi;
    if thetat >= thetaref
        if agr<thetaref
            kg = 0;
        elseif thetaref<= agr && agr <= thetat
            kg = 20*log10(agr/thetaref);
        elseif thetat<=agr && agr<=30
            kg = 20*log10(thetat/thetaref)+10*log10(agr/thetat);
        else
            disp("error")
        end
    else
        if agr<thetaref
            kg = 0;
        elseif thetaref< agr 
            kg = 10*log10(agr/thetaref);
        else
            disp("error")
        end
    end
    
    ks = 5*(ss-5);

    hav = 0.08*ss*ss;

    if all(pol == 'vv')
        kp = 0;
    elseif all(pol == 'hh')
        if fre < 3
            kp = 1.7*log(hav+0.015)-3.8*log(lambda)-2.5*log(agr/57.3+0.0001)-22.2;
        elseif fre >=3 && fre <= 10
            kp = 1.1*log(hav+0.015)-1.1*log(lambda)-1.3*log(agr/57.3+0.0001)-9.7;
        else
            kp = 1.4*log(hav)-3.4*log(lambda)-1.3*log(agr/57.3)-18.6;
        end
    else
        disp('error')
    end

    kd = (2+1.7*log10(0.1/lambda))*(cos(wdir*pi/180)-1);
    
    sigma0 = sigmaref + kg + ks + kp + kd;
end