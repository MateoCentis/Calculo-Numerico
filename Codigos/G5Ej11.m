t=[4 8 12 16 20 24]; %se mide en horas despues de la tormenta
c=[1590 1320 1000 900 650 560]; %CFU/100 mL
%El modelo tiene la forma c(t)=be^-kt
%Se usa este modelo ya que sirve para casos futuros, ya que el ajuste comun y lagrange no son buenos a la larga.
%a)
cLog=log(c);
p = polyfit(t,cLog,1);
fp =@(t) polyval(p,t);
%erc = norm(cLog - f(t))^2;%error
b = exp(p(2))
k = p(1)

f = @(t) b*exp(k*t);%Funcion original
figure(1)
hold on
plot(t,c,'r*')
plot(t,cLog, 'k*')
grid on 
grid minor
ezplot(f,[0 24])
hold off
%b)
f(0)
%c)Grafico para estimar valor de 200
figure(2)
ezplot(f,[24 50])
grid on 
grid minor
fb=@(t) b*exp(k*t) - 200;
res = biseccion(fb,40,45,10000,10e-5)
