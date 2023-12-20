function [A, b, x0] = crearMatriz(N)
    A=(2*diag(ones(1,N),0)-1*diag(ones(1,N-1),1)-1*diag(ones(1,N-1),-1));
    A(1,[1:2])=[1 0];
    A(N,[N-1:N])=[0,1];
    b=ones(N,1);
    b(1)=0;
    b(N)=0;
    b= [b(1);(1/N^2).*ones(N-2,1);b(N)];
    x0 = zeros(N,1);
endfunction
