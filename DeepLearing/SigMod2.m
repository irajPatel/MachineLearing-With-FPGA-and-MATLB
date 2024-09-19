clear all; close all; clc

dx = 0.01;
x = -5:dx:5;
f = @(x) 1./(1 + exp(-x));  % Sigmoid function

% Approximated sigmoid function from HDL model
for k = 1:length(x)
    y(k) = sig_pw_HDL(x(k));  % Your approximated sigmoid function
end

% Plot approximated sigmoid function
plot(x, y, 'LineWidth', 2)
grid on
hold on

% Plot actual sigmoid function
ya = f(x);
plot(x, ya, 'LineWidth', 2)

% Set plot limits, labels, title, and legend
ylim([-0.1 1.1])
xlabel('x')
ylabel('y')
title('Sigmoid Function: Original vs Approximation')
legend('Approximated Sigmoid (HDL)', 'Original Sigmoid')

