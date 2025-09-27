clc;
clear; 
close all; % Membersihkan command window dan workspace

% Definisikan parameter iterasi
tol = 0.000001;   % Toleransi error
max_iter = 100;   % Batas maksimum iterasi

% Tebakan awal (x0, y0)
x_old = 1;
y_old = 1;

% Iterasi metode titik tetap
for k = 1:max_iter
    % Fungsi iterasi titik tetap
    x_new = (x_old^2 - y_old + 0.5) / 2;  % x = (x^2 - y + 0.5) / 2
    y_new = sqrt((4 - x_old^2) / 4);      % y = akar((4 - x^2) / 4)
    
    % Cek konvergensi (berdasarkan perbedaan dengan iterasi sebelumnya)
    err_x = abs(x_new - x_old);
    err_y = abs(y_new - y_old);
    
    if err_x < tol && err_y < tol
        fprintf('Konvergen setelah %d iterasi.\n', k);
        fprintf('Solusi: x = %.6f, y = %.6f\n', x_new, y_new);
        break;
    end
    
    % Update nilai untuk iterasi selanjutnya
    x_old = x_new;
    y_old = y_new;
end

% Jika belum konvergen setelah batas iterasi maksimum
if k == max_iter
    disp('Metode iterasi tidak konvergen.');
end
