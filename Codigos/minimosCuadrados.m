%Calculo de minimos cuadrado
p6 = polyfit(x,y,6)%Interpolacion de grado 6
f6 = @(x) polyval(p6,x);%El polinomio de grado 6
erc= norm(y-f6(x))^2;%norm nos da la norma 2 con raiz cuadrada por lo que la elevamos al cuadrado
%finalmente esto nos da el error cuadratico
%polyval(p,x): evalua elf polinomio p en x.
%q=polyint(p): almacena en q el polinomio (vector) integral de p, con constante de integracion 0.
%q=polyder(p): almacena en q el polinomio (vector) derivada de p.
%polyfit(x,y,n): encuentra el polinomio interpolante que pasa por los datos dados.
