%Pregunta 1
x = [0 1 2 3 4 5 6];
y = [432 599 1012 1909 2977 4190 5961];
n = 4;
p = polyfit(x,y,n);
z = polyval(p,x);
zplot =@(x) polyval(p,x);
xReal=14900;
errorCuadratico = norm(y - zplot(x));
erroRelativo4 = abs((xReal-zplot(10))/xReal);

%Pregunta 2
tiempo=[0 1 1.9 2.7];
peso=[20000 17530 15500 11534];

[S dS] = funcion_spline(tiempo,peso,0,0);
tRes = S(2.3);

%Pregunta 3
a=0;
b=3;
L=30;
L2=60;
n=3;
f=@(x)2+cos(x)-sin(3.*x);
df=@(x)-sin(x)-3.*cos(3.*x);
rev=@(x) ((2.*pi).*f(x).*sqrt(1+df(x).^2));
r1=cuad_gauss_c(rev,a,b,L,n);
r2=cuad_gauss_c(rev,a,b,L2,n);
format long g
cifras=abs(r1-r2)%Es el numero de la exp + 1
r1;%77.52682283359198
r2;%77.52682855166869
%Para ver cifras exactas

%Pregunta 5
%Datos del ejercicio
m1=3;
m2=1;
k1=5;
k2=4;
%Condiciones iniciales
posInic1=0;
posInic2=1;
velInic1=0;
velInic2=0;
y0=[posInic1 velInic1 posInic2 velInic2];
n=1000;
ark=0;
brk=20;
f=@(t,w)[w(2);
         ((-k1-k2)/m1)*w(1)+(k2/m1)*w(3);
         w(4);
         k2/m2*(w(1)-w(3))];
[tSol wSol] = rungeKutta4(f,ark,brk,y0,n);
%Valor de las soluciones
x1 = wSol(:,1);
dx1=wSol(:,2);
x2=wSol(:,3);
dx2=wSol(:,4);

figure(1)
xx=linspace(1,1001,1001);
plot(xx,x1(xx),'r-')
title('Grafico de las posiciones')
hold on
grid on
grid minor
plot(xx,x2(xx),'b-')
figure(2)
plot(xx,dx1(xx),'r-')
title('Grafico de las velocidades');
hold on
grid on
grid minor
plot(xx,dx2(xx),'b-')

%Pregunta 1
110,350
0,567852
%P2
%a
%3
77,52682
7
%5
%-0,14793 derecha a izquierda
%-0,470689 izquierda a derecha