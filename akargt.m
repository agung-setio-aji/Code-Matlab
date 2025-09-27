clc;
clear;
close all;


x = 0.1:0.01:3;  
f = x.^2 - 2*x - log(x);

plot(x, f, 'b', 'linewidth', 2);  
hold on;
grid on;
xlabel('x');
ylabel('f(x)');
yline(0, 'k--');  

fungsi = @(x) x.^2 - 2*x - log(x);

akar = fzero(fungsi, 1.5);  

plot(akar, 0, 'go', 'MarkerSize', 10, 'MarkerFaceColor', 'g');
disp(['Akar ditemukan di x = ', num2str(akar)]);
