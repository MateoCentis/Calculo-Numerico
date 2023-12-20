function s=simprl(f,a,b,M)
# Ejemplo carga s=simprl(0,pi/3,6)
# funcion 'sin(x)'
# - a Limite inferior de integración
# - b Limite superior de integración
# - M Numero de subintervalos
#f=input('ingrese f(x) entre comillas en términos de x');
#f=inline(f,'x');
h=(b-a)/(2*M);
s1=0;
s2=0;
for k=1:M
x=a+h*(2*k-1);
s1=s1+feval(f,x);
endfor
for k=1:(M-1)
x=a+h*2*k;
s2=s2+feval(f,x);
endfor
s=h*(feval(f,a)+feval(f,b)+4*s1+2*s2)/3;
endfunction