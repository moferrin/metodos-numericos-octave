function edoq
a = 0;          % Punto inicial
b = 14;         % Punto final
h = 0.01;       % Paso de discretización
num_points = (b - a) / h;

xspan = linspace(a, b, num_points);

y = zeros(1, num_points);
yp = zeros(1, num_points);

% Condiciones iniciales
y(1) = 1.5;
yp(1) = 2;

% Aplicando el método de diferencias finitas
for i = 1:num_points-1
    ypp = -(48/15) * yp(i) - (16/15) * y(i);
    yp(i+1) = yp(i) + h * ypp;
    y(i+1) = y(i) + h * yp(i);
end

% Graficando la solución
plot(xspan, y, 'b-', 'LineWidth', 2);
xlabel('x');
ylabel('y(x)');
title('Solución de la Ecuación Diferencial de Segundo Orden usando Diferencias Finitas');
grid on;

function ypp = differential_equations(y, yp)
    ypp = -(48/15) * yp - (16/15) * y;
endfunction

endfunction


