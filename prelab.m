%%
%Preliminares
clear
clc

x = 3:0.5:6.5;
%%
%Probabilidad de error de senal antipoda
%Pe = Q(sqr(2*Eb/No))

Pe_ant = qfunc(sqrt(2*x));
Nb_ant = 100./Pe_ant;

figure();
semilogy(x,Pe_ant);
grid on
title('Probabilidad de error para una señal binaria antípoda');
xlabel('Relación señal a ruido en dB');
ylabel('Probabilidad');
%%
%Probabilidad de error de senal binaria con "0" representados por 0V
%Pe = Q(sqr(Eb/No))

Pe_0 = qfunc(sqrt(x));
Nb_0 = 100./Pe_0;

figure();
semilogy(x,Pe_0);
grid on
title('Probabilidad de error para una señal binaria con "0" representados por 0V');
xlabel('Relación señal a ruido en dB');
ylabel('Probabilidad');