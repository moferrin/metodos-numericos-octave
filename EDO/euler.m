y''(x) = f(x, y, y')


% Define la ecuación diferencial: y''(x) = -y(x)
function edo = f(x, y, yp)
    edo = yp;
endfunction

% Condiciones iniciales
x0 = 0;        % Punto inicial en x
y0 = 1;        % Valor inicial de y en x0
yp0 = 0;       % Valor inicial de y' en x0

% Parámetros del método de Euler
h = 0.1;       % Tamaño del paso

% Número de puntos a calcular
num_puntos = 100;

% Inicialización de arreglos para almacenar resultados
x = zeros(num_puntos, 1);
y = zeros(num_puntos, 1);

% Método de Euler
x(1) = x0;
y(1) = y0;
yp = yp0;
for i = 2:num_puntos
    yp = yp + h * f(x(i-1), y(i-1), yp);
    y(i) = y(i-1) + h * yp;
    x(i) = x(i-1) + h;
endfor

% Graficar resultados
plot(x, y);
xlabel('x');
ylabel('y');
title('Solución de la ecuación diferencial de segundo orden');

