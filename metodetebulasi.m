clc;
clear;
close all;

% Definisikan rentang pencarian dan langkah x
x_min = 0.5;                % Nilai awal rentang pencarian
x_max = 3;                  % Nilai akhir rentang pencarian
step = 0.1;                 % Langkah interval

% Definisikan fungsi f(x)
f = @(x) log(x) + x - 3;    % Fungsi f(x) = ln(x) + x - 3

% Inisialisasi tabel
fprintf('|    x    |    f(x)   |\n');
fprintf('----------------------\n');

% Looping tabelasi
x = x_min;
found = false;  % Penanda apakah akar telah ditemukan

while x <= x_max
    fx = f(x);    % Hitung nilai f(x) pada x
    fprintf('| %6.4f | %9.4f |\n', x, fx);
    
    % Cek perubahan tanda untuk mendeteksi akar
    if x > x_min  % Lewati perhitungan pada x pertama
        % Hitung f(x) sebelumnya
        fx_prev = f(x - step);
        
        % Jika terjadi perubahan tanda
        if fx * fx_prev < 0
            fprintf('\nAkar ditemukan dalam rentang x = %.4f dan x = %.4f\n', x - step, x);
            found = true;
        end
    end
    
    % Perbarui x
    x = x + step;
end

% Jika tidak ada akar yang ditemukan
if ~found
    fprintf('\nTidak ada akar yang ditemukan dalam rentang yang diberikan.\n');
end
