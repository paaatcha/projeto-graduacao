
function erro = simula (vecKs)
	kp = vecKs(1);
	ki = vecKs(2);
	kd = vecKs(3);
	
	carro = tf ([6.3900],[1 8.8760]);
    integ = tf ([1],[1 0]);
	control = pid(kp,ki,kd);
    Gpc = control*carro*integ;
	ftmf = (Gpc)/(1+(Gpc));
	
	[yout tout] = step(ftmf,10);
    [a b] = size(yout);
    
    %max(yout)
    overshoot = abs(max(yout)-1);
    if overshoot > 0.05
        overshoot = 10;
    end
    
    ess = 1-(sum(yout)/a);
    %overshoot
    erro = abs(0.5*overshoot + 0.5*ess);
    step(ftmf,5);
            
end
