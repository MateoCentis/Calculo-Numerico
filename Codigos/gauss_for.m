function [x] = gauss_for(A,b)
  n = length(b);%Longitud de filas y columnas
  A=[A b];%Amplio la matriz
  for k=1:n-1 
    for i=k+1:n %Recorro las filas desde la fila pivote+1 hasta el final
      m=A(i,k)/A(k,k);%coeficiente igual a valor del renglon divido pivote
      A(i,k)=0;%Lo hago 0 porque ya se que va a ser cero
      for j=k+1:n+1%Recorro columnas desde la columna pivote+1 hasta la col+1
        A(i,j)-=m*A(k,j);%le voy restando a cada a_ij el multiplicador por el correspondiente a los del renglon del pivote
      endfor
    endfor
  endfor
if (A(n,n)==0)
  disp('no hay sol. única');
endif
x = sust_atras1(A);%retrosustitución