# Ej8TP3
clear all; clc; clf

maxit=20000;
tol=1e-8;
N=1000;
# armamos la matriz
[Afull,b,x0] = crearMatrizEj8(N);

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
wsor=1.25;
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
[nuGC,itGC, rGC] = GradienteConjugado2(Afull, b, x0,maxit,tol);
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