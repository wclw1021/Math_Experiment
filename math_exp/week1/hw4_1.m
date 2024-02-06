N = 8000;
n_values = (1:N);
y_values = zeros(1, N);

% 循环计算an的值
for n = n_values
    y_values(n) = sin(n);
end

% 作图
figure;
plot(n_values, y_values, ".");
xlabel('n');
ylabel('sin(n)');

% 限制在区间上的作图
a = -0.8;
b = 0.3;

% 初始化存储满足条件的点的数组
filtered_n_values = [];
filtered_y_values = [];

% 筛选出满足条件的点
for i = 1:N
    if y_values(i) >= a && y_values(i) <= b
        filtered_n_values(end+1) = n_values(i);
        filtered_y_values(end+1) = y_values(i);
    end
end

% 绘制满足条件的点
figure;
plot(filtered_n_values, filtered_y_values, '.');
xlabel('n');
ylabel('sin(n)');

