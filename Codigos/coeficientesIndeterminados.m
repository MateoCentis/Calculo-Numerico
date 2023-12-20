function v = coeficientesIndeterminados (x, y)
  n = length(x);
  A = zeros(n,n);

  for i = 1:n
    for j = 0:(n-1)
      A(i,j+1) = x(i).^j;
    endfor
  endfor

  v = A\y;

endfunction
