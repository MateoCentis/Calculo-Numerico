%EjParcial parecido al 10 del TP5
#Ej10TP5
clear all
clc
x=[-1 0 1 2];
y=[-1.1 -0.4 -0.9 -2.7];

c = polyfit(x,log(-y),2) # polinomio de ajuste de orden cuadratico.
# y = -exp(ax^2+bx+c); lo poemos de esta manera para generar un 
# polinomio con el exponente: log(-y) = ax^2 + bx+c;

f = @(x) -exp(polyval(c,x));

# lo vemos graficamente:
xx = linspace(-1.5,2.5,201);
plot(x,y,'o',xx,f(xx))
grid on

# Medimos el error

errf = norm(y - f(x)) # error cuadratico usando la funcion norm
ErrRelat = (-0.9-f(1))/(-0.9)
# error realtivo en el punto 0