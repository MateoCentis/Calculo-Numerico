%diferencias divididas
%se ponen los y en una matriz y se arma como la tabla a mano
%dentro de la matriz, dividiendo por los x que se 
%los tiene a parte
function [c M] = diff_div_mio(x,y)
  n = length(x);
  M = zeros(n);
  M(:,1) = y;
  for i=1: n
    for j=2 : i
      M(i,j) = (M(i,j-1)-M(i-1,j-1))./(x(i)-x(i-j+1));    
    endfor
  endfor
  c=diag(M);%c son los coeficientes, luego tenemos que
  %armar el polinomio. Lagrange si devuelve el polinomio 
  %armado ya 
  M
  endfunction