%计算\pi(n)的数值
N_values = [100, 1000, 10000];  % 不同的N值

for N = N_values
    is_prime = true(1, N);  % 初始化一个布尔数组，表示每个数是否为素数
    primes = [];  % 存储找到的素数
    
    for p = 2:N
        if is_prime(p)
            primes = [primes, p];  % 将素数添加到素数列表中
            for i = p:p:N
                is_prime(i) = false;  % 将p的倍数标记为非素数
            end
        end
    end
    
    fprintf('π(%d)的值为：%d\n', N, length(primes));
end

%计算\pi(m,n)的数值
M_values = [100, 1000, 10000];

for i = 1:length(M_values)
    M = M_values(i);
    N = M + 100;  
    is_prime = true(1, N);  % 初始化一个布尔数组，表示每个数是否为素数
    primes = [];  % 存储找到的素数
   
    for p = 2:N
        if is_prime(p)
            if p >= M  % 仅将大于或等于 M 的素数添加到 primes 中
                primes = [primes, p];
            end
            for j = p:p:N
                is_prime(j) = false;  % 将p的倍数标记为非素数
            end
        end
    end
    
    fprintf('当 M = %d 时，π(%d) - π(%d) 的结果为：%d\n', M, M+100, M-1, length(primes));

    figure;

    x_axis = M:N;
    y_axis = zeros(size(x_axis));  % 设置y轴的数值为零，创建一个与x轴相同长度的零向量

    red_indices = primes - M + 1;  % 计算在 primes 中的点在数轴上的索引

    plot(x_axis, y_axis, 'k-');  % 使用黑色实线绘制一维数轴
    hold on;

    scatter(x_axis(red_indices), zeros(size(red_indices)), 25, 'r', 'filled');

    title(['区间 [', num2str(M), ', ', num2str(N), '] 的一维数轴']);
    axis([M, N, -1, 1]);  % 设置坐标轴范围，y轴范围为-1到1以确保一维数轴可见
    axis off;  % 关闭y轴
end   






