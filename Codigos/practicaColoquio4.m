%Ejercicio pendulo repaso runge-kutta
L=1;
h=3/4;
y0=pi/2;
vel0=0;
tita0=acos(h/L);
a=0;
b=5;
condiciones=[y0 vel0];
N=200;
G=@(t,w)[w(2);
         (-0.8*w(2)).*(abs(w(1))<tita0)-sin(w(1))];
%f=@(t,z)[z(2);
%         (-0.8.*z(2)-sin(z(1))).*(abs(z(1))<tita0)+(0.*z(2)-sin(z(1))).*(abs(z(1))>=tita0)];
[xRes yRes] = rungeKutta4(G,a,b,condiciones,N);
pos=yRes(:,1);
vel=yRes(:,2);
pos5segundos = pos(end)%-0.12458
vel5segundos = vel(end)%0.288 izquierda a derecha
figure(1)
plot(xRes,vel)%Cambia la posicion al cambiar de ser descendente a ascendente
grid on 
grid minor
[S dS] = funcion_spline(xRes',pos',0,0);
[punto h _] = biseccion(dS,3,3.5,10000,10e-6);
punto%3.28 truncado

%-------------------------------------------------------------------------------
%Ejercicio spline final
f=@(x)log(x.^2+1)-e.^(x./2).*cos(pi.*x);
df=@(x)(2.*x)./(x.^2+1)-(pi.*sin(pi.*x).*(-1).*e.^(x./2)+(1/2).*e.^(x./2).*cos(pi.*x));

x=linspace(-5,6,9);
fx=f(x);
%Con la aproximación a la derivada también anda
[d0 h0] = derivada3puntos(f,-5,-6,6);
[dn hn] = derivada3puntos(f,6,-6,6);
[S dS] = funcion_spline(x,fx,d0(1),dn(1));
[S dS] = funcion_spline(x,fx,df(-5),df(6));

error=abs(f(4.2)-S(4.2))
%COMENTARIO PARA AHORRAR TIEMPO DE COMPILACION
figure(2) 
plot(x,f(x),'-b','linewidth',2)
hold on
plot(x,S(x),'r-')
grid on
grid minor
plot(x,dS(x),'b-*','linewidth',2)
aux=@(x)x.*0;
plot(x,aux(x),'k-')
legend('S(x)','dS(x)')
%error menor a 10^-9 valor para el cual la spline encuentra su maximo
error=10^-9;
[puntoMaximo _ __] = biseccion(dS,2,6,10000,error);
puntoMaximo%Punto maximo de la S
%valor maximo
valorMaximo=S(puntoMaximo)
disp(" ")
disp(" ")
%-------------------------------------------------------------------------------
%Ejercicio pendulos acoplados
L=15;
m1=1;
m2=3;
k=3;
g=9.81;
posInic1=0;
velInic1=-1;
posInic2=0;
velInic2=1;
condiciones=[posInic1 velInic1 posInic2 velInic2];
F=@(x,w)[w(2);
         -(g/L).*w(1)-(k/m1).*(w(1)-w(3));
         w(4);
         -(g/L).*w(3)-(k/m2).*(w(1)-w(3))];
N=1000;
a=0;
b=10;
[xRes yRes] = rungeKutta4(F,a,b,condiciones,N);
pos1=yRes(:,1);
vel1=yRes(:,2);
pos2=yRes(:,3);
vel2=yRes(:,4);
posicion1Final=pos1(end)
direccion1Final=vel1(end)
posicion2Final=pos2(end)
direccion2Final=vel2(end)
%-------------------------------------------------------------------------------
%Ejercicio masa-resorte-amortiguador
%EJERCICIO PVI RESORTE-MASA
m=20;
k=20;
c=10;
F=@(t,w)[w(2);
         -(c/m).*w(2)-(k/m).*w(1)];
a=0;
b=10;
y0=[1 0];
n=400;
[xSol ySol] = rungeKutta4(F,a,b,y0,n);
pos = ySol(:,1);
vel = ySol(:,2);
figure(3)
plot(xSol,pos,'r-')
grid on;
grid minor;
hold on
plot(xSol,vel,'b-')
legend('posicion','velocidad')
%Solucion (a)
resA = pos(end);
%Velocidad maxima y en que tiempo ocurre
velMayor= -10;
for i=1:length(vel)
    if vel(i) > velMayor
      tiempoMayor = xSol(i);
      velMayor = vel(i);
    endif
endfor
%tiempoMayor
%velMayor
