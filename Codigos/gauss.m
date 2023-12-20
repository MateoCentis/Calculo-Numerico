function [x,it] = gauss(A,b)
n=length(A(1,:));
it = 1;
for k=1:n
m = A(k+1:n,k)/A(k,k);
b(k+1:n) = b(k+1:n) - m*b(k);
A(k+1:n,k:n) = A(k+1:n,k:n) - m*A(k,k:n);
++it;
endfor

x=sust_atras(A,b);
endfunction

%9: A(r(k+1:n),k) = A(r(k+1:n),k)/A(r(k),k);
%10: A(r(k+1:n),k+1:n+1) -= A(r(k+1:n),k)*A(r(k),k+1:n+1);
%Linea 9
%b NO PORQUE SUMA
%H NO PORQUE NO USA EL r
%m no usa el r para el b(k)
%n es

%linea 10
%d no porque multiplica el m despues 
%f no porque las filas deben ir hasta k+1
%L no porque no usa el r
%o puede no ser porque va de k+1 a n en columnas

%A simetrica definida positiva 
%ambos convergen
%Gauss seidel 
%radio espectral matriz iteracion <1
%
%Gradientes conjugados 
%radio Espectral matriz iteracion < 1
%