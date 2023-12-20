function [p,it,rh] = Biseccion(f,a,b,tol,kmax,corte)
 it = 1;
 for i=1:kmax
   p = a+(b-a)/2;
   rh(i) = abs((b-a)/2);
   if abs((b-a)/2)< tol && corte == 0 % Cifras decimales
     return;
   endif
   if abs((b-a)/b)< tol && corte == 1 % Cifras significativas relativo capaz por 2
     return;
   endif
   if f(p) < tol && corte == 2 % Por el valor de la funcion
     return;
   endif
   % p = f(a)*f(b)>0 ? a : b
   it = it +1;
   if f(a)*f(p)>0
     a = p;
    else
     b = p;
   endif
 endfor
 
 endfunction