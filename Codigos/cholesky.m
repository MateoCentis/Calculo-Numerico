function[L,U,t]=cholesky(A)
 tic();
 n=length(A(1,:));
 L=zeros(n,n);
 for i=1:n
L(i,i)=sqrt(A(i,i) - L(i,1:i-1)*L(i,1:i-1)');
L(i+1:n,i) = (A(i+1:n,i) - L(i+1:n,1:i-1) * L(i,1:i-1)')/L(i,i);
 endfor
 U=L';
 t=toc();
endfunction