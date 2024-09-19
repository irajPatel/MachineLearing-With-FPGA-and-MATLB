% Clear the workspace, close all figures, and clear the command window
clear all; close all; clc;

% Set the degree of the polynomial to 1
degree = 1;

% Set the step size for the x-axis
dx = 0.1;

% Define the function f(x)
f = @(x) 1./(1 + exp(-x));

% Create a vector of x values from -5 to 5 with step size dx
x = -5:dx:5;

% Create a vector of x values from -3 to -1 with step size dx
x2 = -3:dx:-2;

% Evaluate the function f(x) for the x2 values
y2 = f(x2);

% Fit a polynomial of degree 1 to the x2 and y2 data
p2 = polyfit(x2, y2, degree);

% Create a vector of x values from -2 to 2 with step size dx
x3 = -2:dx:2;

% Evaluate the function f(x) for the x3 values
y3 = f(x3);

% Fit a polynomial of degree 1 to the x3 and y3 data
p3 = polyfit(x3, y3, degree);

% Create a vector of x values from 2 to 3 with step size dx
x4 = 2:dx:3;

% Evaluate the function f(x) for the x4 values
y4 = f(x4);

% Fit a polynomial of degree 1 to the x4 and y4 data
p4 = polyfit(x4, y4, degree);

% Evaluate the polynomials p2, p3, and p4 for the corresponding x vectors
zf2 = polyval(p2, x2);
zf3 = polyval(p3, x3);
zf4 = polyval(p4, x4);

% Create a vector of x values from 10 to -3 with step size dx
x1 = 10:dx:-3;

% Create a vector of zeros with the same length as x1
zf1 = zeros(1, length(x1));

% Create a vector of x values from 3 to 10 with step size dx
x5 = 3:dx:10;

% Create a vector of ones with the same length as x5
zf5 = ones(1, length(x5));

% Create a vector of x values from -10 to 10 with step size dx
x = -10:dx:10;

% Evaluate the function f(x) for the x values
ya = f(x);

% Plot the approximated function for x1 and zf1
plot(x1, zf1, 'LineWidth', 2);

% Hold on to the current plot
hold on ;
grid on ;

% Plot the approximated functions for x2, zf2, x3, zf3, x4, zf4, and x5, zf5
plot(x2, zf2, 'LineWidth', 2);
plot(x3, zf3, 'LineWidth', 2);
plot(x4, zf4, 'LineWidth', 2);
plot(x5, zf5, 'LineWidth', 2);


plot(x, ya, ':', 'LineWidth', 1.5); % Plot the original function as a dotted line

% Add labels, title, and legend
xlabel('x');
ylabel('y');
title('Piecewise Polynomial Approximation');
legend('Approximation 1', 'Approximation 2', 'Approximation 3', 'Approximation 4', 'Approximation 5', 'Original Function');