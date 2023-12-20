function[x] =eliminacionGauss(A,b)
n = length(A);
  r = 1:n;
  for k=1:n
    [~,p] = max(abs(A(r(k:n),k)));
    p = p + k - 1; 
    r( [k,p] ) = r( [p,k] );
    m = A(r(k+1:n),k)/A(r(k),k);
    b(r(k+1:n)) = b(r(k+1:n)) - m*b(r(k));
   A(r(k+1:n),r(k+1:n)) -= m*A(r(k),r(k+1:n));
  end
  A=[A b];
   A(r,:);
  x = sust_atras_p(A);
endfunction