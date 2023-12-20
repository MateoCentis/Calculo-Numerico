function [x y] = rungeKutta(f,a,b,y0,n) %RungeKutta de cuarto orden
  h=(b-a)/n;
  x=linspace(a,b,n+1)';
  %y=0*x;
  y(:,1)=y0;
  for i=1:n
    f1=h.*f(x(i),y(:,i));
    f2=h.*f(x(i)+(1/2).*h,y(:,i)+(1/2).*f1);
    f3=h.*f(x(i)+(1/2).*h,y(:,i)+(1/2).*f2);
    f4=h.*f(x(i)+h,y(:,i)+f3);
    y(:,i+1)=y(:,i)+(1/6).*(f1+f2+f3+f4);
  endfor
endfunction

%euler hacia adelante y atras (usando newton-raphson)
%Método de rungeKutta orden 4
%para el h de euler el de rungeKutta es 4*h veces.