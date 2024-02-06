function k_opt = Voronoi_NonlinearOpitimization(inter)

    % 目标函数：最小化 g_center_y
    objective = @(k) objectiveFunction(k, inter);

    % 初始猜测值
    k0 = ones(1, length(inter));

    % 约束条件
    Aeq = [];
    beq = [];
    lb = 0 * ones(size(k0));  % 创建与 k0 相同长度的向量，每个元素为0.1
    ub = 1 * ones(size(k0));  % 创建与 k0 相同长度的向量，每个元素为0.9


    % 非线性约束：g_center_x = f_center_x
    nonlcon = @(k) nonlinearConstraints(k, inter);

    % 定义非线性规划选项
    options = optimoptions('fmincon', 'Display', 'iter', 'MaxFunctionEvaluations', 2e4);

    % 使用 fmincon 函数进行非线性规划
    [k_opt, fval] = fmincon(objective, k0, [], [], Aeq, beq, lb, ub, nonlcon, options);

    % 打印结果
    disp('Optimal k values:');
    disp(k_opt);
    disp(['Optimal g_center_y: ', num2str(fval)]);

    % 目标函数
    function g_center_y = objectiveFunction(k, inter)
        [~, g_center_y] = Voronoi_Gravity_Center(k,inter);
    end

    % 非线性约束函数
    function [c, ceq] = nonlinearConstraints(k, inter)
        % 计算 g_center_x 和 f_center_x
        [g_center_x, ~] = Voronoi_Gravity_Center(k,inter);
        f_center_x = Voronoi_Shape_Center(inter);
        % 计算 gravity 和 floatage
        gravity = Voronoi_Gravity(k, inter);
        floatage = Voronoi_Floatage(inter);

        % 构建非线性约束
        c = [];  % 无不等式约束
        ceq = [g_center_x - f_center_x, 1.25* gravity - 1 * 0.3402 * floatage];
    end
end

