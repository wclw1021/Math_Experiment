function k_opt = NonlinearOptimization(points, insideTriangles)

    % 目标函数：最小化 g_center_y
    objective = @(k) objectiveFunction(k, points, insideTriangles);

    % 初始猜测值
    k0 = ones(1, size(insideTriangles, 1));

    % 约束条件
    Aeq = [];
    beq = [];
    lb = 0.0 * ones(size(k0));  % 创建与 k0 相同长度的向量，每个元素为0.1
    ub = 1.0 * ones(size(k0));  % 创建与 k0 相同长度的向量，每个元素为0.9


    % 非线性约束：g_center_x = f_center_x
    nonlcon = @(k) nonlinearConstraints(k, points, insideTriangles);

    % 定义非线性规划选项
    options = optimoptions('fmincon', 'Display', 'iter', 'MaxFunctionEvaluations', 1e16);

    % 使用 fmincon 函数进行非线性规划
    [k_opt, fval] = fmincon(objective, k0, [], [], Aeq, beq, lb, ub, nonlcon, options);

    % 打印结果
    disp('Optimal k values:');
    disp(k_opt);
    disp(['Optimal g_center_y: ', num2str(fval)]);

    % 目标函数
    function g_center_y = objectiveFunction(k, points, insideTriangles)
        [~, g_center_y] = Gravity_Center(k, points, insideTriangles);
    end

    % 非线性约束函数
    function [c, ceq] = nonlinearConstraints(k, points, insideTriangles)
        % 计算 g_center_x 和 f_center_x
        [g_center_x, ~] = Gravity_Center(k, points, insideTriangles);
        f_center_x = Shape_Center(points, insideTriangles);

        % 计算 gravity 和 floatage
        gravity = Gravity(k, points, insideTriangles);
        floatage = Floatage(points, insideTriangles);

        % 构建非线性约束
        c = [];  % 无不等式约束
        ceq = [g_center_x - f_center_x, 1.25 * gravity - 0.8 * 0.3402 * floatage]; %控制相对比例,1.25为材料密度,1为液体密度
    end
end


