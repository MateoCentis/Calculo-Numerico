function [x,t] = egauss (A,b)
 tic();
 n = length(A(1,:));
 for i = 1:n
b(i+1:n) = b(i+1:n) - A(i+1:n,i)*b(i)/A(i,i);
 A(i+1:n,i:n) = A(i+1:n, i:n) - A(i+1:n, i) * (A(i,i:n)) / A(i,i);
 endfor
[x] = sust_atras_r (A,b);
 t=toc();
endfunction