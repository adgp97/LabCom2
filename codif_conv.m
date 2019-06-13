%% Codificador convolucional

%Preliminares
clear;clc;

%Definiciones
const_len = 3;      %Constraint length
code_rate = 1/2;    %Tasa del codigo
disp('Mensaje original');
m = [1 1 0 0 0];     %Mensjae original
disp(m);

%Ecuaciones de paridad
u1 = str2double(dec2base(bin2dec('101'),8));
u2 = str2double(dec2base(bin2dec('111'),8));
code_gen = [u1 u2];

%Generador de la estructura Trellis
t = poly2trellis(const_len,code_gen);

%Codificador del mensaje
disp('Mensaje codificado');
m_codif = convenc(m,t);
disp(m_codif);

%% Decodificador por medio del algoritmo de Viterbi
disp('La secuencia recibida es')
m_codif = [0 1 1 0 1 1 1 1 0 1 0 0 0 1];
disp(m_codif);
disp('El mensaje decodificado es');
m_decodif = vitdec(m_codif,t,const_len,'trunc','hard');
disp(m_decodif);

%% Simulink

%Preliminares
clear;clc;

%Definiciones
const_len = 3;      %Constraint length
disp('Mensaje original');
m = [0 1 1 0 0 0];     %Mensjae original
disp(m);

%Ecuaciones de paridad
u1 = str2double(dec2base(bin2dec('101'),8));
u2 = str2double(dec2base(bin2dec('111'),8));
code_gen = [u1 u2];
%Generador de la estructura Trellis
t = poly2trellis(const_len,code_gen);

%Simulacion
sim('conv_coder');
disp('El mensaje codificado es')
disp(m_codif(1,:));
disp('El mensaje decodificado es')
disp(m_decodif(1,:));



%%