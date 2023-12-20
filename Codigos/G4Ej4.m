tol = 10e-4;
y=@(x)x.^2;
kmax = 10000;
tol = 10e-4;
%funcion distancia al cuadrado: (x-1)^2+(x-0)^2 
%punto (0,1)
dist =@(x) x^4+x.^2-2*x+1;
%Derivando la funcion para ver 
f =@(x) 4*x.^3+2*x-2;
df =@(x) 12*x.^2+2;
[xNew hNew itNew] = newton(f,df,0,kmax,tol)