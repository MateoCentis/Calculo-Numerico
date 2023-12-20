function [x] = sust_adelante1(A)
  x=A(:,1);%X es el vector que contiene los valores de la primera columna
  n=length(x);%definimos n por ser una variable local
  x(1)=A(1,1);%El primero, es decir, el valor correspondiente a la primera fila y última columna se divide por el pivote, y se van guardando en el mismo vector.
  %Ahora se van a ir despejando y guardando los términos
  for i=2:n%va desde n-1 es decir hasta 1 bajando de a -1.
    s=A(i,1);%s es el iésimo valor de la primera columna
    for j=2:n%j va desde 2 hasta |i-n|
      s-=A(i,j)*x(j);%Le resto a s el valor
    endfor
    x(i)=s/A(i,i);%Divido por el pivote y los voy guardando en el vector 
  endfor
 end