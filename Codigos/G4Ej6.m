f=@(x)x*(log(x+3)-17)-1;
a=0;
b=2;
%error absoluto menor a 1e+2
tol=1e+2;
while sign(f(a))*sign(f(b)) > 0
  b = 2*b;
endwhile
%Buscar por error absoluto (chequear en biseccion)
[xBis hBis itBis] = biseccion(f,a,b,kmax,tol)
tol2=1e-12;
df=@(x) x/(x+3)+log(x+3)-17;
%Buscar por error relativo (chequear en Newton)
[xNew hNew itNew] = newton(f,df,xBis,kmax,tol2)

