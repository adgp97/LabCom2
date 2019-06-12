%EJECUTAR SECCION POR SECCION
%% Preliminares
clear;clc;

%% Act 1

%Suma modulo 16 de los últimos digitos del carnet
sum = 7;

%Cada línea representa una palabra codificada
X = [0 0 0 0 0 0 0;
     0 0 0 1 0 1 1;
     0 0 1 0 1 1 0;
     0 0 1 1 1 0 1;
     0 1 0 0 1 1 1;
     0 1 0 1 1 0 0;
     0 1 1 0 0 0 1;
     0 1 1 1 0 1 0;
     1 0 0 0 1 0 1;
     1 0 0 1 1 1 0;
     1 0 1 0 0 1 1;
     1 0 1 1 0 0 0;
     1 1 0 0 0 1 0;
     1 1 0 1 0 0 1;
     1 1 1 0 1 0 0;
     1 1 1 1 1 1 1];
 
 %Cálculo de la distancia de Hamming. La distancia de Hamming se define
 %como la cantidad de bits diferentes entre dos bloques
 c = X((sum+1),:);
 
 for i = 1:16
     d(i) = 0;
     for j = 1:7
         if( X(i,j) ~= c(j) )
            d(i) = d(i) + 1; 
         end
     end
 end
disp('Distancia de Hamming para cada palabra')
d = d'

%% Act 2. Caso de un error
clc;
%Cambiar el segundo bit de c. 
%Cuidado al repetir esta sección sin repetir la anterior. Repetir esta 
%seccion indiscriminadamente cambiará constantemente el valor del bit y 
%puede que no se obtenga el resultado esperado.
c(2) = ~c(2);
%%
%Cálculo de las nuevas distancias de Hamming para el caso de un error
 for i = 1:16
     d2(i) = 0;
     for j = 1:7
         if( X(i,j) ~= c(j) )
            d2(i) = d2(i) + 1; 
         end
     end
 end
disp('Distancia de Hamming para cada palabra')
d2 = d2'

%% Act 2. Caso de dos errores
clc;
%Cambiar el cuarto bit de c. 
%Cuidado al repetir esta sección sin repetir la sección Act 1. Repetir esta 
%sección indiscriminadamente cambiará constantemente el valor del bit y 
%puede que no se obtenga el resultado esperado.
c(4) = ~c(4);

%%
%Cálculo de las nuevas distancias de Hamming para el caso de dos error
 for i = 1:16
     d3(i) = 0;
     for j = 1:7
         if( X(i,j) ~= c(j) )
            d3(i) = d3(i) + 1; 
         end
     end
 end
disp('Distancia de Hamming para cada palabra')
d3 = d3'

%% Act 3 y 6
clc;
%Generacion de las matrices para el codigo Hamming 
m = 5;
[H,G,n,k] = hammgen(m);

%Ajuste de las matrices

%Ajuste de H
H_t = H';
H_t(1:k,:) = H_t((m+1):n,:);
H_t((k+1):n,:) = eye(m);
H = H_t';

%Ajuste de G
G(:,(k+1):n) = G(:,1:m);
G(:,1:k) = eye(k);

%Extraccion de P
P = G(:,(k+1):n);
%% Ejemplo 
M = [1 0 1 0];
P = G(:,(k+1):n);
C = mod(M*P,2);
disp('El mensaje ejemplo es')
x = [M C]

%Verificacion del sindrome para un mensaje no errado
disp('El sindrome para un mensaje sin errores resulta')
S = mod(x*H_t,2)

%Error en el segundo bit
y = x;
y(2) = ~y(2);
disp('El sindrome para un mensaje con un error en el segundo bit resulta')
S = mod(y*H_t,2)

%Ejemplo con 2 errores (segundo y cuarto bit)
z = y;
z(4) = ~z(4);
disp('El sindrome para un mensaje con un error en el segundo y cuarto bit resulta')
S = mod(z*H_t,2)


