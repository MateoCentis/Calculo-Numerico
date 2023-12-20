# Aproximacion por minimos cuadrados.
# Ej9TP05MC
clear all
clf
clc

 x = [0 1 2 3 4 5 6]
 y = [432 599 1012 1909 2977 4190 5961]

%a) n=6
n = 4;
p = polyfit(x,y,n);
z = polyval(p,x);
zplot =@(x) polyval(p,x);
%Grafico
format long
figure(1)
plot(x,y,'r*');
xlabel ('X')
ylabel('Y')
grid on
hold on
title('Ajuste grado 6')
plot(x, z, 'm')
hold off

%b) n=1
p1 = polyfit(x,y,1);
f1 = polyval(p1,x);
f1plot =@(x) polyval(p1,x);
figure(2)
plot(x,y,'r*');
xlabel ('X')
ylabel('Y')
grid on
hold on
title('Ajuste grado 1')
plot(x, f1, 'm')
hold off

%c) n=2
p2 = polyfit(x,y,2);
f2 = polyval(p2,x);
f2plot =@(x) polyval(p2,x);
figure(3)
plot(x,y,'r*');
xlabel ('X')
ylabel('Y')
grid on
hold on
title('Ajuste grado 2')
plot(x, f2, 'm')
hold off

%d) 
error1 = norm(y-f1)
error2 = norm(y-f2)
error6 = norm(y-z)
%el modelo mas apropiado es n=6 

%e)
figure(4)
hold on
title('Ajuste grado 4 al cabo de 20 semanas')
ezplot(zplot,[0 10])
xlabel('x')
ylabel('y')
grid on
grid minor
hold off

figure(5)
hold on
title('Ajuste grado 1 al cabo de 10 semanas')
ezplot(f1plot,[0 10])
xlabel('x')
ylabel('y')
grid on
grid minor
hold off

figure(6)
hold on
title('Ajuste grado 2 al cabo de 10 semanas')
ezplot(f2plot,[0 10])
xlabel('x')
ylabel('y')
grid on
grid minor
hold off
%Se puede observar claramente que el ajuste grado 1 o 2 es mas fiable a lo largo del tiempo

%f) 
xReal=14900;
errorRelativo6 = abs((xReal - zplot(10))/xReal);
errorRelativo2 = abs((xReal - f2plot(10))/xReal);
errorRelativo1 = abs((xReal - f1plot(10))/xReal);
erroRelativo4 = abs((xReal-zplot(10))/xReal);
error6norma = norm(xReal-zplot(10));
ecm4 = sum((y - z).^2);
%error4norma = norm(xReal-
error2norma = norm(xReal-f2plot(10));
error1norma = norm(xReal-f1plot(10));


