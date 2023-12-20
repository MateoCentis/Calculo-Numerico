function [x,it,r_h,t] = GradienteConjugado2 (A, b, x0, maxit, tol)
  tic();
  r=b-A*x0;
  p=r;
  Ro=r'*p;
  x=x0;
  it=1;
  while(it<maxit)
    a=A*p;
    m=p'*a;
    alfa=Ro/m;
    x0=x;
    x=x+alfa*p;
    err = norm(x-x0,'inf')/norm(x,'inf');
    r_h(it)=norm(r,'inf');
    if(err<tol)
      break;
    endif
    r=r-alfa*a;
    Ro_old=Ro;
    Ro=r'*r;
    gama=Ro/Ro_old;
    p=r+gama*p;
    it=it+1;
  endwhile
  t=toc();
endfunction