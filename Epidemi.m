clc;
clear;
close all;

tmax = 1000; h = 0.01;
n = tmax / h;
time = 0:h:tmax;

A = 0.94;  % laju kelahiran konstan (dalam juta jiwa)
beta = 0.015;  % laju infeksi/penularan penyakit
alpha = 0.09;  % laju kesembuhan
mu = 0.01;  % laju kematian alami

S(1) = 100;  % juta jiwa
I(1) = 0.000002;  % juta jiwa
R(1) = 0;  % juta jiwa

for i = 2:(n + 1)
    S(i) = S(i - 1) + h * (A - mu * S(i - 1) - beta * S(i - 1) * I(i - 1));
    I(i) = I(i - 1) + h * (beta * S(i - 1) * I(i - 1) - mu * I(i - 1) - alpha * I(i - 1));
    R(i) = R(i - 1) + h * (alpha * I(i - 1) - mu * R(i - 1));
end

figure(1)
plot(time, S, 'm.:');
hold on;
plot(time, I, 'b.:');
hold on;
plot(time, R, 'r.:');
hold on;
legend('Susceptible', 'Infected', 'Recovered');


figure(2)
plot(time, S, 'm.:');
hold on;
grid on;

xlabel('waktu');
ylabel('kepadataan populasi Susceptible');

figure(3)
plot(time, I, 'b.:');
hold on;
grid on;

xlabel('waktu');
ylabel('kepadataan populasi Infected');

figure(4)
plot(time, R, 'k.:');
hold on;
grid on;

xlabel('waktu');
ylabel('kepadataan populasi Recovered');
