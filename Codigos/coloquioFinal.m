Largo=2;%queda igual
k0=0.57;
y0=6;%queda igual
H=15;%queda igual
ue=4;%queda igual
fuente=@(x)(2.*x).*(2-x);
cR=@(x) (0.1).*(x.^3)+2.5;
F=@(x)[0.*x cR(x)./k0 -fuente(x)./k0];
inter=[0 Largo];
condRobin=[k0 H H*ue];
L=10000;
[xRes yRes] = dif_fin_rob(F,inter,y0,condRobin,L);
%Para spline
%Ls=250;
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
%calculoAlt
%nodofic=-k0*(2*h*(H*yRes(end)-H*ue)-yRes(end-1));
%flujo = (nodofic-yRes(end-1))/(2*h)
%Aprox=(4*yRes(end)-nodofic-3*yRes(end-1))/(2*h)
[S dS] = funcion_spline(xS',yS',Aprox,d0);%Sirve para abajo tambien
disp("Respuesta (c)")
c=0.217;%queda igual
p=2.7;%queda igual
A=0.01;%queda igual
f=@(x)c.*p.*S(x);
E = A.*cuad_gauss_c(f,0,Largo,Ls,10)