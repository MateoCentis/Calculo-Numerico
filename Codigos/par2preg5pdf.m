a = -5;
b = 6;
cantPuntos = 9;
x = linspace(a, b, cantPuntos);

f = @(x) log(x.^2+1)-exp(x./2).*cos(pi.*x);

dx0 = derivada3puntos(f,-5,-6,-4)
dxf = derivada3puntos(f,6,-6,-4)


[S,dS]=funcion_spline(x,f(x),dx0(2),dxf(2));

f(4.2)-S(4.2)

 ## Punto b


