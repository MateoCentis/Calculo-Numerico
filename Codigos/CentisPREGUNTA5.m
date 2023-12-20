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
pos20_1=x1(length(x1))
pos20_2=x2(length(x2))
vel20_1=dx1(length(dx1))
vel20_2=dx2(length(dx2))
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
