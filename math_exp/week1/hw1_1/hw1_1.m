n_values = [3, 4, 5, 6, 7]; %n的值
initial = 3; % 初始值
tolerance = 1e-6; % 收敛阈值
max_iterations = 100; % 最大迭代次数

for n = n_values
    iteration = 0;
    x_current = initial;
    
    while abs(fn_function(x_current, n)) > tolerance && iteration < max_iterations
        x_next = x_current - fn_function(x_current, n) / fn_prime_function(x_current, n);
        iteration = iteration + 1;
        x_current = x_next;
    end

    if iteration < max_iterations
        fprintf('n = %d 在 x = %d 的零点近似值为: %f\n', n, initial,x_current);
    else
        fprintf('n = %d 的迭代未收敛到指定的精度。\n', n);
    end
end

