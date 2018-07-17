plot (t_d,y_d,'g',tpid_d,ypid_d,'m');
legend ('Degrau','PID');
grid;
figure;

plot (tpid_sin,ypid_sin,'m',sin_t,sin_y,'g');
legend ('PID','Senóide');
grid;
figure;

plot (t_d,y_d,'g',tfinal_d,yfinal_d,'r');
legend ('Degrau','Fuzzy Manual');
grid;
figure;

plot (tfinal_sin,yfinal_sin,'r',sin_t,sin_y,'g');
legend ('Fuzzy Manual','Senóide');
grid;
figure;

plot (t_d,y_d,'g',totim_d,yotim_d,'b');
legend ('Degrau','Fuzzy Otimizado');
grid;
figure;

plot (totim_sin,yotim_sin,'b',sin_t,sin_y,'g');
legend ('Fuzzy Otimizado','Senóide');
grid;
figure;

%todos

plot (t_d,y_d,'g',tpid_d,ypid_d,'m',tfinal_d,yfinal_d,'r',totim_d,yotim_d,'b');
legend ('Degrau','PID','Fuzzy Manual','Fuzzy Otimizado');
grid;
figure

plot (tpid_sin,ypid_sin,'m',tfinal_sin,yfinal_sin,'r',totim_sin,yotim_sin,'b',sin_t,sin_y,'g');
legend ('PID','Fuzzy Manual','Fuzzy Otimizado','Senóide');
grid;





