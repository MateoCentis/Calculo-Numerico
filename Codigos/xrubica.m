%Está mal
function [r] = xrubica(a)
  tol = 10e-12;
  f=@(x)x.^3;
  amin=2;
  b=a;
  kmax = 2000;
  %[r  tol] = biseccion(f,amin,b,kmax,tol);
  [r tol] = biseccion2(f,amin,b,tol)
  endfunction
