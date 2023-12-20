function [P,c,M,N] = Hermite (x, y)

n = length(x);
M = zeros(n,n);
M(:,1) = y;

  for j=2:n
    for i = j:n
      if x(i)==x(i-j+1)
        M(i,j) = input("Ingrese la derivada");
      else
        M(i,j) = (M(i,j-1)-M(i-1,j-1))./(x(i)-x(i-j+1));
      endif
    endfor
  endfor

  c = diag(M)';

  P = zeros(1,n);
  P(n) = c(1);
  N = zeros(n,n);
  N(1,n) = 1;

  for i=2:n
    N(i,n-i+1:n) = poly(x(1:i-1));
    P = P + c(i)*N(i,:);
  endfor

endfunction
