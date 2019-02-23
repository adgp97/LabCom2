
secuencia_1 = [1 0 1 1 0 0 1];       %secuencia prueba
secuencia_2 = randi([0 1], 1, 10);    %secuencia de 6 bits
secuencia_3 = randi([0 1], 1, 50);   %secuencia de 50 bits
secuencia_4 = randi([0 1], 1, 1000); %secuencia de 1000 bits
bitrate = 1; % bits per second
%%
%Graficas para la secuencia de prueba
figure(1);
[t,s1unrz,fs] = unrz(secuencia_1,bitrate);
plot(t,s1unrz,'LineWidth',3);
axis([0 t(end) -0.1 1.1])
grid on;
title(['Unipolar NRZ. Secuencia de prueba']);

figure(2);
[t,s1pnrz,fs] = pnrz(secuencia_1,bitrate);
plot(t,s1pnrz,'LineWidth',3);
axis([0 t(end) -1.1 1.1])
grid on;
title(['Polar NRZ. Secuencia de prueba']);

figure(3);
[t,s1m,fs] = manchester(secuencia_1,bitrate);
plot(t,s1m,'LineWidth',3);
axis([0 t(end) -1.1 1.1])
grid on;
title(['Manchester. Secuencia de prueba']);
%%
%Secuencia de 10 bits
figure(4);
[t,s2unrz,fs] = unrz(secuencia_2,bitrate);
plot(t,s2unrz,'LineWidth',3);
axis([0 t(end) -0.1 1.1])
grid on;
title(['Unipolar NRZ. Secuencia de 10 bits']);

figure(5);
[t,s2pnrz,fs] = pnrz(secuencia_2,bitrate);
plot(t,s2pnrz,'LineWidth',3);
axis([0 t(end) -1.1 1.1])
grid on;
title(['Polar NRZ. Secuencia de 10 bits']);

figure(6);
[t,s2m,fs] = manchester(secuencia_2,bitrate);
plot(t,s2m,'LineWidth',3);
axis([0 t(end) -1.1 1.1])
grid on;
title(['Manchester. Secuencia de 10 bits']);

%Densidades espectrales de potencia

%NRZ unipolar
autocorr_2_unrz = xcorr(s2unrz); 
RXX_2_unrz = fftshift(fft(autocorr_2_unrz, 100000));
dep10_2_unrz = abs(RXX_2_unrz);
%dep10_2_unrz = dep10_2_unrz/max(dep10_2_unrz);
%NRZ polar
autocorr_2_pnrz = xcorr(s2pnrz); 
RXX_2_pnrz = fftshift(fft(autocorr_2_pnrz, 100000));
dep10_2_pnrz = abs(RXX_2_pnrz);
%dep10_2_pnrz = dep10_2_pnrz/max(dep10_2_pnrz);
%Manchester
autocorr_2_m = xcorr(s2m); 
RXX_2_m = fftshift(fft(autocorr_2_m, 100000));
dep10_2_m = abs(RXX_2_m);
%dep10_2_m = dep10_2_m/max(dep10_2_m);

N = length(dep10_2_unrz);
f = -fs/2:fs/N:fs/2-fs/N; %Vector de frecuencia

figure(7);
hold on
grid on
plot(f,dep10_2_unrz,'LineWidth',3);
plot(f,dep10_2_pnrz,'LineWidth',2);
plot(f,dep10_2_m,'LineWidth',1);
legend('DEP NRZ unipolar','DEP NRZ bipolar','DEP Manchester')

%%
figure(1);
[t,s3unrz,fs] = unrz(secuencia_3,bitrate);
plot(t,s3unrz,'LineWidth',3);
axis([0 t(end) -0.1 1.1])
grid on;
title(['Unipolar NRZ. Secuencia de 50 bits']);

figure(2);
[t,s3pnrz,fs] = pnrz(secuencia_3,bitrate);
plot(t,s3pnrz,'LineWidth',3);
axis([0 t(end) -1.1 1.1])
grid on;
title(['Polar NRZ. Secuencia de 50 bits']);

figure(3);
[t,s3m,fs] = manchester(secuencia_3,bitrate);
plot(t,s3m,'LineWidth',3);
axis([0 t(end) -1.1 1.1])
grid on;
title(['Manchester. Secuencia de 50 bits']);

%Densidades espectrales de potencia

%NRZ unipolar
autocorr_3_unrz = xcorr(s3unrz); 
RXX_3_unrz = fftshift(fft(autocorr_3_unrz, 100000));
dep50_3_unrz = abs(RXX_3_unrz);
%dep10_2_unrz = dep10_2_unrz/max(dep10_2_unrz);
%NRZ polar
autocorr_3_pnrz = xcorr(s3pnrz); 
RXX_3_pnrz = fftshift(fft(autocorr_3_pnrz, 100000));
dep50_3_pnrz = abs(RXX_3_pnrz);
%dep10_2_pnrz = dep10_2_pnrz/max(dep10_2_pnrz);
%Manchester
autocorr_3_m = xcorr(s3m); 
RXX_3_m = fftshift(fft(autocorr_3_m, 100000));
dep50_3_m = abs(RXX_3_m);
%dep10_2_m = dep10_2_m/max(dep10_2_m);

N = length(dep50_3_unrz);
f = -fs/2:fs/N:fs/2-fs/N; %Vector de frecuencia

figure(4);
hold on
grid on
plot(f,dep50_3_unrz,'LineWidth',3);
plot(f,dep50_3_pnrz,'LineWidth',2);
plot(f,dep50_3_m,'LineWidth',1);
legend('DEP NRZ unipolar','DEP NRZ bipolar','DEP Manchester')

%%
figure(1);
[t,s4unrz,fs] = unrz(secuencia_4,bitrate);
plot(t,s4unrz,'LineWidth',3);
axis([0 t(end) -0.1 1.1])
grid on;
title(['Unipolar NRZ. Secuencia de 1000 bits']);

figure(2);
[t,s4pnrz,fs] = pnrz(secuencia_4,bitrate);
plot(t,s4pnrz,'LineWidth',3);
axis([0 t(end) -1.1 1.1])
grid on;
title(['Polar NRZ. Secuencia de 1000 bits']);

figure(3);
[t,s4m,fs] = manchester(secuencia_4,bitrate);
plot(t,s4m,'LineWidth',3);
axis([0 t(end) -1.1 1.1])
grid on;
title(['Manchester. Secuencia de 1000 bits']);

%Densidades espectrales de potencia

%NRZ unipolar
autocorr_4_unrz = xcorr(s4unrz); 
RXX_4_unrz = fftshift(fft(autocorr_4_unrz, 100000));
dep1000_4_unrz = abs(RXX_4_unrz);
%dep10_2_unrz = dep10_2_unrz/max(dep10_2_unrz);
%NRZ polar
autocorr_4_pnrz = xcorr(s4pnrz); 
RXX_4_pnrz = fftshift(fft(autocorr_4_pnrz, 100000));
dep1000_4_pnrz = abs(RXX_4_pnrz);
%dep10_2_pnrz = dep10_2_pnrz/max(dep10_2_pnrz);
%Manchester
autocorr_4_m = xcorr(s4m); 
RXX_4_m = fftshift(fft(autocorr_4_m, 100000));
dep1000_4_m = abs(RXX_4_m);
%dep10_2_m = dep10_2_m/max(dep10_2_m);

N = length(dep1000_4_unrz);
f = -fs/2:fs/N:fs/2-fs/N; %Vector de frecuencia

figure(4);
hold on
grid on
plot(f,dep1000_4_unrz,'LineWidth',3);
plot(f,dep1000_4_pnrz,'LineWidth',2);
plot(f,dep1000_4_m,'LineWidth',1);
legend('DEP NRZ unipolar','DEP NRZ bipolar','DEP Manchester')