g=@(x)x.^3+4*x.^2-10;
x0=1.5;
tol=1e-3;
kmax=1000;
g2=@(x)(10/(4+x))^(1/2);
g1=@(x)1/2*(10-x.^3)^(1/2);
puntofijo(g1,x0,kmax,tol)
puntofijo(g2,x0,kmax,tol)
%(c) condiciones: g es continua en [a,b], tiene derivada en el (a,b) y 
% existe 0 < k < 1 con |g'(x)| <= k para todo x en (a,b)
%(c) Cotas: |pn-p|<=k^n/(1-k) * |p1-p0|
%Para g1 la derivada en 2 es mayor a 1 por lo que falla. Si se considera
%El intervalo [1,1.5] se cumple el teorema de la convergencia.
%Para g2 la magnitud de la cota es mucho menor que la magnitud de la cota 
%de g1, lo cual explica la convergencia más rapida usando g2.