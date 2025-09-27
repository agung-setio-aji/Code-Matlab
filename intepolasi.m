clear all;
close all;
clc;

% Data awal
x = [1960, 1965, 1972, 1988, 1992, 2020]; % Tahun dengan data asli
f = [179.3, 190.2, 191.8, 250.5, 260.4, 303.1]; % Jumlah penduduk (juta jiwa)
xq = 1960:1:2020; % Tahun interpolasi (rentang penuh)

% Interpolasi
fq1 = interp1(x, f, xq, 'linear'); % Interpolasi Linear
fq3 = interp1(x, f, xq, 'spline'); % Interpolasi Spline

n = length(xq);

% Tampilkan hasil interpolasi linear
disp("Data Jumlah Penduduk Menggunakan Interpolasi Linear");
disp("Tahun" + "    " + "Jumlah Penduduk (juta jiwa)");
for i = 1:n
    disp(xq(i) + "     " + fq1(i));
end

% Plot hasil interpolasi
figure; % Membuat grafik baru
plot(x, f, 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'r'); % Data asli dengan titik merah
hold on;
plot(xq, fq1, 'b-', 'LineWidth', 1.5); % Garis interpolasi linear biru
plot(xq, fq3, 'g--', 'LineWidth', 1.5); % Garis interpolasi spline hijau

% Menyesuaikan sumbu agar semua data terlihat
xlim([min(xq), max(xq)]);
ylim([min([f, fq1, fq3]), max([f, fq1, fq3]) + 10]); % Ditambah margin agar terlihat jelas

% Menambahkan elemen grafik
grid on;
title('Hasil Interpolasi Data Jumlah Penduduk');
xlabel('Tahun');
ylabel('Jumlah Penduduk (juta jiwa)');
legend('Data Asli', 'Interpolasi Linear', 'Interpolasi Spline', 'Location', 'NorthWest');
hold off;
