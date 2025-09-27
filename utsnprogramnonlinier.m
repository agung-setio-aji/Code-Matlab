clc;
clear;
close all;

% Definisikan parameter iterasi
tol = 0.000001;   % Toleransi error
max_iter = 100;   % Batas maksimum iterasi

% Tebakan awal (x0, y0, z0)
x_old = 2;
y_old = 1;
z_old = 5;

% Iterasi metode titik tetap
for k = 1:max_iter
    % Fungsi iterasi titik tetap
    x_new = 2 * log(x_old) + 2;      % Dari persamaan 1: x = 2*ln(x) + 2
    y_new = sqrt(6 - 2*x_old);       % Dari persamaan 2: y = sqrt(6 - 2x)
    z_new = 8 - x_old - y_old;        % Dari persamaan 3: z = 8 - x - y
    
    % Update nilai y dengan rata-rata dari dua hasil (untuk konsistensi)
    y_new = (x_new + y_new) / 2;
    
    % Cek konvergensi
    err_x = abs(x_new - x_old); % Sebenarnya tidak ada perubahan pada x
    err_y = abs(y_new - y_old);
    err_z = abs(z_new - z_old);
    
    if err_x < tol && err_y < tol && err_z < tol
        fprintf('Konvergen setelah %d iterasi.\n', k);
        fprintf('Solusi: x = %.6f, y = %.6f, z = %.6f\n', x_old, y_new, z_new);
        break;
    end
    
    % Update nilai untuk iterasi selanjutnya
    x_old = x_new; % update pada x
    y_old = y_new;
    z_old = z_new;
end

% Jika belum konvergen setelah batas iterasi maksimum
if k == max_iter
    disp('Metode iterasi tidak konvergen.');
end
