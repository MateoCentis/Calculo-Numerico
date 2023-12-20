%Para el vector solución x0,xN=0
N=100;
[A,b,x0]=crearMatriz(N);
tol=10^-6;
maxit=15000;
w = 1.5;

%PRUEBA EJ9
%DATOS
L=5; %Longitud de la viga
h=1/Nh;%Nh es cantidad de subintervalos a dividir, h es la longitud de cada uno de ellos
P=1.0326e4 %Presion por cada distribuida por unidad de longitud
w=0.07;s=0.14; %w ancho y s altura.
E=2.1e11;%Modulo de Young del acero
J=(w*s^3)/12;%Momento de inercia
%fj=(3.071295e-3)*5; # sale de calcular: P/EJ [m]
fj = (-P*L)/(E*J)
[~, A, b, x0] = MatrizVigaBiEmpotrada(Nh,L,fj)
%%

% a) y b)

%Jacobi
[xJacobi,itJacobi,r_hJacobi] = jacobi(A,b,x0,tol,maxit);
[TJacobi, cJacobi, tJacobi]=Tc_Jacobi(A,b,x0);
%Gauss-Seidel
[xGS,itGS,r_hGS] = gauss_seidel(A,b,x0,tol,maxit);
[TGS, cGS, tGS]=Tc_GaussSeidel(A,b);
%SOR
%Determinacion de parametro de relajacion para SOR
wsor = linspace(1.4,2,10);
vit=[];%Vector de iteraciones
for j=1:length(wsor)
  [xSor,itSor,r_hSor,tSor] = SOR(A,b,x0,tol,maxit,wsor(j));
  vit(j)=itSor;
 endfor
 dato = [wsor;vit]';
 [val pos] = min(dato(:,2));
 display("El parámetro de relajación optimo para SOR es ");
 w = wsor(pos)
 [TSor, cSor, tSor] = Tc_SOR(A, b, w);
 [xSorMin,itSorMin,r_hSorMin,tSorMin] = SOR(A,b,x0,tol,maxit,w);
%GradienteConjugado
[xGC, itGC, rhGC, tGC] = GradienteConjugado2(A, b, x0, maxit, tol);
%EliminaciónGauss
[xGauss,itGauss] = gauss(A,b);

%Calculo de radios espectrales de las matrices de iteracion
display("Radio espectral matriz iteracion Jacobi");
radioJacobi = max(abs(eig(TJacobi)))
display("Radio espectral matriz iteracion Gauss-Seidel");
radioGS = max(abs(eig(TGS)))
display("Radio espectral matriz iteracion SOR");
radioSor = max(abs(eig(TSor)))  

%Muestra iteraciones
display("Iteraciones Jacobi");
itJacobi
display("Gauss-Seidel");
itGS
display("SOR");
itSorMin
display("Gradientes Conjugados");
itGC
display("Eliminación Gauss");
itGauss

%Grafico de cada residuo
figure(1)
semilogy(r_hJacobi,'-b;Jacobi;')
ylim([10^(-7) 10^(-2)])
grid on 
grid minor
hold on
semilogy(r_hGS,'-r;Gauss-Seidel;')
semilogy(r_hSorMin,'-g;SOR;')
semilogy(rhGC,'-c;Gradientes Conjugados;')
title('Convergencia de los métodos')
xlabel('iteraciones')
ylabel('residuo')
hold off

%c)
%Gráfico de las soluciones
d = linspace(0,1,100);

figure(2)
plot(d,xJacobi,'-b;Jacobi;')
grid on
grid minor
title('Solucion del sistema')
xlabel('t')
ylabel('x(t)')
hold on
plot(d,xGS,'-r;Gauss-Seidel;')
plot(d,xSorMin,'-g;SOR;')
plot(d,xGC,'-c;Gradientes Conjugados;')
plot(d,xGauss,'-k;Eliminacion Gaussiana;')
hold off




