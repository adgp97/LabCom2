clc, clear, close all

% UNIVERSIDAD SIMON BOLIVAR
% DEPARTAMENTO DE ELECTRONICA Y CIRCUTOS
% EC3423 COMUNICACIONES II
% PRELABORATORIO 1 
% GREY RONDON 12-10679
% ANDRES AZPURUA 05-37869
%% LABORATORIO 1
Fs = 100;
Ts = 1/Fs;
t=[1:1:100]*(1/Fs);

%% Parte 1

x = [1 0 1 1 0 0 1]; %Secuencia de BITS dadas por el profesor

% NRZ Unipolar

for i=1:length(t)
    pulso1uni(i) = 1*rectpuls(t(i),10);
end

for i=1:length(t)
    pulso2uni(i) = 0*rectpuls(t(i),10);
end

nrz_uni = [];
for i=1:length(x)
    if x(i) == 1
        nrz_uni = [nrz_uni pulso1uni];
    else %% x(i) == 0
        nrz_uni = [nrz_uni pulso2uni];
    end
end    

figure(1)
set(gcf,'Name','NRZ Unipolar')
plot(nrz_uni)
title('NRZ Unipolar')
axis([-10 710 -1.5 1.5])
xlabel('t (10^-2)')
ylabel('x(t)')
grid on

%NRZ Bipolar

for i=1:length(t)
    pulso1pol(i) = 1*rectpuls(t(i),10);
end

for i=1:length(t)
    pulso2pol(i) = -1*rectpuls(t(i),10);
end

nrz_pol = [];
for i=1:length(x)
    if x(i) == 1
        nrz_pol = [nrz_pol pulso1pol];
    else %% x(i) == 0
        nrz_pol = [nrz_pol pulso2pol];
    end
end    

figure(2)
set(gcf,'Name','NRZ Unipolar')
plot(nrz_pol)
title('NRZ Polar')
axis([-10 710 -1.5 1.5])
xlabel('t (10^-2)')
ylabel('x(t)')
grid on

% Manchester

mit_t = length(t)/2;

for i=1:mit_t
    pulso1manch(i) = 1*rectpuls(t(i),5);
end

for i=1:mit_t
    pulso2manch(i) = -1*rectpuls(t(i),5);
end

manch = [];
for i=1:length(x)
    if x(i) == 1
        manch = [manch pulso1manch];
        manch = [manch pulso2manch];
    else %% x(i) == 0
        manch = [manch pulso2manch];
        manch = [manch pulso1manch];       
    end
end    

figure(3)
set(gcf,'Name','Manchester')
plot(manch)
axis([-10 710 -1.5 1.5])
title('Manchester')
xlabel('t (10^-2)')
ylabel('x(t)')
grid on


%% Parte 2

x6 = randi([0 1],1,6); %secuencia de bits transmitidos

for i=1:length(t)
    pulso1uni(i) = 1*rectpuls(t(i),10);
end

for i=1:length(t)
    pulso2uni(i) = 0*rectpuls(t(i),10);
end

nrz_uni = [];
for i=1:length(x6)
    if x6(i) == 1
        nrz_uni = [nrz_uni pulso1uni];
    else %% x(i) == 0
        nrz_uni = [nrz_uni pulso2uni];
    end
end    

autocorr = xcorr(nrz_uni); %autocorrelacion de la señal x
RXX = fftshift(fft(autocorr, 10000));
mod_dep6 = abs(RXX); % Se busca el modulo de X

dep6 = mod_dep6/max(mod_dep6);
N = length(dep6);
f6 = -Fs/2:Fs/N:Fs/2-Fs/N; %Vector de frecuencia

x50 = randi([0 1],1,50); %secuencia de bits transmitidos

for i=1:length(t)
    pulso1uni(i) = 1*rectpuls(t(i),10);
end

for i=1:length(t)
    pulso2uni(i) = 0*rectpuls(t(i),10);
end

nrz_uni = [];
for i=1:length(x50)
    if x50(i) == 1
        nrz_uni = [nrz_uni pulso1uni];
    else %% x(i) == 0
        nrz_uni = [nrz_uni pulso2uni];
    end
end    

autocorr = xcorr(nrz_uni); %autocorrelacion de la señal x
RXX = fftshift(fft(autocorr, 50000));
mod_dep50 = abs(RXX); % Se busca el modulo de X

dep50 = mod_dep50/max(mod_dep50);
N = length(dep50);
f50 = -Fs/2:Fs/N:Fs/2-Fs/N; %Vector de frecuencia

x1000 = randi([0 1],1,1000); %secuencia de bits transmitidos

for i=1:length(t)
    pulso1uni(i) = 1*rectpuls(t(i),10);
end

for i=1:length(t)
    pulso2uni(i) = 0*rectpuls(t(i),10);
end

nrz_uni = [];
for i=1:length(x1000)
    if x1000(i) == 1
        nrz_uni = [nrz_uni pulso1uni];
    else %% x(i) == 0
        nrz_uni = [nrz_uni pulso2uni];
    end
end    
 
autocorr = xcorr(nrz_uni); %autocorrelacion de la señal x
RXX = fftshift(fft(autocorr, 100000));
mod_dep1000 = abs(RXX); % Se busca el modulo de X

dep1000 = mod_dep1000/max(mod_dep1000);
N = length(dep1000);
f1000 = -Fs/2:Fs/N:Fs/2-Fs/N; %Vector de frecuencia

figure()
hold on
plot(f6,dep6,'r');
plot(f50,dep50,'g');
plot(f1000,dep1000);
hold off

%% Parte 3

x = randi([0 1],1,1000); %secuencia de bits transmitidos

% NRZ unipolar

for i=1:length(t)
    pulso1uni(i) = 1*rectpuls(t(i),10);
end

for i=1:length(t)
    pulso2uni(i) = 0*rectpuls(t(i),10);
end

nrz_uni = [];
for i=1:length(x)
    if x(i) == 1
        nrz_uni = [nrz_uni pulso1uni];
    else %% x(i) == 0
        nrz_uni = [nrz_uni pulso2uni];
    end
end    
 
% NRZ bipolar

nrz_pol = [];

for i=1:length(t)
    pulso1pol(i) = 1*rectpuls(t(i),10);
end

for i=1:length(t)
    pulso2pol(i) = -1*rectpuls(t(i),10);
end

for i=1:length(x)
    if x(i) == 1
        nrz_pol = [nrz_pol pulso1pol];
    else %% x(i) == 0
        nrz_pol = [nrz_pol pulso2pol];
    end
end    

% Manchester

mit_t = length(t)/2;

for i=1:mit_t
    pulso1manch(i) = 1*rectpuls(t(i),5);
end

for i=1:mit_t
    pulso2manch(i) = -1*rectpuls(t(i),5);
end

manch = [];
for i=1:length(x)
    if x(i) == 1
        manch = [manch pulso1manch];
        manch = [manch pulso2manch];
    else %% x(i) == 0
        manch = [manch pulso2manch];
        manch = [manch pulso1manch];       
    end
end    

% DEP

autocorr = xcorr(nrz_uni); %autocorrelacion de la señal x
RXX = fftshift(fft(autocorr, 100000));
mod_dep1000 = abs(RXX); % Se busca el modulo de X
dep_nrz_uni = mod_dep1000/max(mod_dep1000);
N = length(dep1000);
f_nrz_uni = -Fs/2:Fs/N:Fs/2-Fs/N; %Vector de frecuencia

autocorr = xcorr(nrz_pol); %autocorrelacion de la señal x
RXX = fftshift(fft(autocorr, 100000));
mod_dep1000 = abs(RXX); % Se busca el modulo de X
dep_nrz_pol = mod_dep1000/max(mod_dep1000);
N = length(dep1000);
f_nrz_pol = -Fs/2:Fs/N:Fs/2-Fs/N; %Vector de frecuencia

autocorr = xcorr(manch); %autocorrelacion de la señal x
RXX = fftshift(fft(autocorr, 100000));
mod_dep1000 = abs(RXX); % Se busca el modulo de X
dep_manch = mod_dep1000/max(mod_dep1000);
N = length(dep1000);
f_manch = -Fs/2:Fs/N:Fs/2-Fs/N; %Vector de frecuencia

% Plot

figure ();
title('DEP disintos codigos de linea, 1000 bits aleatorios')
hold on;
plot(f_nrz_uni, dep_nrz_uni, 'r')
plot(f_nrz_pol, dep_nrz_pol, 'g')
plot(f_manch, dep_manch, 'b')
legend('DEP NRZ unipolar','DEP NRZ bipolar','DEP Manchester')