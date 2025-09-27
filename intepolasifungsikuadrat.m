clear all;
close all;
clc;

% Data awal
x = [1960, 1965, 1972, 1988, 1992, 2020]; % Tahun dengan data asli
f = [179.3, 190.2, 191.8, 250.5, 260.4, 303.1]; % Jumlah penduduk (juta jiwa)
xq = 1960:1:2020; % Tahun interpolasi (rentang penuh)

% Interpolasi
fq1 = interp1(x, f, xq, 'linear'); % Interpolasi Linear
p = polyfit(x, f, 2); % Fit polinomial derajat 2 (Kuadratik)
fq2 = polyval(p, xq); % Evaluasi polinomial kuadratik
fq3 = interp1(x, f, xq, 'spline'); % Interpolasi Spline

% Plot hasil interpolasi
figure; % Membuat grafik baru
plot(x, f, 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'w'); % Data asli (lingkaran putih dengan border hitam)
hold on;
plot(xq, fq1, 'b-.', 'LineWidth', 1.5); % Garis interpolasi linear (biru putus-putus)
plot(xq, fq2, 'Color', [1, 0.5, 0], 'LineWidth', 1.5, 'LineStyle', ':'); % Interpolasi Kuadratik (oranye titik-titik)
plot(xq, fq3, 'm--', 'LineWidth', 1.5); % Garis interpolasi spline (ungu putus-putus)

% Menyesuaikan sumbu agar semua data terlihat
xlim([1960, 2020]);
ylim([160, 320]);

% Menambahkan elemen grafik
grid on;
title('Hasil Interpolasi Data Jumlah Penduduk');
xlabel('Tahun');
ylabel('Jumlah Penduduk (juta jiwa)');
legend('Data Real', 'Interpolasi Linear', 'Interpolasi Kuadratik', 'Interpolasi Spline', 'Location', 'NorthWest');
hold off;
