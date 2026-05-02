function raiz = metodo_biseccion(funcion, a, b, tolerancia, max_iter)
    % Función para encontrar una raíz de la función 'funcion' en el intervalo [a, b]
    % utilizando el método de la bisección.

    % Verificar si la función cambia de signo en el intervalo dado
    if sign(funcion(a)) == sign(funcion(b))
        error("La función no cambia de signo en el intervalo dado.");
    end

    % Inicializar los valores de iteración
    iter = 0;
    raiz = 0;

    % Iterar hasta alcanzar la tolerancia o el número máximo de iteraciones
    while (b - a) / 2 > tolerancia && iter < max_iter
        % Calcular el punto medio
        c = (a + b) / 2

        % Verificar si c es una raíz exacta
        if funcion(c) == 0
            raiz = c;
            break;
        end

        % Actualizar los límites del intervalo
        if sign(funcion(c)) == sign(funcion(a))
            a = c;
        else
            b = c;
        end

        % Incrementar el contador de iteraciones
        iter = iter + 1;
    end

    % Mostrar un mensaje de error si no se encontró la raíz en el número máximo de iteraciones
    if iter == max_iter
        error("El método de la bisección no convergió después de %d iteraciones.", max_iter);
    end

    % Mostrar el número de iteraciones necesarias para converger
    fprintf("Número de iteraciones: %d\n", iter);
end

% Ejemplo de uso
f = @(x) x^3 - 2*x - 5;  % Definir la función
a = 1;  % Límite inferior del intervalo
b = 3;  % Límite superior del intervalo
tolerancia = 1e-6;  % Tolerancia deseada
max_iter = 100;  % Número máximo de iteraciones

raiz = metodo_biseccion(f, a, b, tolerancia, max_iter);
fprintf("Raíz aproximada: %f\n", raiz);

