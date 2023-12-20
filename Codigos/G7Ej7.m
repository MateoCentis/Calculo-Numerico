%Sistema Ejercicio7
%
f=@(t,x)[-t*x(2);%El x(1) y x(2) son las "incognitas" del sistema.
         t*x(1)-t*x(2)];
y0=[1;-1];
a=0;
b=20;
h=0.05;
n=(b-a)/h;
[t,x]=rungeKutta4(f,a,b,y0,n);
figure(1)
plot(x(:,1),x(:,2),'r-');
grid on;
grid minor;
title('Solución');
xlabel('x');
ylabel('y');
