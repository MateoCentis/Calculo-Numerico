function [p] = sust_atras_r (A,b)
 n = length(A);
 p = zeros(n,1);%Vector que vamos a devolver
 for i=n:-1:1%Va desde n hasta 1
p(i) = (b(i) - A(i,i+1:n) * p(i+1:n)) / A(i,i);
%Resta al i�simo valor del vector de t�rminos independientes 
%el producto escalar de la fila i�sima por los t�rminos inependientes que ya sacamos y divide
%por la diagonal.
 endfor
endfunction
