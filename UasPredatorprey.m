function predator_prey_model()
    % Parameter
    r = 1;      % Laju pertumbuhan intrinsik mangsa
    K = 1;      % Kapasitas tampung lingkungan
    w = 0.3;    % Derajat efek Allee
    a = 0.6;    % Tingkat predasi
    b = 0.7;    % Konstanta dalam respon fungsional predator
    delta = 0.1;  % Tingkat kematian predator
    c = 0.4;    % Laju konversi predasi ke biomassa predator (bisa divariasikan)
    h = 0.1;    % Langkah integrasi numerik

    % Kondisi awal
    N0 = 0.8;   % Kepadatan populasi mangsa
    P0 = 0.1;   % Kepadatan populasi predator

    % Waktu simulasi
    tmax =0.5;
    t = 0:h:tmax;

    % Inisialisasi vektor solusi
    N = zeros(size(t));
    P = zeros(size(t));
    
    % Nilai awal
    N(1) = N0;
    P(1) = P0;
    
    % Integrasi numerik dengan metode Runge-Kutta orde 4
    for k = 1:length(t)-1
        [dN1, dP1] = dN_dP(N(k), P(k), r, K, h, a, b, delta, c, w);
        [dN2, dP2] = dN_dP(N(k) + 0.5*h*dN1, P(k) + 0.5*h*dP1, r, K, h, a, b, delta, c, w);
        [dN3, dP3] = dN_dP(N(k) + 0.5*h*dN2, P(k) + 0.5*h*dP2, r, K, h, a, b, delta, c, w);
        [dN4, dP4] = dN_dP(N(k) + h*dN3, P(k) + h*dP3, r, K, h, a, b, delta, c, w);

        N(k+1) = N(k) + h*(dN1 + 2*dN2 + 2*dN3 + dN4)/6;
        P(k+1) = P(k) + h*(dP1 + 2*dP2 + 2*dP3 + dP4)/6;
    end
    
    % Plot hasil
    figure;
    plot(t, N, '-b', 'DisplayName', 'Mangsa', 'LineWidth', 2);
    hold on;
    plot(t, P, '-r', 'DisplayName', 'Predator', 'LineWidth', 2);
    xlabel('Waktu');
    ylabel('Kepadatan Populasi');
    legend;
    title('Model Predator-Mangsa dengan Efek Allee dan Pertahanan Kelompok');
    grid on;
    set(gca, 'FontSize', 14); % Atur ukuran font pada grafik agar lebih jelas
end

function [dN, dP] = dN_dP(N, P, r, K, h, a, b, delta, c, w)
    % Persamaan diferensial untuk mangsa (N) dan predator (P)
    dN = r * N * (1 - N / K - h / (w + N)) - a * N * P / (b + N^2);
    dP = c * N * P / (b + N^2) - delta * P;
end
