function [x, it, rh, t] = GradienteConjugado(A, b, x, maxit, tol)
  tic();
  r= b - A*x;
  p = r;
  c = r'*r;
  for it=1 : maxit
    %Test de conpergencia
    if norm(p) < tol
      break;
    endif
    z = A * p;
    m = p'*z;
    t = c/m;
    x += t*p;
    r -= t*z;
    d = r'*r;
    rh(it) = norm(r,2);
    if rh(it) < tol
      break;
    endif
    p = r + d/(c*p);
    c = d;
    ++it;
  endfor
  t = toc();
 endfunction
