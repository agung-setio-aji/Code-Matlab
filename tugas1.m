clc;
clear;
close all;

x(1) = 1.5;          
epsilon = 0.0001;     

x(2) = sqrt(2*x(1) + log(x(1)));  
galat = abs(x(2) - x(1)); 
i = 2; 

fprintf('|   i   |    x_i      |    galat      |\n');
fprintf('|  %2d   |   %7f  |   %7f   |\n', i-1, x(1), galat);

while galat >= epsilon
    x(i+1) = sqrt(2*x(i) + log(x(i))); 
    galat = abs(x(i+1) - x(i));
    i = i + 1; 
    
    fprintf('|  %2d   |   %7f  |   %7f   |\n', i, x(i), galat);
end

jumIterasi = i - 1;  
akar = x(i);  
disp(['Setelah ', num2str(jumIterasi), ...
    ' iterasi, diperoleh akar/penyelesaian yaitu x = ', num2str(akar), ...
    ' dengan error = ', num2str(galat)]);