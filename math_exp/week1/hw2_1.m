% 2.1.1
n = 10; % 根据需要选择n的值
Cn = zeros(1, n);
an = zeros(1, n);
Sn = zeros(1, n);
fn = zeros(1, n);
Fn = zeros(1, n);
Gn = zeros(1, n);

% 初始值
Cn(1) = 6 * 2^0;
an(1) = 1;

% 计算Cn、an、Sn、fn和Fn的值
for i = 2:n-1
    Cn(i) = 6 * 2^(i-1);
    an(i) = sqrt(2 - 2 * sqrt(1 - (an(i-1)/2)^2));
    Sn(i-1) = 3 * 2^(i-2) * an(i-1);
    fn(i-1) = Sn(i-1);
    if i > 2
        Fn(i-1) = 2 * Sn(i-1) - Sn(i-2);
    else
        Fn(i-1) = Sn(i-1);
    end
    % 2.2.2
    if i > 2
        Gn(i-1) = Sn(i-2) + (4/3) * (Sn(i-1) - Sn(i-2));
    end
end

% 输出结果
for i = 2:n-2
    fprintf('对于n = %d, Gn = %f.\n', i-1, Gn(i));
end

% 初始化参数
n = 1000; % 根据需要选择n的值
y = zeros(1, n);
alpha = zeros(1, n);
G_n = 0;

% 初始值
y(1) = 1 / sqrt(2);
alpha(1) = 1 / 2;

% 计算y、alpha和G的值
for i = 2:n
    y(i) = (1 - sqrt(1 - y(i-1)^2)) / (1 + sqrt(1 - y(i-1)^2));
    alpha(i) = (1 + y(i))^2 * alpha(i-1) - 2^(i-1) * y(i);
end
G_n = 1 / alpha(n);

% 输出结果
fprintf('对于n = %d, G_n = %f.\n', n, G_n);

