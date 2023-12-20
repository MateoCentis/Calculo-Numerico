%Para el vector solución x0,xN=0
%N=100;
%[A,b,x0]=crearMatriz(N);
%Pone la matriz que quieras y los parametros que quieras
A=[5 -1 0;-1 1e-14 -1;0 -1 2];
b=[7 4 5]';
x0=[1e15 1e25 1e-15]';
%Error relativo menor a 10^-8
tol=10^-8;
maxit = 1000;
% a) y b)
%Jacobi
%[xJacobi,itJacobi,r_hJacobi] = jacobi(A,b,x0,tol,maxit);
%[TJacobi, cJacobi, tJacobi]=Tc_Jacobi(A,b,x0);
%Gauss-Seidel
[xGS,itGS,r_hGS] = gauss_seidel(A,b,x0,tol,maxit);
[TGS, cGS, tGS]=Tc_GaussSeidel(A,b);
%SOR
%Determinacion de parametro de relajacion para SOR
%wsor = linspace(9,1.1,1);
%vit=[];%Vector de iteraciones
%for j=1:length(wsor)
 % [xSor,itSor,r_hSor,tSor] = SOR(A,b,x0,tol,maxit,wsor(j));
 % vit(j)=itSor;
 %endfor
% dato = [wsor;vit]';
 %[val pos] = min(dato(:,2));
% display("El parámetro de relajación optimo para SOR es ");
 %w = wsor(pos)
% w = 0.9;
 %[TSor, cSor, tSor] = Tc_SOR(A, b, w);
 %[xSorMin,itSorMin,r_hSorMin,tSorMin] = SOR(A,b,x0,tol,maxit,w);
%GradienteConjugado
[xGC, itGC, rhGC, tGC] = GradienteConjugado2(A, b, x0, maxit, tol);
%EliminaciónGauss
%[xGauss,itGauss] = gauss(A,b);

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

%c no es
%e no es

%a
%b
%d
%f

%f contradice a d 
%b contradice a e y f 
%a es libre


