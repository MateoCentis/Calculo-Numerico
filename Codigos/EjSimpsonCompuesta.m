% vemos un ejemplo de la Simpson compuesta
% EjSimpsonCompuesta.m
clear all; clc;

ejemplo = '2';
switch ejemplo
  case '1',
   a = -5; b = 5;
   f = @(x) exp(-x.^2);
  case '2',
    a = 1; b = 10;
    f = @(x) (x.^3)./(exp(x)-1);
end


L = 2.^[1:12]'; % duplicamos la cantidad de subintervalos necesario para realizar
                % los ejercicios propuestos.

Q_S =zeros(size(L)); % Vector con la dimension de los subintervalos y en 
                  % cada componente tiene la aprox. de la regla del trapecio
                  % Q_trap(1) tiene 2 subinterv, Q_trap(2) tiene 4 y asi sucesiv
for i= 1:numel(L);
  x = linspace(a,b,(L(i)+1));
  y = f(x); 
  
  Q_S(i)= SimpsonComp(x,y);
endfor

format long g
Calculo=[L Q_S]

QS_f=Q_S(end)
E_Simp = abs(Q_S-QS_f) % Restamos a cada componente de este vector la ultima, suponiendo 
               % que la misma es la correcta.
% NOTA:              
% Como no hay una regla clara de la variacion del error, necesito saber cuantas 
% veces tengo que duplicar para obtener todos los digitos correctos o cual es la
% velocidad con la que va decreciendo.

% Tomo el cociente entre dos consecutivos: (nos da la ganancia que logramos)

Cociente_Simp = E_Simp(1:end-1)./E_Simp(2:end)