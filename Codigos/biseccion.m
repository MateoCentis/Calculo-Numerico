function [p h2 i] = biseccion(f,a,b,kmax,tol)
  %a y b son [a,b] 
  %h es la convegencia<
  i=1;
  while i < kmax
    p = a + (b-a)/2;
    h1=f(p);%Elegir que convergencia usar
    h2=abs(b-a);
    h3=abs(b-a)/2;
    if h2<=tol 
      return
    endif
    i++;
    if f(b)*f(p) < 0
      a = p;
    else 
      b = p;
    endif
  endwhile
  display('Iteraciones máximas alcanzadas')
endfunction