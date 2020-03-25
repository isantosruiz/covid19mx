% Importar los datos del archivo de texto
T = readtable('coronavirus.txt');
bar(T.Fecha,T.Confirmados)

% Ajustar un modelo logístico
fun = @(c,t) c(1)./(1+c(2)*exp(-c(3)*t));
t = datenum(T.Fecha);
t = t - t(1);
c = lsqcurvefit(fun,[1000,1000,0.001],t,T.Confirmados)
plot(T.Fecha,T.Confirmados,'o',T.Fecha,fun(c,t),'--','LineWidth',1)
legend('Casos confirmados','Modelo logístico')
ylabel('Número de casos')