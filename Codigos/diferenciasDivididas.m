function [c,M] = diferenciasDivididas (x, y)

n = length(x);
M = zeros(n,n);
M(:,1) = y;

  for j=2:n
    for i = j:n
      M(i,j) = (M(i,j-1)-M(i-1,j-1))./(x(i)-x(i-j+1));
    endfor
  endfor

  c = diag(M)';

endfunction
