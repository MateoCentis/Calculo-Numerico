x=[-1 0 1 2]
y=[-1.1 -0.4 -0.9 -2.7]
%a)Transformacion tabla de dtaos usando log(-y)
yLog=log(-y);
p2 = polyfit(x,yLog,2);
f=@(x)-exp(polyval(p2,x));%tomo el -e al ajuste para recuperar la función 'original'
f2 =@(x) polyval(p2,x);
erc = norm(y - f(x))

%Pregunta 1
%Practica parcial
%Para calcular el error cuadratico se toman los y originales menos la funcion que obtuviste de la linealizacion
%erc=0.312991
%Error relativo para x=1
errRel = abs((-0.9-f(1))/-0.9)

%b)Grafico sobre el intervalo
%figure(1)
%grid on
%grid minor
%hold on
%ezplot(f,[-1.5 2.5])
%plot(x,y,'*g')
%hold off

%ezplot(f2,[-1.5 2.5]) ----
%plot(x,yLog,'*r') Los ylog no nos importan ya que son parte del la linealización

%Pregunta 2
F=@(x)5./x;
x=[1 2 3];
%Fijarse que cada coeficiente tiene dos valores ya que devuelve las spline para dos puntos diferentes
%Los coeficientes de la columna 1 son para el primer punto y los de la otra columna para el segundo
[a b c d] = cubic_spline_natural(x,F(x));

%Pregunta 3
a=0;
b=2;
L=40;
L2=80;
n=3;
f=@(x)2+cos(pi.*x);
df=@(x)-pi.*sin(pi.*x);
rev=@(x) ((2.*pi).*f(x).*sqrt(1+df(x).^2));
r1=cuad_gauss_c(rev,a,b,L,n);
r2=cuad_gauss_c(rev,a,b,L2,n);
format long g
cifras=abs(r1-r2)%Es el numero de la exp + 1
r1;
r2;
%Para ver cifras exactas

%Pregunta 4
f=@(t,w)[w(2);
         -7*w(1)+4*w(3);
         w(4);
         (4/3)*w(1)-(4/3)*w(3)];
y0=[0,1,0,1]';%posicion inical x1=0,x2=0 y derivadas x'_1=x'_2=1
a=0;%0 a 20 segundos
b=20;
n=2000;%No da n por eso necesitamos uno suficientemente grande
[t xRes]=rungeKutta4(f,a,b,y0,n);
w1=xRes(:,1);
w2=xRes(:,2);
w3=xRes(:,3);
w4=xRes(:,4);
%Posicion a los 20 segundos
pos1=w1(length(w1));
vel1=w2(length(w2));
pos2=w3(length(w3));
vel2=w4(length(w4));

%Pregunta 5
%f=@(t)20.*sin(5.*(t-1));
%L=3;
%n=1000;
%y0=[21 0]';
%Ejercicio 5 guia 8
%F=@(t,x)[x(2);
%         f(x)];
%F=@(t,w)[w(2);
%         20*sin(5*(t-1))-2*w(1)];
%[tRes wRes] = dif_fin_dir(F,[0 L],y0,n);
%Practica segundos parciales 2

#Pregunta 3
#a)
%Planteo con dimensiones separadas
#Datos
m=10;
c=0.2;
g=[0 -9.81]';
a=0;
b=5;
n=5000;
x0=[0,40];
y0=[30,0];
%Resolucion
fx=@(t,z)[z(2);g(1)-(c/m)*z(2)];
fy=@(t,z)[z(2);g(2)-(c/m)*z(2)];
[tSol1 xSol]=rungeKutta4(fx,a,b,x0,n);
x=xSol(:,1);
dx=xSol(:,2);
[tSol2 ySol]=rungeKutta4(fy,a,b,y0,n);
y=ySol(:,1);
dy=ySol(:,2);

%A find se le manda un vector y la condicion, retorna todos los indices que cumplen la condicion
tocaPisoIndice=find(y<0);
%Le pasamos a x como indice el primer indice del vector de indices que cumplen la condicion del find
distX=x(tocaPisoIndice(1)-1);%Es -1 porque es el anterior a pasar al piso
%Similar a la anterior solo que con los tiempos
tocaPiso=tSol1(tocaPisoIndice(1)-1);
%b)Vuelvo a calcular con un n mas chico porque la funcion spline no soporta mucho tamaño por su alto costo
%computacional, 
n=100;
[tSol1 xSol]=rungeKutta4(fx,a,b,x0,n);
x=xSol(:,1);
dx=xSol(:,2);
[tSol2 ySol]=rungeKutta4(fy,a,b,y0,n);
y=ySol(:,1);
dy=ySol(:,2);
%Se hace la spline de derivada, podria usarse la de la posicion y pasarle dS en vez de S
[S1 dS1] = funcion_spline(tSol1',dx',0,0);
[S2 dS2] = funcion_spline(tSol2',dy',0,0);
fTrayectoria=@(t)sqrt(S1(t).^2+S2(t).^2);
a=0;
b=2;
%Lo comento porque tiene mucho coste computacional
%longitud=quad(fTrayectoria,a,b);

%Pregunta 4
%a)Calculo del erro
a = -5;
b = 6;
cantPuntos = 9;
x = linspace(a, b, cantPuntos);
f = @(x) log(x.^2+1)-exp(x./2).*cos(pi.*x);
dx0 = derivada3puntos(f,-5,-6,-4)
dxf = derivada3puntos(f,6,-6,-4)
[S,dS]=funcion_spline(x,f(x),dx0(2),dxf(2));%Se hace el spline
error=f(4.2)-S(4.2);%error 
%b)Primero se mira la grafica del spline
%figure(1)
%ezplot(S);
%figure(2)
%ezplot(dS);
%ezplot(S)
%grid on;
%grid minor;
errAbs=10^-9;
[xMaxInd h it]= biseccion(dS,3.5,4.5,10000,errAbs);
%Encontramos el 0 de la derivada por biseccion
xMax = S(xMaxInd);

%Pregunta 5

%Pregunta 9 pendulo con agua 
tita = acos(h);%tita0 despejando tita de la ecuacion
%se cumple solo si tita < tita_0
%f=@(t,z)[z(2);(-0.8*z(2)-sin(z(1))).*(z(1)<tita) +...
%         (0*z(2)-sin(z(1))).*(z(1)>=tita)];
%si es mayor o igual a tita0 vale 0 
z0=[0;pi/2];  
%Pendulos acoplados lucas
l=15;
m1=1;
m2=3;
k=3;
z0=[0,-1,0,1];
g=9.81;
%f=@(t,z)=[z(2);
%        (-g/l)*z(1)-(k/m1)*z(1)-z(3);
  %       z(4);
  %        -(g/l)*z(3)+(k/m2)*(z(1)-z(3))];
%[t s] = rungeKutta4(f,0,10,z0,50);
%Metodo implicito cuando para calcular la iteracion siguiente 
%se usa la iteracoin siguiente
%Pregunta 12
%Codigo multipaso
%ver pvi2steps_rk_nr
%Pregunta 14
%Corregir ejercicio G5Ej8
%Pregunta 16 pendulos
%Ver G7Ej10 o penduloAmortiguado
%Pregunta 17 codigo cranck nicholson
%ver CN_new


