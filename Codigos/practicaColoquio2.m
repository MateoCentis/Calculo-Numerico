%Ej6TP8.m
% PVC calentamiento de una barra de cobre con una fuente. Difusion-reaccion
% Ley de enfriamiento de Newton
% PVC tipo Robin -K0*u'(L) = H(u(L)-ue);
% -0.9*u'(3)-15*u(3)= -15*4
clear all,clc,format long g
disp("Relacionado Ej6 TP8")%CORRECTO
Largo=5;
k0=0.9;
H=15;
uE=4;
fuente=@(x)5.*x.*(5-x);
cR=@(x)0.5.*x+0.5;%Cambio
F=@(x)[0.*x cR(x)./k0 -fuente(x)./k0];
inter=[0,Largo];
condRobin=[k0 H uE*H];
y0=6;
L=350;
[xRes yRes] = dif_fin_rob(F,inter,y0,condRobin,L);
%Temperatura en el punto medio
medio=length(yRes)/2;
disp("Respuesta (a)")
if mod(L,2) != 0 
  yRes(medio)%Tiene que dar 15.7496
else 
  yRes(medio+0.5)
endif
disp(" ")
%Flujo en el extremo izquierdo
h=abs(xRes(1)-xRes(2));
d0=(yRes(2)-yRes(1))./h;
disp("Respuesta (b)")
flujo0=-k0*d0%Tiene que dar -7.99
figure(1)
plot(xRes,yRes)
disp(" ")
%-------------------------------------------------------------------------------
%Relacionado al Ej5 TP8 
disp("Relacionado al Ej5 TP8")
%H=15;                % Coeficiente convectivo en la frontera
%ue=4;                      % Temperatura exterior
%K0=1;                   % Conductividad termica (depende del material)
%No nos interesa k0=1
fuente=@(x) 20.*sin(5.*(x-1));    % Fuente de calor "r"
cR = @(x) 0.*x+2;      % proceso reactivo
Largo=3; 
yc=[21 0];   % temperatura extremo izquierdo
f =@(x) [0.*x cR(x) -fuente(x)];
h=0.1;
L = 600;
y0=21;
inter=[0 Largo];
rob=[1 0 0];
[xRes,yRes] = dif_fin_rob(f,inter,y0,rob,L);
%[xRes yRes] = dif_fin_dir(f,inter,yc,L);
figure(2)
plot(xRes,yRes)
%Temperatura en el extremo derecho de la barra
disp("Respuesta (a)")
tempB = yRes(end)

%flujo extremo izquierdo
h=abs(xRes(2)-xRes(3));
d0=-(yRes(1)-yRes(2))./h;
disp("Respuesta (b)")
dosPuntos=-d0%Tiene que dar 27.488
%Para calcular el flujo en el extremo izquierdo
%se tiene que usar la aproximación de 3 puntos 
%descentralizada 
Aprox=(4*yRes(2)-yRes(3)-3*yRes(1))/(2*h);
central=-Aprox
res=(2*yRes(1)+fuente(0)).*h.^2+2.*yRes(1)-yRes(2);
noCentral=-(yRes(2)-res)/(2*h)
aproxFinal=-(yRes(2)-yRes(1))/h
%aprox3=yRes(1)