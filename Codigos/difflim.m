function [L,n]=difflim(f,x,toler)
  %Ingreso - x punto de diferenciación
  %- toler tolerancia deseada
  %Salida - L=[H' D' E']: H vector de tamaños de etapas
  %-D vector de derivadas aproximadas
  %-E vector de cotas de error
  %-n coordenda de la mejor aproximación
  %f=input('ingrese f(x) entre comillas en términos de x');
  %f=inline(f,'x');
  max1=15;
  h=1;
  H(1)=h;
  D(1)=(f(x+h)-f(x-h))/(2*h);
  E(1)=0;
  R(1)=0;
  for n=1:2
    h=h/10;
    H(n+1)=h;
    D(n+1)=(f(x+h)-f(x-h))/(2*h);
    E(n+1)=abs(D(n+1)-D(n));
    R(n+1)=2*E(n+1)*(abs(D(n+1))+abs(D(n))+eps);
  endfor
  n=2;
  while((E(n)>E(n+1))&(R(n)>toler))&n<max1
    h=h/10;
    H(n+2)=h;
    D(n+2)=(f(x+h)-f(x-h))/(2*h);
    E(n+2)=abs(D(n+2)-D(n+1));
    R(n+2)=2*E(n+2)*(abs(D(n+2))+abs(D(n+1))+eps);
    n=n+1;
  endwhile
  n=length(D)-1;
  L=[H' D' E'];
endfunction

