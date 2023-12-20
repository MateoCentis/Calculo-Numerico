function s=traprl(f,a,b,M)
%Ingreso
%- f es el integrando ingresado como string 'f'
%
%- a y b son los límites de integración
%
%- M es el número de subintervalos
%Salida
%- s es la suma de la regla trapezoidal
%f=input('ingrese f(x) entre comillas en términos de x');
%f=inline(f,'x');
h=(b-a)/M;
s=0;
for k=1:(M-1)
  x=a+h*k;
  s=s+feval(f,x);
endfor
s=h*(feval(f,a)+feval(f,b))/2+h*s;
endfunction
