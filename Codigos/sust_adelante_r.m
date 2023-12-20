function [p] = sust_adelante_r (A,b)
 n = length(A);
 p = zeros(n,1);
 for i=1:n
   p(i)=(b(i)-(A(i,1:i-1)*p(1:i-1)))/A(i,i);
 endfor
endfunction