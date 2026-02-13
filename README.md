# Instrumentación Biomédica y Biosensores 
 LABORATORIO - 1 Monitoreo del patrón y frecuencia respiratoria 
###  Integrantes
- Shesly Nicole Colorado - 5600756
- Santiago Mora - 5600775
- Daniel Herrera - 5600588


## Requisitos
 Hardware:
 - Arduino IDE
 - Matlab
   
  Software:
 - Sensor FSR 402
 - ESP32

----
# 1.  INTRODUCCIÒN

En este laboratorio se analizó el patrón y la frecuencia respiratoria mediante la adquisición de una señal biológica usando sensores y Arduino. Posteriormente, la señal se procesó en MATLAB para observar su comportamiento en el tiempo y la frecuencia, comparando condiciones de reposo y habla.
ó
En este laboratorio se estudió el patrón y la frecuencia respiratoria mediante la adquisición y análisis de una señal biológica con sensores, Arduino y MATLAB. Esta práctica brinda una base teórica y aplicada sobre el monitoreo respiratorio, permitiendo comprender su relevancia dentro de la instrumentación biomédica y su utilidad en contextos reales de evaluación fisiológica.

### Proceso Respiratorio
La respiración es un proceso vital para el funcionamiento normal en todos los niveles de organización, desde la célula hasta el organismo. El oxígeno, suministrado por la circulación local a nivel tisular, funciona en la membrana interna mitocondrial como mediador esencial para la liberación de energía. En las mitocondrias, los nutrientes digeridos experimentan reacciones metabólicas, llegan a la cadena de transporte de electrones y liberan compuestos de alta energía (p. ej., trifosfato de adenosina). El principal subproducto de este proceso, el dióxido de carbono, se libera en la sangre venosa y regresa a los pulmones. El dióxido de carbono se difunde a través de las paredes alveolares y se disuelve en el aire exhalado. La frecuencia respiratoria (es decir, el número de respiraciones por minuto) está altamente regulada para que las células produzcan la energía óptima en cualquier momento. Un complejo sistema nervioso de tejidos nerviosos regula la tasa de entrada de oxígeno y la tasa de salida de dióxido de carbono, ajustándola en consecuencia en condiciones que alteran las presiones parciales de los gases en la sangre. La respiración involucra el cerebro, el tronco encefálico, los músculos respiratorios, los pulmones, las vías respiratorias y los vasos sanguíneos. Todas estas estructuras tienen una participación estructural, funcional y reguladora en la respiración. 

<p align="center">
  <img width="400" height="300" alt="ChatGPT Image 10 feb 2026, 11_51_06 p m" src="https://github.com/user-attachments/assets/af834e30-64be-4e7f-9ad0-447e488c4079" />
</p>
<p align="center">
  Fig 1. Proceso respiratorio
</p>

-----
# 2. OBJETIVOS

### Objetivo General

Evaluar la influencia del habla o verbalización sobre el
patrón respiratorio

### Objetivos Específicos
• Reconocer las variables físicas principalmente involucradas en el proceso
respiratorio.

• Desarrollar un sistema que extraiga el patrón respiratorio y la frecuencia
respiratoria.

• Identificar tareas de verbalización a partir del patrón y/o la frecuencia
respiratoria.

-----
# 3. PARTE A

### Variables fisicas
En el proceso respiratorio intervienen diversas variables físicas asociadas al movimiento y la mecánica pulmonar. En esta práctica se consideraron principalmente:

- Expansión torácica/abdominal: desplazamiento mecánico producido durante la inhalación.

- Variación de presión mecánica: generada por la expansión del abdomen al respirar.

- Tiempo de inspiración y espiración: duración de cada fase del ciclo respiratorio.

- Frecuencia respiratoria (RR): número de ciclos respiratorios por minuto.

La variable física medida directamente fue la variación de presión mecánica asociada a la expansión abdominal, la cual permite reconstruir el patrón respiratorio y calcular la frecuencia dominante.

<p align="center">
<img width="247" height="204" alt="image" src="https://github.com/user-attachments/assets/6ee49338-2cde-410c-9b6c-1b2359fd574f" />
</p>
<p align="center">
  Fig 2. Expanciòn toràcica
</p>


### Sensor seleccionado
El sensor elegido fue un FSR402 (Force Sensitive Resistor).

Este sensor es una resistencia dependiente de la fuerza aplicada: su resistencia disminuye cuando aumenta la presión sobre su superficie.

Justificación de selección:

- Es un sensor no invasivo.

- Fácil integración con Arduino/ESP32.

- Compatible con alimentación de 3.3–5 V.

- Permite obtener una señal analógica proporcional a la presión.

- Bajo costo y fácil disponibilidad.

El FSR no mide directamente volumen pulmonar, pero permite detectar las variaciones mecánicas asociadas al ciclo respiratorio.

<p align="center">
<img width="225" height="225" alt="image" src="https://github.com/user-attachments/assets/c66ad4e2-d061-40fb-8751-1f3fe9f46e9b" />
</p>
<p align="center">
  Fig 3. FSR 402
</p>




### Montaje fisico
El sensor FSR402 fue colocado en la región torácica anterior, aproximadamente a la altura del esternón o en la zona intercostal media, donde se evidencia claramente la expansión del tórax durante la respiración.

Para garantizar una señal estable y minimizar interferencias:

- Se utilizó una banda elástica ajustable para mantener el sensor en contacto continuo con la superficie torácica.

- Se evitó aplicar presión excesiva que pudiera saturar el sensor o limitar el movimiento natural del tórax.

- El sujeto permaneció en posición sentada, con la espalda recta, para reducir artefactos por movimiento corporal.

- Se indicó evitar movimientos bruscos de hombros o brazos durante la adquisición.

Durante la inhalación, el tórax se expande, generando un aumento en la presión ejercida sobre el FSR y, por tanto, un incremento en la señal eléctrica.
Durante la exhalación, el tórax retorna a su posición inicial, disminuyendo la presión sobre el sensor y reduciendo la amplitud de la señal.

La ubicación torácica permitió capturar de manera directa el patrón respiratorio asociado a la mecánica pulmonar, siendo adecuada para el análisis del ciclo respiratorio y la estimación de la frecuencia dominante.

### Señal en Serial Plotter (Reposo-Habla)
#### En reposo

Durante la respiración normal en reposo:

- La señal presentó un comportamiento periódico y relativamente estable.

- Se observaron ciclos regulares correspondientes a inhalación y exhalación.

- La amplitud fue constante.

- El conteo manual permitió estimar una frecuencia aproximada de ___ respiraciones por minuto.


##### Durante el habla

- Mientras el sujeto leía en voz alta:

- La señal mostró mayor irregularidad.

- Se observaron variaciones en la amplitud.

- Se prolongaron las fases de espiración (debido a la fonación).

- La frecuencia respiratoria presentó cambios respecto al estado de reposo.

Esto confirma que el habla modifica el patrón respiratorio al introducir un control voluntario sobre el proceso automático de respiración.

------

# 4. Parte B (Captura de la señal)

Este proyecto implementa un sistema de adquisición de señal respiratoria utilizando una ESP32 programada en Arduino IDE, la cual captura la variación de voltaje generada por un sensor respiratorio y envía los datos a MATLAB mediante comunicación serial.

El objetivo del script en MATLAB es:

Capturar la señal durante un tiempo definido.

- Visualizarla en tiempo real.

- Guardarla en un archivo .mat.

- Permitir análisis posterior (filtrado, FFT y cálculo de frecuencia respiratoria)

 ## Descripción General del Funcionamiento

El flujo del sistema es:

- Sensor → ESP32 (ADC 12 bits) → Arduino IDE → Serial USB → MATLAB → Archivo .mat

La ESP32 digitaliza la señal analógica del sensor respiratorio y la envía como valores numéricos por puerto serial. MATLAB recibe esos valores, los grafica en tiempo real y los almacena.

## Explicación del Código (adquisición)


###  1️. Inicialización y entrada de datos

```python
clc; 
clear;
close all;

nombre = input('Ingrese su nombre: ', 's');
Trec = input('Ingrese la duración de la muestra en segundos: ');
archivo = nombre + ".mat";

```
Este bloque limpia el entorno de MATLAB y solicita al usuario el nombre y el tiempo total de grabación.
El archivo final se guardará con el nombre ingresado, permitiendo identificar fácilmente cada adquisición.

### 2️. Configuración del sistema

```python
puerto = "COM13";
baudrate = 115200;
Fs = 50; % Hz
ventana = 10;

Ntotal = Fs * Trec;
Nvent = Fs * ventana;


```

Aquí se definen los parámetros principales del sistema:

- puerto: corresponde al puerto asignado a la ESP32.

- baudrate: debe coincidir con Serial.begin(115200) en Arduino IDE para que la comunicación sea correcta.

- Fs (frecuencia de muestreo): determina cuántas muestras por segundo se adquieren.

- ventana: cantidad de segundos visibles en tiempo real.
 
¿Por qué se eligió Fs = 50 Hz?

La respiración humana en reposo tiene una frecuencia aproximada entre 0.2 y 0.33 Hz (12–20 respiraciones por minuto), y durante el habla puede aumentar aprox de 0.5 Hz.


### 3️. Conexión con la ESP32

```python
s = serialport(puerto, baudrate);
configureTerminator(s,"LF");
flush(s);
pause(2);

```

Se configura el terminador de línea para que MATLAB pueda leer correctamente cada dato enviado desde Arduino IDE.
La pausa de 2 segundos permite que la ESP32 se estabilice después de abrir el puerto.



### 4️. Preparación de vectores y gráfica

```python
buffer = zeros(Nvent,1);
voltaje = zeros(Ntotal,1);
tiempo_total = (0:Ntotal-1)/Fs;
tiempo_vent = linspace(-ventana, 0, Nvent);

figure;
h = plot(tiempo_vent, buffer, 'LineWidth', 1.5);
ylim([0 3.3]);


```
- voltaje almacena toda la señal adquirida.

- buffer permite mostrar solo los últimos 10 segundos.

- tiempo_total genera el eje temporal completo.

- ylim([0 3.3]) corresponde al rango típico de operación del ADC de la ESP32 (0–3.3 V).


### 5️. Adquisición en tiempo real

```python
for k = 1:Ntotal
 valor = str2double(readline(s));
 if ~isnan(valor)
 voltaje(k) = valor;
 buffer = [buffer(2:end); valor];
 set(h, 'YData', buffer);
 drawnow limitrate;
 end
end


```

- Lee cada valor enviado por la ESP32.

- Lo convierte a número.

- Lo almacena en el vector completo.

- Actualiza la gráfica en tiempo real.

### 6️. Cierre y almacenamiento

```python
clear s;
save(archivo, "voltaje", "tiempo_total", "Fs");

```
Se libera el puerto serial y se guarda la señal junto con el eje temporal y la frecuencia de muestreo para análisis posterior.

## Parte B (Parte Filtrado)

Después de adquirir y almacenar la señal respiratoria desde la ESP32, es necesario procesarla para obtener información fisiológicamente relevante. La señal original puede contener ruido, artefactos de movimiento y componentes no deseadas, por lo que se aplica un filtrado digital.
Posteriormente, se utiliza la Transformada Rápida de Fourier (FFT) para transformar la señal del dominio del tiempo al dominio de la frecuencia, permitiendo identificar la frecuencia respiratoria dominante de manera automática y objetiva.


## 1. Carga de datos

```python
load("HABLANDO.mat"); 
% variables: voltaje, tiempo_total, Fs

x = voltaje; 
t = tiempo_total;
```

carga la señal previamente adquirida desde la ESP32.

- voltaje → señal respiratoria en el dominio del tiempo.

- tiempo_total → eje temporal.

- Fs → frecuencia de muestreo (50 Hz).

Aquí comienza el procesamiento de la señal almacenada


### 2. Filtrado digital (Pasa-banda 0.1–0.5 Hz)

```python
% Respiración: 0.1 a 0.5 Hz (6–30 resp/min)

f_low = 0.1; % Hz
f_high = 0.5; % Hz

[b,a] = butter(2,[f_low f_high]/(Fs/2),"bandpass");
x_filt = filtfilt(b,a,x);
```

### ¿Por qué se aplicó un filtro?

La señal original puede contener:

- Ruido eléctrico.

- Movimiento corporal, etc

Por ello se utiliza un filtro pasa-banda para conservar únicamente el rango fisiológico de interés.

### ¿Por qué 0.1–0.5 Hz?

La frecuencia respiratoria humana normal se encuentra aproximadamente entre:

- 6 respiraciones/min → 0.1 Hz

- 30 respiraciones/min → 0.5 Hz

 Por tanto, este rango:

- Elimina componentes demasiado lentas (por ejemplo movimiento).

- Elimina componentes (ruido, vibraciones, artefactos).

###  ¿Por qué Butterworth de orden 2?


El filtro Butterworth se eligió porque:

- Tiene respuesta suave y sin ondulaciones.

- No distorsiona significativamente la amplitud.

- Es adecuado para señales biomédicas.

### El orden 2 es suficiente porque:

- La respiración es una señal simple y lenta.

- No se requiere una pendiente  brusca.


## 3️. Visualización en el dominio del tiempo

```python
plot(t,x,'Color',[0.6 0.6 0.6]); hold on;
plot(t,x_filt,'b','LineWidth',1.5);
```
Aquí se comparan:

- Señal original 

- Señal filtrada 

Esto permite observar cómo el filtrado mejora la claridad del patrón respiratorio y facilita la identificación de ciclos.


## 4. Transformada Rápida de Fourier (FFT)


```python
N = length(x_filt);
X = fft(x_filt);
f = (0:N-1)*(Fs/N);

mag = abs(X)/N;
```
La señal respiratoria inicialmente está en el dominio del tiempo.
La FFT permite convertirla al dominio de la frecuencia para identificar qué frecuencias la componen.

El objetivo principal es encontrar la frecuencia dominante, que corresponde a la frecuencia respiratoria.

- La respiración ocurre por debajo de 1 Hz.

- Frecuencias mayores no son fisiológicamente relevantes en este contexto.


## 5. Cálculo de la frecuencia respiratoria dominante


```python
[~,idx] = max(mag);
f_resp = f(idx);
resp_min = f_resp * 60;
```

- Identifica el pico máximo del espectro.

- Se obtiene la frecuencia correspondiente.

- Se convierte a respiraciones por minuto multiplicando por 60 la frecuencia dominante.


### Justificación

El filtrado pasa-banda 0.1–0.5 Hz permite aislar la componente fisiológica respiratoria eliminando ruido y artefactos. Posteriormente, la Transformada Rápida de Fourier permite identificar la frecuencia dominante de la señal, facilitando el cálculo automático de la frecuencia respiratoria.

Este procedimiento mejora la precisión del análisis y permite evaluar objetivamente las diferencias entre condiciones como reposo y verbalización.

---------

# 4. ANALISIS DE RESULTADOS

 A partir de la señal optenedida con el sensor FSR402 y el procesamiento realizado en MATLAB se logro observar y diferenciar el comportamiento de la respiración en condiciones normales de reposo la cual tubo un comportamiento muy similar a una senoidal y la respiración durante el habla la cual se lograba ver como el proceso de espiración era mas prolongado que el de la inspiración debido a que son más cortos los tiempos donde se toma aire ,como se puede observar en las siguientes graficas:
<p align="center">
<img width="400" height="300" alt="image" src="https://github.com/user-attachments/assets/b10e1563-db33-41af-8051-fd62da4380df" />
<p align="center">
  Fig 4. Respiración normal Filtrada
</p>

<p align="center">
<img width="400" height="300" alt="image" src="https://github.com/user-attachments/assets/4d96f82e-8419-41d1-848d-3a0ddbc363e1" />
</p>
<p align="center">
  Fig 5. Respiración durante el habla
</p>
En base de las anteriores graficas las pasamos el dominio de FFT donde obtuvimos en cada grafica una frecuencia domoniante la cual utlizamos en para hallar las frecuencia respiratoria,como se puede observar en ambas graficas sus frecuencias dominates estan en el rango de (0.2-0.26).Cuyo resultados estan dentro del rango aceptable para un adulto sano entre los (12-20 rpm).

- FR reposo=12rpm
- FR hablando=12rpm
  
Estos son resultados coherentes con los valores fisiológicos normales de una persona adulta en estado de reposo. Aunque la frecuencia respiratoria obtenida es similar en ambas condiciones, se evidencia que la principal diferencia no se encuentra en la cantidad de respiraciones por minuto sino en la forma del ciclo respiratorio. Durante el habla se observa mayor irregularidad en la señal, así como una espiración más controlada y prolongada, lo cual genera pequeñas variaciones en la distribución de energía del espectro de frecuencias.

<p align="center">
<img width="400" height="300" alt="image" src="https://github.com/user-attachments/assets/74dd6e63-7711-4ec9-9a94-93539587945f"
 />
</p>
<p align="center">
  Fig 6. Respiracion Normal en el Dominio FFT
</p>
<p align="center">
<img width="400" height="300" alt="image" src="https://github.com/user-attachments/assets/3172f1ee-04a5-41b9-a43c-47cd5bc5c844"
 />
</p>
<p align="center">
  Fig 7. Respiracion Hablando en el Dominio FFT
</p>
Además, se mostró que la correcta colocación del sensor FSR402 en la región torácica fue un factor clave para la calidad de la señal obtenida. Una ubicación adecuada permitió captar con mayor claridad las variaciones mecánicas de expansión y contracción del tórax. Esto redujo el ruido por movimiento y mejoró la precisión en la estimación de la frecuencia respiratoria y del patrón respiratorio general.

# 5. CONCLUSIONES
- Se evaluó la correcta influencia del habla en el patrón respiratorio.
- Aunque la frecuencia respiratoria promedio se mantiene dentro de valores normales, la forma de la señal cambia.
- Se observan espiraciones más largas y mayor irregularidad mientras las persona esta hablando.
- También se identificaron las variables físicas que afectan el proceso respiratorio, especialmente la variación de presión mecánica y la expansión del tórax.
- Estas pudieron medirse de manera indirecta con el sensor FSR402.
- Finalmente, se creó un sistema funcional para adquirir y procesar señales con ESP32 y MATLAB,este sistema puede extraer tanto el patrón como la frecuencia respiratoria y identificar claramente las diferencias entre la respiración en reposo y durante el habla.


# 7. BIBLIOGRAFIAS

- Biomedical Engineering Fundamentals | Joseph D. Bronzino | Taylor & Fr. (2006, April 14). Taylor & Francis. https://www.taylorfrancis.com/books/edit/10.1201/9781420003857/biomedical-engineering-fundamentals-joseph-bronzino
- Fieselmann, J. F., Hendryx, M. S., Helms, C. M., & Wakefield, D. S. (1993). Respiratory rate predicts cardiopulmonary arrest for internal medicine inpatients. Journal of General Internal Medicine, 8(7), 354–360. https://doi.org/10.1007/bf02600071
- Subbe, C. P., Davies, R. G., Williams, E., Rutherford, P., & Gemmell, L. (2003). Effect of introducing the Modified Early Warning score on clinical outcomes, cardio‐pulmonary arrests and intensive care utilisation in acute medical admissions*. Anaesthesia, 58(8), 797–802. https://doi.org/10.1046/j.1365-2044.2003.03258.x
- Goldhill, D. R., McNarry, A. F., Mandersloot, G., & McGinley, A. (2005). A physiologically‐based early warning score for ward patients: the association between score and outcome*. Anaesthesia, 60(6), 547–553. https://doi.org/10.1111/j.1365-2044.2005.04186.x
- Chourpiliadis, C., & Bhardwaj, A. (2022, September 12). Physiology, respiratory rate. https://www.ncbi.nlm.nih.gov/books/NBK537306/
- Cretikos, M., Chen, J., Hillman, K., Bellomo, R., Finfer, S., & Flabouris, A. (2007). The objective medical emergency team activation criteria: A case–control study. Resuscitation, 73(1), 62–72. https://doi.org/10.1016/j.resuscitation.2006.08.020






