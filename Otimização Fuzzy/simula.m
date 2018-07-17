
function erro = simula (fis)
	%t = 0:10;
    opt=simset('SrcWorkspace','Current');
    FuzzyFinal = fis;%readfis('FuzzyFinal.fis');
    % Simulando
    [tout xout yout] = sim('Simulink_Fuzzy',[0 10],opt);
    %plot(tout,yout);

        
    overshoot = abs(max(yout)-1);
    if overshoot > 0.05
        overshoot = 10;
    end    
    
    [tam b] = size(yout);    
    % a = a quantidade discretizada da resposta
    a = floor(tam/5); % pegarei os ultimos 20% da resposta para analisar ess
    vEss = yout(tam-a:tam);
    ess = abs(1-(sum(vEss)/(a+1)));
    erro = abs(0.5*overshoot + 0.5*ess);
            
end
