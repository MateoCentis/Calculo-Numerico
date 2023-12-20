function R=rk4(f,a,b,ya,M)
%Ingresos
%- f es la funci�n como string 'f'
%- a y b extremos derecho e izquierdo
%- ya condici�n inicial y(a)
%- M es el n�mero de etapas
%salida - R = [T' Y'] con T vector de abcisas

h=(b-a)/M;
T=zeros(1,M+1);
Y=zeros(1,M+1);
T=a:h:b;
Y(1)=ya;
for j=1:M
k1=h*feval(f,T(j),Y(j));
k2=h*feval(f,T(j)+h/2,Y(j)+k1/2);
k3=h*feval(f,T(j)+h/2,Y(j)+k2/2);
k4=h*feval(f,T(j)+h,Y(j)+k3);
Y(j+1)=Y(j)+(k1+2*k2+2*k3+k4)/6;
endfor
R=[T' Y'];
endfunction