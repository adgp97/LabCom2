%%
x_dB = 3:0.5:6.5;
%%
%Antipoda
Pe_teo = [0.0229
0.0172
0.0125
0.0088
0.0060
0.0039
0.0024
0.0014];

Pe_exp = [0.0211
0.0160
0.0108
0.0084
0.0063
0.0038
0.0026
0.0016];

figure()
semilogy(x_dB, Pe_teo);
hold on
semilogy(x_dB, Pe_exp);
legend('Teórica','Experimental');
grid minor
title('Probabilidad de error para una señal binaria antípoda');
xlabel('Relación señal a ruido en dB');
ylabel('Probabilidad');

%%
%Ortogonal
Pe_teo = [0.0789
0.0673
0.0565
0.0466
0.0377
0.0298
0.0230
0.0173];

Pe_exp = [0.0922
0.0772
0.0676
0.0515
0.0374
0.0263
0.0212
0.0159];

%figure()
semilogy(x_dB, Pe_teo);
%hold on
semilogy(x_dB, Pe_exp);
legend('Teórica','Experimental');
grid minor
title('Probabilidad de error para una señal binaria ortogonal');
xlabel('Relación señal a ruido en dB');
ylabel('Probabilidad');