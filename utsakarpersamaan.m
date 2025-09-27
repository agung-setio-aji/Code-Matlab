clc;
clear;
close all;

% Inisialisasi nilai awal dan toleransi
x(1) = 2.3;               % Nilai awal tebakan
epsilon = 0.0001;         % Toleransi galat

% Iterasi pertama
x(2) = sqrt(2*x(1) + log(x(1)));  
galat = abs(x(2) - x(1)); 
i = 2; 

% Tampilkan header tabel
fprintf('|   i   |    x_i      |    galat      |\n');
fprintf('|  %2d   |   %7f  |   %7f   |\n', i-1, x(1), galat);

% Looping iterasi sampai galat < epsilon
while galat >= epsilon
    x(i+1) = sqrt(2*x(i) + log(x(i))); 
    galat = abs(x(i+1) - x(i));
    i = i + 1; 
    
    % Tampilkan nilai setiap iterasi
    fprintf('|  %2d   |   %7f  |   %7f   |\n', i-1, x(i-1), galat);
end

% Tampilkan hasil akhir
jumIterasi = i - 1;  
akar = x(i);  
disp(['Setelah ', num2str(jumIterasi), ...
    ' iterasi, diperoleh akar/penyelesaian yaitu x = ', num2str(akar), ...
    ' dengan error = ', num2str(galat)]);
