function [p] = sust_atras_r (A,b)
 n = length(A);
 p = zeros(n,1);%Vector que vamos a devolver
 for i=n:-1:1%Va desde n hasta 1
p(i) = (b(i) - A(i,i+1:n) * p(i+1:n)) / A(i,i);
%Resta al iésimo valor del vector de términos independientes 
%el producto escalar de la fila iésima por los términos inependientes que ya sacamos y divide
%por la diagonal.
 endfor
endfunction
