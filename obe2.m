clc; 
clear; 
close all;

fprintf('Metode Eliminasi Gauss \n\n');

% Definisikan matriks koefisien A dan vektor konstanta B
A = [2 1 3 0 4;
     1 2 3 3 0;
     1 1 0 3 2;
     1 1 1 1 2;
     1 2 0 1 2];

B = [10; 13; 10; 7; 7];

% Panjang vektor B (jumlah variabel)
n = length(B);

% Inisialisasi vektor solusi X
X = zeros(n,1);

% Proses Eliminasi Maju (Forward Elimination)
for k = 1:n-1
    for i = k+1:n
        % Hitung faktor pengali untuk eliminasi
        factor = A(i,k) / A(k,k);
        
        % Operasi pada matriks A
        for j = k:n
            A(i,j) = A(i,j) - factor * A(k,j);
        end
        
        % Operasi pada vektor B
        B(i) = B(i) - factor * B(k);
    end
end

% Tampilkan matriks A setelah eliminasi
fprintf('Matriks A setelah eliminasi maju:\n');
disp(A);

% Tampilkan vektor B setelah eliminasi
fprintf('Vektor B setelah eliminasi maju:\n');
disp(B);

% Substitusi Mundur (Back Substitution)
X(n) = B(n) / A(n,n); % Solusi untuk variabel terakhir

for k = n-1:-1:1
    sum = 0;
    
    % Hitung jumlah untuk elemen yang sudah diketahui
    for j = k+1:n
        sum = sum + A(k,j) * X(j);
    end
    
    % Hitung solusi untuk elemen ke-k
    X(k) = (B(k) - sum) / A(k,k);
end

% Tampilkan hasil solusi
fprintf('Solusi dari sistem persamaan adalah:\n');
disp(X);
