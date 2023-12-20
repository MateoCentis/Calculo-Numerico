%TOBIAS
f=@(x)log(x.^2+1)+e.^(x./2).*cos(pi.*x);
a=-5;
b=6;
cantPuntos=9;
x=linspace(a,b,cantPuntos);
dx0=derivada3puntos(f,-5,-6,-4);
dxf=derivada3puntos(f,6,-6,-4);
[S dS]=funcion_spline(x,f(x),-0.3436,-9.7184);
f(4.2)-S(4.2)