function[x,it,r_h,t] = gauss_seidel(A,b,x0,tol,maxit)
  %Calculo longitud del vector b
  tic();
  n =length(b);
  it=1;
  error =1;
  r_h = [];
  x = x0;%Me garantizo que x sea un vector columna
  while(it<maxit && error > tol)
    %Aplico f�rmula
    for i=1:n
      %El cambio con Jacobi es que aca hago uso del vector corriente 
      x(i) = (b(i) - A(i,1:i-1)*x(1:i-1) - A(i,i+1:n)*x0(i+1:n))/A(i,i);
    endfor
    %C�lculo error 
    error = norm(x-x0,inf)/norm(x,inf);
    r_h = [r_h ; error];
    x0 = x;
    ++it;
  endwhile
  t = toc();
endfunction

