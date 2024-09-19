clear all; close all; clc

% Original tanh function
f = @(x) (exp(x) - exp(-x)) ./ (exp(x) + exp(-x)); 

dx = 0.01;
x = linspace(-5, 5, 200);

% Approximated tanh function from HDL model
for k = 1:length(x)
    y(k) = tanh_pw_HDL(x(k));  % Your approximated tanh function
end

% Plot approximated tanh function
plot(x, y, 'LineWidth', 2);
grid on;
hold on;

% Plot original tanh function
ya = f(x);
plot(x, ya, 'LineWidth', 2);

% Set plot limits, labels, title, and legend
ylim([-1.1 1.1])
xlabel('x')
ylabel('y')
title('Tanh Function: Original vs Approximation')
legend('Approximated Tanh (HDL)', 'Original Tanh')

