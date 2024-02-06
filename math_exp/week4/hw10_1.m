% 定义迭代函数
f = @(x, a) a * x * (1 - x);

% 初始化参数
a_values = 0.4:0.04:4; % 步长为0.04，从0.4到4
iterations = 100; % 迭代数
burn_in = 50; %忽略数
x_values = zeros(1, iterations - burn_in);

% 循环遍历不同的a值
for a = a_values
    x = rand();
    % 迭代
    for i = 1:iterations
        x = f(x, a);
        if i > burn_in
            x_values(i - burn_in) = x;
        end
    end
    % 绘制后50个点
    scatter(a * ones(1, iterations - burn_in), x_values, 1, 'k.');
    hold on;
end

% 设置图形属性
xlabel('a');
ylabel('x');
title('Feigenbaum Figure');
axis equal;
