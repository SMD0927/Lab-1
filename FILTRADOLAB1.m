clc; clear; close all;

A1 = load("Erick.mat");
A2 = load("ErickH.mat");

x1 = A1.voltaje;   t1 = A1.tiempo_total;   Fs1 = A1.Fs;
x2 = A2.voltaje;   t2 = A2.tiempo_total;   Fs2 = A2.Fs;

% FILTRADO
f_low  = 0.1;
f_high = 0.75;  

[b1,a1] = butter(2,[f_low f_high]/(Fs1/2),"bandpass");
x1_filt = filtfilt(b1,a1,x1);

[b2,a2] = butter(2,[f_low f_high]/(Fs2/2),"bandpass");
x2_filt = filtfilt(b2,a2,x2);

% Sin filtro
figure(1);
plot(t1, x1, 'Color',[0.5 0 0.5], 'LineWidth', 1.2);
xlabel('Tiempo (s)');
ylabel('Voltaje (V)');
title('Señal 1 - sin filtrar');
grid on;

figure(2);
plot(t2, x2, 'Color',[0.5 0 0.5], 'LineWidth', 1.2);
xlabel('Tiempo (s)');
ylabel('Voltaje (V)');
title('Señal 2 - sin filtrar');
grid on;

% Señales filtradas
figure(3);
plot(t1, x1_filt, 'b', 'LineWidth', 1.5);
xlabel('Tiempo (s)');
ylabel('Voltaje (V)');
title('Señal 1 - filtrada (0.1–0.5 Hz)');
grid on;

figure(4);
plot(t2, x2_filt, 'b', 'LineWidth', 1.5);
xlabel('Tiempo (s)');
ylabel('Voltaje (V)');
title('Señal 2 - filtrada (0.1–0.5 Hz)');
grid on;

%FFT 1 (FOURIER 1)
N1 = length(x1_filt);
X1 = fft(x1_filt);
f1 = (0:N1-1)*(Fs1/N1);
mag1 = abs(X1)/N1;

half1 = 1:floor(N1/2);
f1 = f1(half1);
mag1 = mag1(half1);

figure(5);
plot(f1, mag1, 'LineWidth', 1.5);
xlabel('Frecuencia (Hz)');
ylabel('Magnitud');
title('Espectro (FFT) - Señal 1');
grid on;
xlim([0 2]);

% Frecuencia dominante (Señal 1)
[~, idx1] = max(mag1);
f_resp1 = f1(idx1);
resp_min1 = f_resp1 * 60;

disp("SEÑAL 1");
disp("Frecuencia respiratoria dominante:");
disp(f_resp1 + " Hz");
disp("Frecuencia respiratoria dominante en respiraciones por minuto:");
disp(resp_min1 + " resp/min");
%2
N2 = length(x2_filt);
X2 = fft(x2_filt);
f2 = (0:N2-1)*(Fs2/N2);
mag2 = abs(X2)/N2;

half2 = 1:floor(N2/2);
f2 = f2(half2);
mag2 = mag2(half2);

figure(6);
plot(f2, mag2, 'LineWidth', 1.5);
xlabel('Frecuencia (Hz)');
ylabel('Magnitud');
title('Espectro (FFT) - Señal 2');
grid on;
xlim([0 2]);

% Frecuencia dominante (Señal 2)
[~, idx2] = max(mag2);
f_resp2 = f2(idx2);
resp_min2 = f_resp2 * 60;


disp("SEÑAL 2");
disp("Frecuencia respiratoria dominante:");
disp(f_resp2 + " Hz");
disp("Frecuencia respiratoria dominante en respiraciones por minuto:");
disp(resp_min2 + " resp/min");

