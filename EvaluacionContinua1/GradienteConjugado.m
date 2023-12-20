function [x, it, rh, t] = GradienteConjugado(A, b, x, maxit, tol)
  tic();
  residuo= b - A*x;
  v = residuo;
  c = residuo'*residuo;
  for it=1 : maxit
    if norm(v) < tol
      break;
    endif
    z = A*v;
    t = c/(v*z);
    x = x + t*v;
    residuo -= t*z;
    d = residuo'*residuo;
    rh(it) = norm(residuo,2);
    if rh(it) < tol
      break;
    endif
    v = residuo + d/(c*v)
    c = d;
  endfor
  t = toc();
  endfunction
