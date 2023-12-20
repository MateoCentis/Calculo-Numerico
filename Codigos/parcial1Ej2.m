f=@(x)x+e.^(-5.*x.^2).*cos(x);
df=@(x)-e.^(-5.*x.^2).*sin(x)-10.*x.*e.^(-5.*x.^2).*cos(x)+1;
tol = 10e-16;
x0=0.5;
kmax=1000;
[xNew itNew rhNew] = NewtonRaphsonL(f,df,x0,tol,kmax,1)
[xNew2, rhNew2 itNew2] = newton(f,df,x0,kmax,tol)