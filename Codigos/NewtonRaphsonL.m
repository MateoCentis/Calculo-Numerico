function [p,it,rh] =  NewtonRaphsonL(f,df,p0,tol,kmax,corte)
  i = 1;
  while i<kmax
    p = p0-f(p0)/df(p0);
    rh(i) = abs(p-p0);
    rh(i) = abs(p-p0);
    if abs((p-p0)) < tol && corte == 0
      break;
    endif
    if abs((p-p0)/p) < tol && corte == 1
      break;
    endif
    i = i+1;
    it = i;
    p0 = p;
  endwhile
  it = i;
 endfunction