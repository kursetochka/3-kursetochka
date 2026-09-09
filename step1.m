coeff = csvread("C:/Users/User/Downloads/coeff.csv"); %csvread превращает числа из csv файла (1 строка) в список
function res = x(k, coeff)

  % persistent говорит что между вызывами функции значение переменной сохраняется
  % NaN создает матрицу 1 x 101 заполненную значениями NaN
  % значение NaN - Not a Number

  persistent cache = NaN(1, 101);
  if k < 0
    res = 0;
  elseif k == 0
    res = 1;
    cache(1) = res;

    % ! - логическое НЕ
    % isnan - проверяет является ли переданное значение NaN

  elseif !isnan(cache(k + 1))
    res = cache(k + 1);
  else
    res = 0;
    for j = 1:length(coeff)
        res = res + coeff(j) * x(k - j, coeff);
    endfor
    cache(k + 1) = res;
  endif
endfunction
f = fopen("C:/Users/User/Downloads/res.csv", "w");
fprintf(f, "k,x(k)\n");
for k = 0:100

  % %d - целое число
  % %f - вещественное число
  % %.nf - вещественное число с n знаков после запятой
  % соответствие устанавливается через запятую: %d = k, %0.f = x

  fprintf(f, "%d,%.0f\n", k, x(k, coeff));
endfor
fclose(f);
