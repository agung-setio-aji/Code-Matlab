clc;
clear;
close all;


x = -3:0.01:3;   
f = x.^3 + 6*x - 3;


plot(x, f, 'b', 'linewidth', 2);  
hold on;
grid on;
xlabel('x');
ylabel('f(x)');
yline(0, 'k--'); 
fungsi = @(x) x.^3 + 6*x - 3;
akar1 = fzero(fungsi, 0);   
akar2 = fzero(fungsi, -2);
plot(akar1, 0, 'go', 'MarkerSize', 10, 'MarkerFaceColor', 'g'); 
plot(akar2, 0, 'go', 'MarkerSize', 10, 'MarkerFaceColor', 'g');




