#Ej2TP8.m (incluye el calculo por diferencias finitas del problema 3)
% metodo del disparo lineal
clear all; clc; clf
format long
%f =@(x) [0*x 0*x-5 100*x.*(1-x)];
f =@(x) [-2./x  2./x.^2  sin(log(x))./x.^2];

inter = [1,2];
yc = [1 2];
L=10;

%[xd,yd] = disparo_linealJJ(f,inter,yc,L);
[xd,yd] = disparo_lineal(f,inter,yc,L);

% calculamos la exacta:
c2=(1/70)*(8-12*sin(log(2))-4*cos(log(2)));
c1 = (11/10)-c2;
xx = linspace(1,2,L+1)
fexacta = @(x) c1.*x + (c2./x.^2)-(3/10)*sin(log(x))-(1/10)*cos(log(x));
fex=fexacta(xx);
%============================================================
% Incorporamos el problema 3 
% calculo por diferencias finitas con condiciones Dirichlet
[xdif,ydif]=dif_fin_dir(f,inter,yc,L);

fexDF=fexacta(xdif)';
%============================================================
% Graficamos todos los calculos y comparamos con la exacta.
figure(1)
% Solucion del metodo del disparo:
plot(xd,yd,'b-*')
hold on
% Solucion de la exacta:
plot(xx,fex,'r-d')

% Solucion del metodo de diferencias finitas
plot(xdif,ydif,'k-o')


xlabel('valores de x')
ylabel('Solucion de la ecuacion diferencial')
title('Metodo del disparo y Método de Diferencias Finitas')
grid on
grid minor
hold off

%===========================================================
%Calculoi robin
[tRob yRob] = dif_fin_rob(f,inter,yc(1),[0 0 yc(2)],10);


%===========================================================
% Calculo del error
ErrorDisparo=abs((fex' - yd));
ErrorDF = abs((fexDF' - ydif));
figure(2)
semilogy(xx,ErrorDisparo,'b-*')
hold on
semilogy(xdif,ErrorDF,'k-d')
%loglog(xx,ErrorDisparo,'b-*')
grid on
grid minor
hold off
%===========================================================
figure(3)
semilogy(xdif,ErrorDF,'k-d')
grid on
grid minor