function erro = FuncaoObjetivo(K)

    Kp = K(1); % Renomear o nome da variavel no Modelo Simulink 
    Ki = K(2);
    Kd = K(3);


    opt=simset('solver','ode5','SrcWorkspace','Current');
    % Simulation do Simulink_PID.mdl no intervalo 0..10 s
    [tout,xout,yout] = sim('Simulink_PID',[0 10],opt);

    
    % calculo do sinal do erro; neste caso aqui a saida desejada é  1 (função degrau)
    [a b] = size(yout);
    erro = 1-(sum(yout)/a);

end

