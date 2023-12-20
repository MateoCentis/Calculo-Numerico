x=[-1 0 1 2]
y=[-1.1 -0.4 -0.9 -2.7]
%a)Transformacion tabla de dtaos usando log(-y)
yLog=log(-y);
p2 = polyfit(x,yLog,2);
f=@(x)-exp(polyval(p2,x));%tomo el -e al ajuste para recuperar la función 'original'
f2 =@(x) polyval(p2,x);
erc = norm(y - f(x))
%Practica parcial
%Para calcular el error cuadratico se toman los y originales menos la funcion que obtuviste de la linealizacion
%erc=0.312991
%Error relativo para x=1
errRel = abs((-0.9-f(1))/-0.9)

%b)Grafico sobre el intervalo
figure(1)
grid on
grid minor
hold on
ezplot(f,[-1.5 2.5])
plot(x,y,'*g')
hold off

%ezplot(f2,[-1.5 2.5]) ----
%plot(x,yLog,'*r') Los ylog no nos importan ya que son parte del la linealización