clear;
clear all;
clc;

% Kode MATLAB untuk Model Predator-Prey dengan Efek Allee dan Pertahanan Kelompok

% Parameter model untuk skenario 1
r1 = 1;           % Laju pertumbuhan intrinsik mangsa
K1 = 1;           % Daya dukung mangsa
a1 = 0.6;         % Tingkat pemangsaan mangsa
b1 = 0.7;         % Konstanta setengah jenuh pemangsaan
c1 = 0.1;         % Tingkat konversi pemangsaan
delta1 = 0.1;     % Tingkat kematian pemangsa
h1 = 0.2;         % Efek Allee (lemah/h > w)
w1 = 0.3;         % Ambang efek Allee

% Parameter model untuk skenario 2
r2 = 1;          % Laju pertumbuhan intrinsik mangsa
K2 = 1;            % Daya dukung mangsa
a2 = 0.6;          % Tingkat pemangsaan mangsa
b2 = 0.7;          % Konstanta setengah jenuh pemangsaan
c2 = 0.3;          % Tingkat konversi pemangsaan
delta2 = 0.1;     % Tingkat kematian pemangsa
h2 = 0.2;         % Efek Allee (lemah/h > w)
w2 = 0.3;         % Ambang efek Allee

% Parameter model untuk skenario 3
r3 = 1;          % Laju pertumbuhan intrinsik mangsa
K3 = 1;            % Daya dukung mangsa
a3 = 0.6;          % Tingkat pemangsaan mangsa
b3 = 0.7;          % Konstanta setengah jenuh pemangsaan
c3 = 0.4;          % Tingkat konversi pemangsaan
delta3 = 0.1;      % Tingkat kematian pemangsa
h3 = 0.2;          % Efek Allee (lemah/h > w)
w3 = 0.3;         % Ambang efek Allee

% Rentang waktu simulasi
tspan = [0 100];

% Kondisi awal
N0 = 0.5;  % Populasi awal mangsa
P0 = 0.2;  % Populasi awal pemangsa

% Simulasi numerik menggunakan ode45 untuk skenario 1
[t1, Y1] = ode45(@(t, y) predator_prey_allee(t, y, r1, K1, a1, b1, c1, delta1, h1, w1), tspan, [N0, P0]);

% Simulasi numerik menggunakan ode45 untuk skenario 2
[t2, Y2] = ode45(@(t, y) predator_prey_allee(t, y, r2, K2, a2, b2, c2, delta2, h2, w2), tspan, [N0, P0]);

% Simulasi numerik menggunakan ode45 untuk skenario 3
[t3, Y3] = ode45(@(t, y) predator_prey_allee(t, y, r3, K3, a3, b3, c3, delta3, h3, w3), tspan, [N0, P0]);

% Ekstraksi hasil
N1 = Y1(:, 1);
P1 = Y1(:, 2);

N2 = Y2(:, 1);
P2 = Y2(:, 2);

N3 = Y3(:, 1);
P3 = Y3(:, 2);

% Plot dinamika populasi untuk skenario 1
figure;
subplot(3, 2, 1);
plot(t1, N1, 'r-', 'LineWidth', 2); hold on;
plot(t1, P1, 'b--', 'LineWidth', 2);
xlabel('Waktu'); ylabel('Populasi');
legend('Mangsa (N)', 'Pemangsa (P)');
title('Dinamika Populasi Skenario 1');
grid on;

% Potret fase untuk skenario 1
subplot(3, 2, 2);
plot(N1, P1, 'k-', 'LineWidth', 2);
xlabel('Populasi Mangsa (N)'); ylabel('Populasi Pemangsa (P)');
title('Potret Fase Skenario 1');
grid on;

% Plot dinamika populasi untuk skenario 2
subplot(3, 2, 3);
plot(t2, N2, 'r-', 'LineWidth', 2); hold on;
plot(t2, P2, 'b--', 'LineWidth', 2);
xlabel('Waktu'); ylabel('Populasi');
legend('Mangsa (N)', 'Pemangsa (P)');
title('Dinamika Populasi Skenario 2');
grid on;

% Potret fase untuk skenario 2
subplot(3, 2, 4);
plot(N2, P2, 'k-', 'LineWidth', 2);
xlabel('Populasi Mangsa (N)'); ylabel('Populasi Pemangsa (P)');
title('Potret Fase Skenario 2');
grid on;

% Plot dinamika populasi untuk skenario 3
subplot(3, 2, 5);
plot(t3, N3, 'r-', 'LineWidth', 2); hold on;
plot(t3, P3, 'b--', 'LineWidth', 2);
xlabel('Waktu'); ylabel('Populasi');
legend('Mangsa (N)', 'Pemangsa (P)');
title('Dinamika Populasi Skenario 3');
grid on;

% Potret fase untuk skenario 3
subplot(3, 2, 6);
plot(N3, P3, 'k-', 'LineWidth', 2);
xlabel('Populasi Mangsa (N)'); ylabel('Populasi Pemangsa (P)');
title('Potret Fase Skenario 3');
grid on;

% Fungsi ODE
function dydt = predator_prey_allee(t, y, r, K, a, b, c, delta, h, w)
    N = y(1);  % Populasi mangsa
    P = y(2);  % Populasi pemangsa

    dNdt = r * N * (1 - N / K - h / (w + N)) - (a * N * P) / (b + N^2);
    dPdt = (c * N * P) / (b + N^2) - delta * P;

    dydt = [dNdt; dPdt];
end
