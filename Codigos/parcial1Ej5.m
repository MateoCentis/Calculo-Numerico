f=@(x)sin(x)+cos(1+x.^2)-1;
df =@(x)-2*x*sin(x.^2+1)+cos(x);
ddf=@(x)-4.*x.^(2).*cos(x.^2+1)-sin(x)-2.*sin(x.^(2)+1);
kmax=10000;
xmin=7.6;
x0=7.85;
xmax=7.9;
tol=1e-9;
%PARCIAL
%10 digitos correctos - error relativo
%El valor de x mas cercano a 8 para el cual f(x) alcanza un 
%maximo, decir cual es ese valor maximo con cifras decimales
[xBis hBis itBis] = biseccion(df,xmin,xmax,kmax,tol)
[xNew itNew hNew] = NewtonRaphsonL(df,ddf,x0,tol,kmax,1);





%Para el método de la bisección converge a una de las raíces en 34 it
%Para el método de newton no converge y alcanza máximas iteraciones

%Si se cambia el intervalo [-1,5] entonces 
%El método de Newton ahora converge para 8 interaciones y nos da la primera
%raíz 1.94

%El método de secante no funciona 