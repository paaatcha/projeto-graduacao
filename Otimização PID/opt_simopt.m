% opt_simopt.m
% Kap. 7.7
% Optimizacao dos parametros do controlador de um modelo Simulink

% Execu��o da otimiza��o do Modlelo Smulink simopt.mdl 
x0=[1, 1, 1];  % Valores iniciais dos parametros do contolador 
options = optimset('LargeScale','off','Display','iter',...
                   'TolX',0.05,'TolFun',0.05);
x = lsqnonlin(@simopterror,x0,[],[],options)   % iniciar a optimiza��o

% Renomear as variaveis 
Kp = x(1); Ki = x(2); Kd = x(3);
