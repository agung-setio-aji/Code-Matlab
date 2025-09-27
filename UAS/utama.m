tmax = 1000;
h = 0.01;
n = tmax / h;
time = 0:h:tmax;
a = 0.8; % laju pertumbuhan intrinsik prey
b = 0.3; % laju pemangsaan
m = 0.01; % laju kematian alami predator
c = 0.1; % laju konversi pemangsaan prey menjadi biomassa predator

% nilai awal
X(1) = 100; % individu/hektar
Y(1) = 20; % individu/hektar

for j = 1:n
    x = X(j);
    y = Y(j);
    hasil_RK = RK4(h, a, b, m, c, x, y);
    X(j + 1) = hasil_RK(1);
    Y(j + 1) = hasil_RK(2);
end

figure(1)
plot(time, X, 'm.:');
hold on;
plot(time, Y, 'b.:');
hold on;
grid on;

xlabel('waktu');
ylabel('Kepadatan Populasi')
legend('Prey', 'Predator');


figure(2)
plot(time, X, 'm.:');
hold on;
grid on;

xlabel('waktu');
ylabel('kepadataan populasi Prey');

figure(3)
plot(time, Y, 'b.:');
hold on;
grid on;

xlabel('waktu');
ylabel('kepadataan populasi Predator');
