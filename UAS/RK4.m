function RK4 = RK4(h, a, b, m, c, x, y)
    % Kemiringan menengah
    K11 = F1(a, b, x, y);
    K12 = F2(m, c, x, y);
    K21 = F1(a, b, x + h*K11/2, y + h*K12/2);
    K22 = F2(m, c, x + h*K11/2, y + h*K12/2);
    K31 = F1(a, b, x + h*K21/2, y + h*K22/2);
    K32 = F2(m, c, x + h*K21/2, y + h*K22/2);
    K41 = F1(a, b, x + h*K31, y + h*K32);
    K42 = F2(m, c, x + h*K31, y + h*K32);

    % Perbarui x dan y
    x = x + h*(K11 + 2*K21 + 2*K31 + K41)/6;
    y = y + h*(K12 + 2*K22 + 2*K32 + K42)/6;

    RK4 = [x, y];
