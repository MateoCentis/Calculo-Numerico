function [x,h] = puntofijo(g,x0,kmax,tol)%g es la funcion, x0 es la aproximacion inicial
   i=1;
   while i < kmax
     x = g(x0);
     h=abs(x-x0);
     if h<tol
       return;
     endif
     i++;
     x0=x;
   endwhile
  disp("No converge en máx iteraciones")
  endfunction