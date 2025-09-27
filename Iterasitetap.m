clc;
clear all;
close all;
x(1) = -1;               % Initial guess
epsilon = 0.0001;         % Tolerance for stopping criterion
x(2) = -sqrt(exp(x(1)));  % Update rule for x
galat = abs(x(2) - x(1)); % Error (difference between two iterations)
i = 2;

% Display table header
fprintf('|\tIter\t|\tx(i)\t|\tError\t|\n');
fprintf('|\t%2d\t|\t%5.4f\t|\t%5.4f\t|\n', i-1, x(i), galat);

% Iterate until the error is less than the tolerance
while galat >= epsilon
    x(i+1) = -sqrt(exp(x(i)));  % Update x(i+1)
    galat = abs(x(i+1) - x(i)); % Calculate the new error
    i = i + 1;
    
    % Display iteration result
    fprintf('|\t%2d\t|\t%5.4f\t|\t%5.4f\t|\n', i-1, x(i), galat);
end

jumIterasi = i - 1;           % Total iterations
akar = x(i);                  % Root approximation
disp(['Setelah ', num2str(jumIterasi), ' iterasi, diperoleh akar/penyelesaian yaitu x = ', num2str(akar), ' dengan error = ', num2str(galat)]);
