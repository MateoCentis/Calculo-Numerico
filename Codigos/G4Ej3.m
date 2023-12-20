f=@(x)sin(x)+cos(1+x.^2)-1;
df =@(x)-2*x*sin(x.^2+1)+cos(x);
ddf=@(x)-4.*x.^(2).*cos(x.^2+1)-sin(x)-2.*sin(x.^(2)+1);
kmax=10000;
xmin=-1;
x0=1;
xmax=5;
tol=1e-10;
%PARCIAL
%10 digitos correctos - error relativo
%El valor de x mas cercano a 8 para el cual f(x) alcanza un 
%maximo, decir cual es ese valor maximo con cifras decimales
[xBis hBis itBis] = biseccion(f,xmin,xmax,kmax,tol)
[xNew hNew itNew] = newton(f,df,x0,kmax,tol)
[xSec hSec itSec] = secante(f,xmin,xmax,kmax,tol)




%Para el m�todo de la bisecci�n converge a una de las ra�ces en 34 it
%Para el m�todo de newton no converge y alcanza m�ximas iteraciones

%Si se cambia el intervalo [-1,5] entonces 
%El m�todo de Newton ahora converge para 8 interaciones y nos da la primera
%ra�z 1.94

%El m�todo de secante no funciona 