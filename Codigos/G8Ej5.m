%Ej5TP8.m
% PVC calentamiento de una barra de cobre con una fuente. Difusion-reaccion
% Ley de enfriamiento de Newton
% PVC tipo Robin -K0*u'(L) = H(u(L)-ue);
% -0.9*u'(3)-15*u(3)= -15*4
clear all,clc
                  
y0=21;                      % temperatura extremo izquierdo
%Hnewton=15;                % Coeficiente convectivo en la frontera
%ue=4;                      % Temperatura exterior
K0=1;                   % Conductividad termica (depende del material)
fuente=@(x) 20.*sin(5.*(x-1));    % Fuente de calor "r"
%pR = @(x) (1.05)*x+2;      % proceso reactivo
Largo=3; 
f =@(x) [0.*x 0.*x -fuente(x)];
h=0.1;% Longitud de la barra
L = Largo/h;
inter=[0 Largo];
rob=[0 15 0];
[xDFR,yDFR] = dif_fin_rob(f,inter,y0,rob,L);
[xDFR2 yDFR2] = dif_fin_dir(f,inter,[y0 0],L);
dif = abs(yDFR-yDFR2);
%Temperatura en el extremo derecho de la barra
[xDFR2,yDFR2] = dif_fin_rob(f,inter,y0,rob,2*L);
tempB = yDFR(end);
tempB2 = yDFR2(end);

figure(1)
plot(xDFR,yDFR,'b-*');
title('Temperatura a la largo de la barra calculada por DFinitas con h=0.1')
xlabel('posicion: X')
ylabel('Temperatura')
grid on; grid minor

%Temperatura maxima
%La temperatura es maxima al comienzo de la barra 
tempMax = yDFR(1);