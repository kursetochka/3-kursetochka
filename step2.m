% начинаем считывать с 1 строки 0 столбца
% результат csvread - матрица вида (k, x(k))

data = csvread("C:/Users/User/Downloads/res.csv", 1, 0);
k = data(:, 1);
x = data(:, 2);
average = sum(x) / length(x);
graphics_toolkit('gnuplot');
plot(k, x, "DisplayName", "x(k)");
hold on;
plot(k, average * ones(size(k)), "r", "DisplayName", "average"); % r - red
xlabel("k");
ylabel("x(k)");
legend();
grid on;

% -dpng сохраняет график как png
% -S900,600 устанавливает размеры графика (900 x 600 px)

print("C:/Users/User/Downloads/result.png", "-dpng", '-S900,600');
hold off;
