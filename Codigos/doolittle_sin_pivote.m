function [L,U] = doolittle_sin_pivote(A)
 n = length(A);
 L = eye(n); %matriz identidad de nxn
 U = zeros(n); %matriz de ceros
 for k=1:n
 U(k,k) = A(k,k) - L(k,1:k-1)*U(1:k-1,k); %diagonal de U                        
 U(k,k+1:n) = A(k,k+1:n) - L(k,1:k-1)*U(1:k-1,k+1:n);                           
 L(k+1:n,k) = (A(k+1:n,k) - L(k+1:n,1:k-1)*U(1:k-1,k))/ U(k,k);                 
 end 
endfunction                                                                                        