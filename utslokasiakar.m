clc;
clear;
close all;

% Definisikan rentang x dan fungsi f(x) dan g(x)
x = 0.5:0.01:3;                 % Rentang x
f = log(x) + x - 3;             % Fungsi f(x) = ln(x) + x - 3
g = zeros(size(x));             % Fungsi g(x) = 0

% Plot kedua grafik
plot(x, f, 'b', 'linewidth', 2);  
hold on;
plot(x, g, 'r--', 'linewidth', 2);  % Garis g(x) = 0 sebagai referensi
grid on;

% Label dan judul grafik
xlabel('x');
ylabel('Nilai Fungsi');
title('Grafik Ganda: f(x) = ln(x) + x - 3 dan g(x) = 0');
yline(0, 'k--');                  % Garis y=0 untuk referensi

% Definisikan fungsi untuk mencari akar dengan fzero
fungsi = @(x) log(x) + x - 3;

% Cari akar dekat tebakan tertentu
akar = fzero(fungsi, 1.5);       % Akar di sekitar x = 1

% Tandai akar di grafik
plot(akar, 0, 'go', 'MarkerSize', 10, 'MarkerFaceColor', 'g'); 

% Tambahkan legenda
legend('f(x) = ln(x) + x - 3', 'g(x) = 0', 'Akar f(x) = g(x)', 'Location', 'best');
hold off;
