a=0.401;
b=42.7e-6;
T=300;
p=3.5e+7;
tol = 1e-12;
k=1.3806503e-23;
N=1000;
%Usar metodo de biseccion y Newton
%Encontrar el volumen 
%f(v)
f=@(v) (p+a*(N/v)^2)*(v-N*b)-k*N*T;
xmin=0.01;
xmax=0.06;
kmax=10000;
df=@(v)(35000000*(v.^3-0.0114571*v+0.00097844))/(v.^3);
[xBis hBis itBis] = biseccion(f,xmin,xmax,kmax,tol)
[xNew hNew itNew] = newton(f,df,xmin,kmax,tol)

