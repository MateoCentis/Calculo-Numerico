function [p,r,it] = biseccionErrorRelativo(f,a,b,tol,itMax)

  for it = 1:itMax
    p = a + (b-a)/2;
    r(it) = abs((b-a)/2);
    if  r(it) <= tol
      disp("Se llego a la toleracia esperada")
      return
    endif
    if (f(a)*f(p)>0)
      a = p;
    else
      b = p;
    endif
  endfor
  disp("Se llego al maximo de iteraciones")

endfunction
