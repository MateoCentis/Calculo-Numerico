
function [P L] = Lagrange_mio(x,y)
  n1 = length(x);
  n = n1-1;%grado de la funcion
  L = zeros(n1);
  %Formacion de los polinomios cardinales de Lagrande
  for k=1:n+1
    v=1;
    for j=1 : n+1
      if k ~= j
        
      endif
    endfor
  endfor
endfunction