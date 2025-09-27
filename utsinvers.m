clc;
clear;
close all;

fprintf('Metode Invers untuk Menyelesaikan Sistem Persamaan \n\n');

% Matriks koefisien A
A = [3 2 1;
     1 4 2;
     2 1 3];

% Vektor konstanta B (dalam rupiah)
B = [215000;
     180000;
     170000];

% Cek apakah matriks A dapat dibalik (harus memiliki determinan bukan nol)
if det(A) == 0
    error('Matriks A tidak memiliki invers, solusi tidak dapat ditemukan.');
end

% Hitung invers dari matriks A
inv = inv(A);

% Hitung solusi X = A^(-1) * B
X = inv * B;

% Tampilkan hasil
fprintf('Harga per Kg anggur, Mangga, dan Jeruk adalah:\n');
fprintf('Anggur : Rp%.2f\n', X(1));
fprintf('Jeruk  : Rp%.2f\n', X(2));
fprintf('Mangga : Rp%.2f\n', X(3));
