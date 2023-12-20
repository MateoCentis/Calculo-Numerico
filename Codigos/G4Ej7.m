E=@(t)((t+1/3).^(3)+1/3).*e.^(-t);%Ecuacion de energia
tol=1e-5;
kmax=1000;
%funciones y sus derivadas
f=@(t)((t+1/3).^(3)+1/3).*e.^(-t)-1.5;%funcion de (a)
df=@(t) -e.^(-t).*((t+1/3).^(3)+1/3)+3*e.^(-t).*(t+1/3).^(2);
ddf=@(t)(e.^(-t).*(27*t.^3-135.*t.^2+63.*t+46))/27;
dddf=@(t)(1/27).*(-333.*t.*e.^(-t)+
216.*t.^2.*e.^(-t)-27.*t.^3.*e.^(-t)+17.*e.^(-t));
t=[0:0.1:8];
Et = E(t);
dft = df(t);
ddft=ddf(t);
dddft = dddf(t);
%----------------------------------------------------------------------
%(a) Determinar instantes de tiempo en los que la energia es 
%igual a 1.5, con 5 digitos de precision
%Grafica de f(t)
ft=f(t);
figure(1)
plot(t,ft,'b');
hold on
plot(t,dft,'r');
hold on
plot(t,0,'k')
set(gca,'XTick',0:1:100)
grid on
grid minor
xlabel('t')
ylabel('funciones(t)')
legend('f(t)','primera derivada')
hold off
%solucion por Newton-Raphson
%intervalo 1
x011=1;
[xNew11 hNew11 itNew11] = newton(f,df,x011,kmax,tol)
%intervalo 2
x012=3.5;
[xNew12 hNew12 itNew12] = newton(f,df,x012,kmax,tol)
%----------------------------------------------------------------------
%(b)Determinar max energia del sistema y en que t ocurre, utilizando
%misma tol

%Grafica de df(t)
figure(2)
plot(t,dft,'b');
hold on
plot(t,ddft,'r');
hold on
plot(t,0,'k');
set(gca,'XTick',0:1:100)
grid on
grid minor
xlabel('t')
ylabel('funciones(t)')
legend('primera derivada','segunda derivada')
hold off
%solucion por Newton-Raphson
x02=2.5;
[xNew2 hNew2 itNew2] = newton(df,ddf,x02,kmax,tol)
%----------------------------------------------------------------------
%(c) Determinar t en donde se da la max tasa de 
%crecimiento instantanea de la energia con misma tol
%Grafica de ddf(t)
figure(3)
plot(t,ddft,'b');
hold on
plot(t,dddft,'r');
hold on
plot(t,0,'k');
set(gca,'XTick',0:1:100)
grid on
grid minor
xlabel('t')
ylabel("funciones(t)")
legend('segunda derivada','tercera derivada')
hold off
%busqueda por biseccion
tolBis = 1e-3;
[xBis hBis itBis] = biseccion(ddf,1,2,kmax,tolBis)
%solucion por newton-raphson
[xNew3 hNew3 itNew3] = newton(ddf,dddf,xBis,kmax,tol)

