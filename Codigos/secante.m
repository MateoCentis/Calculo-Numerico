function [p h i] = secante(f,p0,p1,kmax,tol)
  i=2;
  q0=f(p0);
  q1=f(p1);
  while i < kmax
    p = p1 - (q1*(p1-p0))/(q1-q0);
    h = abs(p - p1);
    if h < tol 
      return;
    endif
    i++;
    p0 = p1;
    q0 = q1;
    p1 = p;
    q1 = f(p);
  endwhile
  endfunction