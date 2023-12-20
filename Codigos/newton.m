function [x h1 i] = newton(f,df,x0,kmax,tol)
  i=1;
  while i < kmax
    x=x0-f(x0)/df(x0);
    h1 = abs(x-x0);%Cambiar a necesidad de error
    h2 = abs(x-x0)/abs(x);
    h3 = abs(f(x));
    if h2 < tol 
      return;
    endif
    i++;
    x0=x;
  endwhile
  disp('No converge en máximas iteraciones')
  endfunction