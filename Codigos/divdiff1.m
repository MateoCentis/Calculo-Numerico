function nf = divdiff1(xi,fi)
 DIFERENCIAS DIVIDIDAS
%DIVDIFF calcula los the coeficientes para la diferencia hacia
%adelante de Newton,del polinomio interpolante asociado
%con un dado conjunto de puntos interpolantes
%
%secuencias de llamado:
%nf = divdiff1 ( xi, fi )
%divdiff1 ( xi, fi )
%
%ingresos:
%xi vector conteniendo los puntos interpolantes
%fi vector conteniendo los valores de la función
%la entrada I en este vector es el valor de la función
%asociado con la entrada i del vector'xi'
%salida:
%nf vector conteniendo coeficientes de la diferencia hacia
%adelante de Newton,del polinomio interpolante asociado
%con un dado conjunto de puntos interpolantes
%NOTA:
%para evaluar la forma de Newton , applicar rutina NF_EVAL
%ejemplo:> fi=[0.8;1.6;2.25;2.8;3.35];
% xi=[0.5;0.8;1.0;1.4;1.75];
%divdiff1 ( xi, fi );ans =
 0.8000
 2.6667
 1.1667
 -4.7685
%6.6669;
n = length ( xi );
m = length ( fi );
if ( n ~= m )
disp ( 'error divdiff : número de ordendas y número de valores de la
función deben ser iguales' )
return
end
nf = fi;
for j = 2:n
for i = n:-1:j
nf(i) = ( nf(i) - nf(i-1) ) / ( xi(i) - xi(i-j+1) );
end
end
