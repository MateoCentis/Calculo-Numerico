function [A,df]=diffnew(X,Y)
  %Ingreso
  %-X vector abcisa 1xn
  %-Y vector ordenada 1xn
  %salida - A vector 1xn que contiene los coeficientes del polinomio de grado
  %n de Newton
  %- df derivada aproximada
  A=Y;
  N=length(X);
  for j=2:N
    for k=N:-1:j
      A(k)=(A(k)-A(k-1))/(X(k)-X(k-j+1));
    endfor
  endfor
  x0=X(1);
  df=A(2);
  prod=1;
  n1=length(A)-1;
  for k=2:n1
    prod=prod*(x0-X(k));
    df=df+prod*A(k+1);
  endfor
endfunction 