clc;
clear;
close all;

tmax = 1000; h = 0.01;
n = tmax / h;
time = 0:h:tmax;

a = 3.0;  % laju Pertumbuhan intrinsik prey
b = 0.01;  % laju Pemangsaan
m = 0,01 % laju kematian alami predator
c = 0.1;  % laju konversi pemangsaaan prey menjadi biomassa predator

%nilai awal
x(1) = 100;  % individual/hektar
y(1) = 20;  % individual/hektar


for i = 2:(n + 1)
    x(i) = x(i - 1) + h * (a - c * x(i - 1) - b * x(i - 1) * y(i - 1));
    y(i) = y(i - 1) + h * (b * x(i - 1) * y(i - 1) - c * y(i - 1) - m * y(i - 1));
   
end

figure(1)
plot(time, x, 'm.:');
hold on;
plot(time, y, 'b.:');
hold on;
grid on;

xlabel('waktu');
ylabel('Kepadatan Populasi')
legend('Prey', 'Predator');


figure(2)
plot(time, x, 'm.:');
hold on;
grid on;

xlabel('waktu');
ylabel('kepadataan populasi Prey');

figure(3)
plot(time, y, 'b.:');
hold on;
grid on;

xlabel('waktu');
ylabel('kepadataan populasi Predator');
