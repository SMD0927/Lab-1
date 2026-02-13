clc; clear; close all;


nombre = input('Ingrese su nombre: ', 's');
Trec = input('Ingrese la duración de la muestra en segundos: ');
archivo = nombre + ".mat";

%  CONFIGURACIÓN TÉCNICA 
puerto = "COM13";
baudrate = 115200;
Fs = 50;                 
ventana = 10;            

Ntotal = Fs * Trec;      
Nvent = Fs * ventana;    

% CONEXIÓN SERIAL 
s = serialport(puerto, baudrate);
configureTerminator(s,"LF");
flush(s);
pause(2);

% Buffers
buffer = zeros(Nvent,1);     
voltaje = zeros(Ntotal,1);   
tiempo_total = (0:Ntotal-1)/Fs;
tiempo_vent = linspace(-ventana, 0, Nvent);

% Figura
figure;
h = plot(tiempo_vent, buffer, 'LineWidth', 1.5);
xlabel('Tiempo (s)');
ylabel('Voltaje (V)');
title(['Señal respiratoria de: ', nombre]);
grid on;
ylim([0 3.3]);

% ======== ADQUISICIÓN ========
disp("Iniciando grabación...");

for k = 1:Ntotal
    valor = str2double(readline(s));
    if ~isnan(valor)
        voltaje(k) = valor;
        buffer = [buffer(2:end); valor];   
        set(h, 'YData', buffer);
        drawnow limitrate;
    end
end

% Cerrar puerto
clear s;


% Guardar con el nombre ingresado
save(archivo, "voltaje", "tiempo_total", "Fs");

disp("Grabación finalizada y guardada como: " + archivo);