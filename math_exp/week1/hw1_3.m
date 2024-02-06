m_values = [3, 4, 5, 6];

for m = m_values 
    n = 10^m;
    Sigma_n = sum(1./(n:2*n-1));
    sigma_n = sum(1./(n+1:2*n));
    average = (sigma_n + Sigma_n)/2;
    fprintf('对于 m = %d，大和为 %f，小和为 %f，平均值为 %f。\n', m, Sigma_n, sigma_n, average)
end

a = 1; % 下限
b = 2; % 上限

integral_result = integral(@(x) 1./x, a, b);

fprintf('积分结果为 %f\n', integral_result);

S = @(x) integral(@(t) 1./t, 1, x);

x_values = linspace(0.1, 10, 100);
S_values = arrayfun(S, x_values);

% 绘制图像
plot(x_values, S_values, 'LineWidth', 2);
xlabel('x');
ylabel('S(x)');
title('函数 S(x) = \int_{1}^{x} (1/t) dt 的图像');
grid on;

S_prime = @(x) 1/x;
x0 = 1.5; 
tolerance = 1e-6;
max_iterations = 100;

iteration = 0;
x_current = x0;

while abs(S(x_current)) > tolerance && iteration < max_iterations
    x_next = x_current - S(x_current) / S_prime(x_current);
    iteration = iteration + 1;
    x_current = x_next;
end

if iteration < max_iterations
    fprintf('零点近似值为: %f\n', x_current);
else
    fprintf('迭代未收敛到指定的精度。\n');
end

S = @(x) integral(@(t) 1./t, 1, x);
x_values = linspace(0.1, 10, 1000);

S_values = arrayfun(S, x_values);
plot(x_values, S_values, 'b', 'LineWidth', 2);
hold on;

ln_values = log(x_values);
plot(x_values, ln_values, 'r--', 'LineWidth', 2);

xlabel('x');
ylabel('Y轴标签');
title('函数 S(x) 和 ln(x) 的图像');
legend('S(x)', 'ln(x)');
grid on;

% 定义符号变量
syms x y(x);

% 定义微分方程
eqn = (diff(y,x))^4 + y^2 == y^4;

% 解微分方程
sol = dsolve(eqn);

% 显示解
disp(sol);




