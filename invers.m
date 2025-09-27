clc;
clear;
close all;

fprintf('Metode Invers untuk Menyelesaikan Sistem Persamaan \n\n');

% Matriks koefisien A
A = [4 2 3;
     2 2 1;
     1 1 3];

% Vektor konstanta B (dalam rupiah)
B = [295000;
     165000;
     145000];

% Cek apakah matriks A dapat dibalik (harus memiliki determinan bukan nol)
if det(A) == 0
    error('Matriks A tidak memiliki invers, solusi tidak dapat ditemukan.');
end

% Hitung invers dari matriks A
inv = inv(A);

% Hitung solusi X = A^(-1) * B
X = inv * B;

% Tampilkan hasil
fprintf('Harga sewa per hari untuk mobil tipe A, B, dan C adalah:\n');
fprintf('Tipe A: Rp%.2f\n', X(1));
fprintf('Tipe B: Rp%.2f\n', X(2));
fprintf('Tipe C: Rp%.2f\n', X(3));
