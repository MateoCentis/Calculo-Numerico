%Ejercicio Entregable N°3
f=@(t,x)[-t*x(2);%x(1) y x(2) son las "incognitas" del sistema.
         t*x(1)-t*x(2)];
%----------------------------------------------------------------------------------------------
%a)Grafico de la trayectoria de la particula durante los primeros 20 segundos
%grafico x1 vs x2
y0=[-1;1];
a=0;
b=20;
h=0.05;
n=(b-a)/h;
[t,xRes]=rungeKutta4(f,a,b,y0,n);
fig1= figure(1);
plot(xRes(:,1),xRes(:,2),'r-','linewidth',4);
FN = findall(fig1,'-property','FontName');
title('Trayectoria de la partícula durante los primeros 20 segundos')
xlabel('x1');
ylabel('x2');
grid on 
grid minor on
set(FN,'FontName','C:\Users\Mateo\AppData\Local\Microsoft\Windows\Fonts\DankMono-Regular.ttf');
FS = findall(fig1,'-property','FontSize');
set(FS,'FontSize',18);
hold on

%---------------------------------------------------------------------------------------------
%b)Utilizar metodo de RungeKutta4 con paso h=0.1 para determinar 
%su posicion y velocidad a los 3 segundos.
hRK=0.1;
aRK=0;
bRK=3;
nRK=(bRK-aRK)/hRK+1;
[tRK xRK]=rungeKutta4(f,aRK,bRK,y0,nRK);
x1RK=xRK(:,1);%x1(t) Posicion en X en el tiempo (t)
x2RK=xRK(:,2);%x2(t) Posicion en Y en el tiempo (t)
%posicion en tiempo t=3s
posX=x1RK(length(x1RK));
posY=x2RK(length(x2RK));
%rapidez en tiempo t=3s
dx1RK=-3*posY;
dx2RK=3*posX-3*posY;
modRap=norm([dx1RK,dx2RK]);
plot(posX,posY,'o','MarkerEdgeColor','k','MarkerFaceColor',[0.49 1 0.63],'MarkerSize',10);
legend('Particula','t=3s')
hold off;
%------------------------------------------------------------------------------------------------
%c)Cuantos digitos correctos tienen los resultados del item anterior
format long g
hAux=1.6;
for i=1:6
    hAux /= 2
    nAux=(bRK-aRK)/hAux
    [tAux xAux]=rungeKutta4(f,aRK,bRK,y0,nAux);
    x1Aux=xAux(:,1);
    x2Aux=xAux(:,2);
    posX=x1Aux(length(x1Aux))
    posY=x2Aux(length(x2Aux))
    dx1Aux=-3*posY;
    dx2Aux=3*posX-3*posY;
    modRap=norm([dx1Aux,dx2Aux])
    disp("---------------------------------")
  endfor
  [t30 x30] = rungeKutta4(f,aRK,bRK,y0,30);
  [t60 x60] = rungeKutta4(f,aRK,bRK,y0,60);
  x30Aux1 = x30(:,1);
  x30Aux2 = x30(:,2);
  x60Aux1 = x60(:,1);
  x60Aux2 = x60(:,2);
  sol30 = norm([-3*x30Aux2(length(x30Aux2)) 3*(x30Aux1(length(x30Aux1))-x30Aux2(length(x30Aux2)))]);
  sol60 = norm([-3*x60Aux2(length(x60Aux2)) 3*(x60Aux1(length(x60Aux1))-x60Aux2(length(x60Aux2)))]);
  error = abs(sol30-sol60)
%----------------------------------------------------------------------------------------------
%d)
%Se ponen las derivadas obtenidas en el inciso (b)
%(i)
[S1 dSx1] = funcion_spline(tRK',x1RK',0,dx1RK);%Los paso como columna
[S2 dSx2] = funcion_spline(tRK',x2RK',0,dx2RK);
fig2 = figure(2);
ts1=S1(tRK);
ts2=S2(tRK);
plot(ts1,ts2,'r-','linewidth',4);
FN = findall(fig2,'-property','FontName');
title('Interpolacion de la trayectoria de la particula para los primeros 3 segundos')
xlabel('S1');
ylabel('S2');
grid on 
grid minor on
set(FN,'FontName','C:\Users\Mateo\AppData\Local\Microsoft\Windows\Fonts\DankMono-Regular.ttf');
FS = findall(fig2,'-property','FontSize');
set(FS,'FontSize',18);
legend('Interpolacion');
hold off
%(ii)
g=@(x)sqrt(dSx1(x).^2+dSx2(x).^2);
%integracion por metodo de cuadratura gaussiana
aInt=0;
bInt=3;
L=50;
nInt=2;
resCuad= cuad_gauss_c(g,0,3,L,nInt);
%---------------------------------------------------------------------
%(e)Tiempo a partir del cual la particula está siempre a menos 
%de 0.01 del origen de coordenadas
A=0;
B=20;
H=0.1;
N=(B-A)/H+1;
[tSol xSol]=rungeKutta4(f,A,B,y0,N);
x1Sol=xSol(:,1);%x1(t) 
x2Sol=xSol(:,2);%x2(t)
dx1Sol=-3*x1Sol(length(x1Sol));
dx2Sol=3*x2Sol(length(x2Sol))-3*x1Sol(length(x1Sol));
[S1sol dS1sol]=funcion_spline(tSol',x1Sol',0,dx1Sol);
[S2sol dS2sol]=funcion_spline(tSol',x2Sol',0,dx2Sol);
d=@(x)sqrt(S1sol(x).^2+S2sol(x).^2);
menor=0.01;
for i=2:length(tSol)
    if d(tSol(i)) <= menor
      tiempoMenor = tSol(i);
      disMin = d(tSol(i));
      break;
    endif
endfor

figure(3)
px1=S1sol(tSol);
px2=S2sol(tSol);
plot(px1,px2,'linewidth',4);
hold on
plot(S1sol(tiempoMenor),S2sol(tiempoMenor),'o','MarkerEdgeColor','k','MarkerFaceColor',[0.49 1 0.63],'MarkerSize',10);
