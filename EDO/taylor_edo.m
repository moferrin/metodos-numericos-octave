function y = finite_difference_method()
    T = 10;         % End time
    h = 0.01;       % Step size
    N = T / h;      % Number of steps
    y = zeros(N, 1); % Initialize y

    % Initial conditions
    y(1) = 1.5;
    y_prime = 2;

    % Step through time
    for i = 2:N
        y(i) = y(i-1) + h * y_prime + (h^2/2) * (-(48/15) * y_prime - (16/15) * y(i-1));
        y_prime = y_prime + h * (-(48/15) * y_prime - (16/15) * y(i-1));
    end

    % Plot the results
    t = 0:h:T-h;
    plot(t, y);
    xlabel('Time');
    ylabel('y(t)');
    title('Numerical Solution of y'' + (48/15)y'' + (16/15)y = 0');
end

