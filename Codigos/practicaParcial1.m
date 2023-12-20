A=[0.5 -1 0;-1 3 -1;0 -1 2];
b=[7 4 5]';
n = length(A);
r=1:n;
for k=1:n
  %Correcion linea 5
  [g p] = max(abs(A(r(k:n),k)));
  p = p + k - 1;
  r( [k,p] ) = r( [p k] );
  m = A(r(k+1:n),k)/A(r(k),k);
  b(r(k+1:n)) = b(r(k+1:n)) - m*b(r(k));%Se le puso el r(k)
  A(r(k+1:n),k+1:n) -= A(r(k),k+1:n)*m;
endfor
A=[A b];
 x = sust_atras_p(A(r,:))