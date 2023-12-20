# Ej9TP3
clear all; clc; clf
%Nh1=10;
%Nh2=25;
%Nh3=50;
Nh = input('Cantidad de intervalos a dividir el dominio: ')
wsor = input('factor de relajacion SOR: ')
maxit = input('Numero de iteraciones de corte:')
tol = input('Tolerancia de corte:')

%DATOS
L=5; %Longitud de la viga
h=1/Nh;%Nh es cantidad de subintervalos a dividir, h es la longitud de cada uno de ellos
P=1.0326e4 %Presion por cada distribuida por unidad de longitud
w=0.07;s=0.14; %w ancho y s altura.
E=2.1e11;%Modulo de Young del acero
J=(w*s^3)/12;%Momento de inercia
%fj=(3.071295e-3)*5; # sale de calcular: P/EJ [m]
fj = (-P*L)/(E*J)
% divisiones del dominio:
x=linspace(0,L,Nh+1);%Nodos de coordenadas, sirven para graficar

%maxit=20000;
%tol=1e-8;

# armamos la matriz
[~,Afull, b, x0] = MatrizVigaBiEmpotrada(Nh, L, fj);

disp('===================================================')
# DATOS MATRIZ

disp('Numero de condicion de la matriz y radio espectral')
KA = cond(Afull)
rhoA = max(abs(eig(Afull)))

# METODO OCTAVE

u = Afull\b;
u=[0;0;u;0;0];

# METODO DIRECTOS
[Ar,L,U,P] = Doolitle_p(Afull, b);
[p] = sust_adelante_r(L,b);
nuD = sust_atras_r(U,p);
nuD = [0;0;nuD;0;0];


# METODO GAUSS-SEIDEL
tic()
[nuGS,itGS,rGS] = gauss_seidel(Afull, b, x0,tol,maxit);
tGS = toc();
nuGS=[0;0;nuGS;0;0];

disp('Num. Condicion y Radio Espectral Matriz Iteracion Gauss-Seidel')

[rhoAGS] = RadioEspectralGS(Afull)


disp('===================================================')
disp('Tiempo y Cantidad de iteraciones del metodo GAUSS-SEIDEL')
[tGS itGS]

# METODO SOR
tic()
[nusor, rsor, itsor] = sorGerardo(Afull, b, x0, maxit, tol, wsor);
tsor = toc();
nusor=[0;0;nusor;0;0];
disp('===================================================')
disp('Num. Condicion y Radio Espectral Matriz Iteracion SOR')
[rhoAsor] = RadioEspectralsor(Afull,wsor)

disp('===================================================')
disp('Tiempo y Cantidad de iteraciones del metodo SOR con w:')
disp(wsor)
[tsor itsor]

# METODO GRADIENTE CONJUGADO
tic()
[nuGC,itGC, rGC] = GradienteConjugado2(Afull, b, x0, maxit, tol);
tGC = toc();
nuGC=[0;0;nuGC;0;0];

disp('===================================================')
disp('Tiempo y Cantidad de iteraciones del metodo GRADIENTE CONJUGADO')
[tGC itGC]

disp('===================================================')

disp('Resumen')
disp('Tiempo y Cantidad de iteraciones de LOS TRES METODOS:')
disp('Gauss-Seidel - SOR - Gradientes Conjugados')
tiempos = [tGS  tsor tGC]
iteraciones = [itGS itsor itGC]

disp('===================================================')


% Graficamos las soluciones
figure(1)
plot(x,u,'r-*')
grid on
hold on
plot(x,nuD,'b-s')
title('Comparacion Solucion Octave vs Doolittle')
hold off

figure(2)
plot(x,u,'r-*')
grid on
hold on
plot(x,nuGS,'b-s')
plot(x,nusor,'g-o')
plot(x,nuGC,'k-d')
title('Comparacion Solucion Octave vs Met. Iterativos')
hold off

# Convergencia
figure(3)
semilogy(rGS,'-r')
hold on
semilogy(rsor,'-b')
grid on
title('Tasas de convergencia')
xlabel('iteraciones')
ylabel('residuos')
legend('Gauss-Seidel','SOR')


figure(4)
semilogy(rGC,'-g')
grid on
title('Tasas de convergencia')
xlabel('iteraciones')
ylabel('residuos')
legend('Gradiente Conjugado')