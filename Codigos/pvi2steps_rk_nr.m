function[t,w]=pvi2steps_rk_nr(f,df,a,b,y0,N,maxit,tol)
  h=(b-a)/N;
  t=[a:h:b];
  w=zeros(1,N+1);
  w(1)=y0;
  p=2; %Orden del metodo (esto cambie)
  for i=1:p-1
    k1 = h*f( t(i), w(i));
    k2 = h*f( t(i) + h/2, w(i) + k1/2);
    k3 = h*f( t(i) + h/2, w(i) + k2/2);
    k4 = h*f( t(i) + h,w(i) + k2/2);
    w(i+1) = w(i) + 1/6*(k1 + 2*k2 + 2*k3 + k4);
  endfor
  for i = p:N
    w0 = w(i);%esto cambie
    fi = f(t(i),w(i));
    fim1 = f(t(i-1),w(i-1));%esto cambie
    for it=1:maxit
      fip1 = f(t(i+1),w0);%esto cambie
      g = w0 - w(i) - h/12*(5*fip1 + 8*fi - fim1);%esto cambie 
      dfip1 = df(t(i+1),w0);%esto cambie
      dg = 1 - h*5/12*dfip1;%esto cambie
      w(i+1) = w0 - g/dg;
      if (abs(w(i+1)-w0) < tol && abs(g) < tol)
        break
      endif
      w0=w(i+1);
    endfor
  endfor
%metodo multipaso adams-moulton de 2 pasos utilizando new-raph
%los primeros pasos se obtienen con rungeKutta4