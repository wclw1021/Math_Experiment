%Eratosthenes筛法
tic
N = 500;  %N以内的素数
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

disp(primes);
elapsed_time = toc; % 停止计时并获取经过的时间
disp(['执行时间：', num2str(elapsed_time), ' 秒']);

%试除法
tic
N = 500;  %N以内的素数
is_prime = true(1, N);  % 初始化一个布尔数组，表示每个数是否为素数
primes = [2];  % 初始时，已知第一个素数是2

for n = 3:N
    is_prime = true;  
    for i = 1:length(primes)
        if mod(n, primes(i)) == 0
            is_prime = false;  % 如果n能被已知素数整除，则n不是素数
            break;  
        end
    end
    if is_prime
        primes = [primes, n];  % 如果n是素数，将其添加到素数列表中
    end
end

disp(primes);
elapsed_time = toc; % 停止计时并获取经过的时间
disp(['执行时间：', num2str(elapsed_time), ' 秒']);

%维路判别法
tic
N = 500;  % N以内的素数
primes = [];

for n = 2:N
    is_prime = true; % 假设 n 是素数
    
    if n > 2 && mod(n, 2) == 0
        is_prime = false; % 偶数大于2一定不是素数
    else
        for a = 2:min(n-1, ceil(10 * log(n)^2)) % 限制迭代次数
            a_mod = mod(sym(a)^((n - 1) / 2), n);
            an_mod = mod(jacobiSymbol(a, n), n);
            if a_mod ~= an_mod
                is_prime = false;
                break;
            end
        end
    end
    
    if is_prime
        primes = [primes, n];
    end
end

disp(primes);
elapsed_time = toc; % 停止计时并获取经过的时间
disp(['执行时间：', num2str(elapsed_time), ' 秒']);




%概率判别法
tic
N = 500;  %N以内的素数
is_prime = true(1, N);  % 初始化一个布尔数组，表示每个数是否为素数
primes = [2, 3];  % 存储找到的素数
k = 10; % 随机数次数
for n = 4:N
    for time = 1:k
        p = randi([2, n-1]);  % 从2到n-1之间选择随机数
        if gcd(p, n) ~= 1
            is_prime(n) = false;
            break;
        else
            J = mod(sym(p)^(n-1), n);
            if J ~= -1 && J ~= 1
                is_prime(n) = false;
                break;
            end
        end
    end
    if is_prime(n)
        primes = [primes, n];
    end
end

disp(primes);
elapsed_time = toc; % 停止计时并获取经过的时间
disp(['执行时间：', num2str(elapsed_time), ' 秒']);














