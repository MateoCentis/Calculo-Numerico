%Pregunta 1 PVC
%CONSEJO DAVID
%Para obtener valores intermedios de una función, no conviene usar splines 
%porque solo Dios sabe cuál es el eror de aproximación de una spline. Más vale 
%usar interpolación polinómica con puntos cercanos al de interés o recalcular la 
%función con una malla que incluya al punto. En estos casos, en los que se 
%quiere estimar el valor en el punto del medio del intervalo, cualquier malla 
%regular con L=par tiene el valor aproximado en y((end+1)/2).
%Para resolver PVC enunciado
%1)Discretizar intervalo y acomodar la ecuacion en la forma y''=p(x)y'+q(x)y+r(x)
%2)Hacer las aproximaciones de la derivada
%3)Reemplazar con aproximaciones en ecuacion diferencial
%4)Despejar y plantear sistema Ay=f con las condiciones iniciales puestas
f=@(x)[0.*x 0.*x -20.*exp(-10.*(x-0.7).^2)];
yc=[5 6];
inter=[0 1];
L=40;
[x y]=dif_fin_dir(f,inter,yc,L);
figure(1)
plot(x,y)
grid on 
grid minor
[S dS] = funcion_spline(x',y',0,0);
S(0.5);%Funciona utilizando una spline y luego evaluando. También sería posible ver para que valor 
%del vector solución es el punto 0.5

%Pregunta 5
f=@(x)[0.*x 5+0.*x -100.*x.*(1-x)];
yc=[0 0];
[x y] = dif_fin_dir(f,inter,yc,L);
[S dS] = funcion_spline(x',y',0,0);
S(0.5);%Igual al ejercicio anterior

%Pregunta 5 del Word
%k0=1 por ende queda implicito
yc=21;
inter=[0 3];
fuente=@(x) 20.*sin(5.*(x-1));
%-k0*u''+cr*u=f=> u''=cr/k0 - f/k0
f=@(x)[0.*x 2+0.*x -fuente(x)];
L=300;%redondeando a 4 cs nos queda 2.376
%Condicion Robin: k0*u'H*u=H*uE (A+B=C)
rob=[1 0 0];
[x y] = dif_fin_rob(f,inter,yc,rob,L);
figure(2)
plot(x,y,'b-*');
title('Temperatura a la largo de la barra calculada por DFinitas')
xlabel('posicion: X')
ylabel('Temperatura')
grid on; grid minor
%Temperatura en extremo derecho
y(length(y))
%Estimación del flujo en el extremo izquierdo de la barra
%flujo(x)=-k0*u'(x) => flujo(0)=-k0*u'(0)
%Hacer derivada 
%Usar formula de derivada numerica 
%[A df] = diffnew(x,y);
%res = -A(1)
%pol = diff_div_vec(x,y);
p = polyfit(x,y,30);
z =@(x) polyval(p,x);
hold on 
plot(x,z(x),'r') 
legend('y','z')
%figure(3)
%plot(x,p)
h = 10.^[-20:-1];
dif = y(1) - z(0)
res =- (z(0+h) - z(0-h))./(2.*h)%no da la derivada tendría que dar 27.488

%EJERCICIO PVI RESORTE-MASA
m=20;
k=20;
c=10;
F=@(t,w)[w(2);
         -(c/m).*w(2)-(k/m).*w(1)];
a=0;
b=10;
y0=[1 0];
n=400;
[xSol ySol] = rungeKutta4(F,a,b,y0,n);
pos = ySol(:,1);
vel = ySol(:,2);
figure(3)
plot(xSol,pos,'r-')
grid on;
grid minor;
hold on
plot(xSol,vel,'b-')
legend('posicion','velocidad')
%Solucion (a)
resA = pos(end);
%Velocidad maxima y en que tiempo ocurre
velMayor= -10;
for i=1:length(vel)
    if vel(i) > velMayor
      tiempoMayor = xSol(i);
      velMayor = vel(i);
    endif
endfor
%tiempoMayor
%velMayor

