function [x y] = rungeKutta4(f,a,b,y0,n) 
  h=(b-a)/n;
  x=linspace(a,b,n+1)';
  y(:,1)=y0;
  for i=1:n
    f1=h.*f(x(i),y(:,i));
    f2=h.*f(x(i)+(h/2),y(:,i)+(f1/2));
    f3=h.*f(x(i)+(h/2),y(:,i)+(f2/2));
    f4=h.*f(x(i)+h,y(:,i)+f3);
    y(:,i+1)=y(:,i)+(f1+2*f2+2*f3+f4)/6;
  endfor
  y=y';
endfunction