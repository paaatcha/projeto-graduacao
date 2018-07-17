% simopterror.m
% Kap. 7.7
% calculo do erro entre o valor desejado (set-point) e o valor real da saida do 
% Simulink-Modelo simopt.mdl
function F = simopterror(x)
Kp = x(1); % Renomear o nome da variavel no Modelo Simulink 
Ki = x(2);
Kd = x(3);
% set the option para o modelo simulink Simulink, 
% simopterror.m
opt=simset('solver','ode5','SrcWorkspace','Current');
% Simulation do simopt.mdl no intervalo 0..10 s
[tout,xout,yout] = sim('simopt',[0 10],opt);
F = yout - 1; % calculo do sinal do erro; neste caso aqui a saida desejada é  1 (função degrau)