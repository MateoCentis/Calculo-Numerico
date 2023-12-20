clc,clear all,format long g
%Relacionado al ej5 TP8 (2)
H=5;
ue=10;
Largo=3;
y0=21;
k0=1;%Not neccesary
fuente=@(x)20.*sin(5.*(x-1));
F=@(x) [0.*x 0.*x -fuente(x)];
condRobin=[k0 H H*ue];
inter=[0,Largo];
L=20000;
[xRes yRes] = dif_fin_rob(F,inter,y0,condRobin,L);
disp("Temperatura en el extremo derecho")
yRes(end)%tiene que dar 11.241
disp("Flujo en el extremo derecho")
Ls=250;
[xS yS] = dif_fin_rob(F,inter,y0,condRobin,Ls);
[S dS] = funcion_spline(xS',yS',0,0);
h=abs(xRes(end)-xRes(end-1));
d0=(yRes(end)-yRes(end-1))./h;
flujo=(H/k0).*(yRes(end)-ue)
%flujo=-d0%Tiene que dar 6.208
%flujoAlt = -dS(xS(end))
disp(" ")
figure(1)
plot(xRes,yRes,'b-')
title('Relacionado al Ej5 tp8')
xlabel('x')
ylabel ('y')
grid on
grid minor
%-------------------------------------------------------------------------------
Largo=2;
k0=0.57;
y0=6;
H=15;
ue=4;
fuente=@(x)(2.*x).*(2-x);
cR=@(x) (0.1).*(x.^3)+2.5;
F=@(x)[0.*x cR(x)./k0 -fuente(x)./k0];
inter=[0 Largo];
condRobin=[k0 H H*ue];
L=Largo/0.0001;
[xRes yRes] = dif_fin_rob(F,inter,y0,condRobin,L);
%Para spline
Ls=250;
[xS yS] = dif_fin_rob(F,inter,y0,condRobin,Ls);
figure(2)
plot(xRes,yRes)
title('Relacionado al Ej5 tp8')
xlabel('x')
ylabel('y')
grid on 
grid minor
disp("Respuesta (a)")
yRes(end)%Correcto
disp("Respuesta (b)")
h=abs(xRes(end)-xRes(end-1));
d0=(yRes(end)-yRes(end-1))./h;
flujo0=-k0*d0
[S dS] = funcion_spline(xS',yS',0,0);%Sirve para abajo tambien
%flujoAlt=-k0*dS(xS(end))%Esta mal
disp("Respuesta (c)")
c=0.217;
p=2.7;
A=0.01;
f=@(x)c.*p.*S(x);
E = A.*cuad_gauss_c(f,0,Largo,Ls,2)