function [p,h] = biseccion2(f,a,b,tol)
 p=(a+b)/2;
 
while ((f(p)~=0) && abs(b-a) > tol )
if f(p)*f(b)<0
a=p ;
else
b=p ;
end % if
p=(a+b )/2 ;
end % while
h=f(p);
endfunction