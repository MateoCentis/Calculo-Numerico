%Para el vector solución x0,N=0
tol=10^-6;
maxit=15000;
N=100;
[A,b,x0]=crearMatriz(N);

%Jacobi

%Gauss-Seidel
[TGS, cGS, tGS]=Tc_GaussSeidel(A,b,x0,maxit,tol)

%sor
wsor=linspace(1.5,2,30);

%Gradientes conjugados
    []=GradienteConjugado(A,b,x0,maxit,tol)