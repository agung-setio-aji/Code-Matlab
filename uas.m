clc;
clear;
close all;

tmax = 1000; h = 0.01;
n = tmax / h;
time = 0:h:tmax;

% Definisi set parameter
% "r" = laju pertumbuhan intrinsik mangsa 
% "a" = laju pemangsaan
% "b" = kejenuhan predator menangkap mangsa
% "delta" = laju kematian predator
% "h" = tingkat keparahan efek Allee/kesulitan bereproduksi bagi kelompok kecil
% "w" = ukuran popolasi dengan setengah kebugaran
% "K" = kapasitas penyangga mangsa
parameter = [
    struct('r', 0.05, 'a', 0.6, 'b', 0.01, 'delta', 0.005, 'h', 0.01, 'w', 0.01, 'K', 100),
    struct('r', 0.05, 'a', 0.8, 'b', 0.1, 'delta', 0.04, 'h', 0.02, 'w', 0.02, 'K', 100),
    struct('r', 0.005, 'a', 0.9, 'b', 0.2, 'delta', 0.004, 'h', 0.2, 'w', 0.02, 'K', 100)
];

% Inisialisasi array untuk menyimpan hasil
results_x = zeros(3, n + 1);
results_y = zeros(3, n + 1);

% Jalankan simulasi untuk setiap set parameter
for j = 1:3
    r = parameter(j).r;
    a = parameter(j).a;
    b = parameter(j).b;
    delta = parameter(j).delta;
    h = parameter(j).h;
    w = parameter(j).w;
    K = parameter(j).K;

    % Nilai awal
    x(1) = 50;
    y(1) = 20;

    for i = 2:(n + 1)
        % Persamaan model
        P = r * x(i - 1) * (1 - x(i - 1) / K - h / (w + x(i - 1))) - (a * x(i - 1) * y(i - 1)) / (b + x(i - 1)^2);
        Q = (a * x(i - 1) * y(i - 1)) / (b + x(i - 1)^2) - delta * y(i - 1);

        % Perbarui nilai
        x(i) = max(x(i - 1) + h * P, 0);
        y(i) = max(y(i - 1) + h * Q, 0);
    end

    % Simpan hasil
    results_x(j, :) = x;
    results_y(j, :) = y;
end

figure;
tiledlayout(3, 1)

% Plot hasil untuk setiap set parameter
for j = 1:3
    nexttile
    plot(time, results_x(j, :), 'm-', 'LineWidth', 1, 'Marker', 'o', 'MarkerSize', 2);
    hold on;
    plot(time, results_y(j, :), 'b--', 'LineWidth', 1, 'Marker', 'x', 'MarkerSize', 2);
    grid on;

    title(['Dinamika Populasi Set ' num2str(j)], 'FontSize', 12);
    xlabel('Waktu', 'FontSize', 8);
    ylabel('Kepadatan Populasi', 'FontSize', 8);
    legend({'Prey', 'Predator'}, 'FontSize', 8);
end

sgtitle('Perbandingan Dinamika Populasi Predator dan Mangsa (3 Set Parameter)', 'FontSize', 12);
