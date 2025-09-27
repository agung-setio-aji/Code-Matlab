clc;
clear;

% Definisikan fungsi
fungsi = @(x) log(x) + x - 3;

% Tentukan tebakan awal untuk mencari akar
x_awal = 1.5;

% Cari akar menggunakan fzero
akar = fzero(fungsi, x_awal);

% Tampilkan hasil
disp(['Akar persamaan ln(x) + x - 3 = 0 adalah x = ', num2str(akar)]);
