clc;
clear;
close all;

fprintf('Metode Gauss-Jordan untuk Menyelesaikan Sistem Persamaan \n\n');

% Matriks koefisien A
A = [4 2 3;
     2 2 1;
     1 1 3];

% Vektor konstanta B (dalam rupiah)
B = [295000;
     165000;
     145000];

% Gabungkan matriks A dengan vektor B menjadi augmented matrix
Aug = [A B];

% Dapatkan ukuran matriks
[n, m] = size(Aug);

% Proses eliminasi Gauss-Jordan
for i = 1:n
    % Normalisasi baris i
    Aug(i,:) = Aug(i,:) / Aug(i,i);
    
    % Eliminasi elemen di atas dan di bawah diagonal
    for j = 1:n
        if i ~= j
            Aug(j,:) = Aug(j,:) - Aug(j,i) * Aug(i,:);
        end
    end
end

% Matriks hasil setelah Gauss-Jordan (seharusnya bentuk identitas)
disp('Matriks Augmented setelah eliminasi Gauss-Jordan:');
disp(Aug);

% Solusi (harga sewa mobil per hari untuk tipe A, B, dan C)
X = Aug(:,end);

fprintf('Harga sewa per hari untuk mobil tipe A, B, dan C adalah:\n');
fprintf('Tipe A: Rp%.2f\n', X(1));
fprintf('Tipe B: Rp%.2f\n', X(2));
fprintf('Tipe C: Rp%.2f\n', X(3));
