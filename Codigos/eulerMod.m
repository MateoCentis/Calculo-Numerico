function [x y] = eulerMod(f,a,b,y0,n)
  h=(b-a)/n;
  x=linspace(a,b,n+1)';
  %y=0*x;
  y(:,1)=y0;
  for i=1:n
    y(:,i+1)=y(:,i)+h.*f(x(i),y(:,i));
  endfor
  y=y';
endfunction
