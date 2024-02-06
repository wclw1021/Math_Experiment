% 计算仿射变换
function v_deform = Compute_Affine(p, q, v)
    % 计算权重 w
    w = Precompute_w(p, v);

    % 计算 pstar 和 qstar
    pstar = Precompute_pstar(p, w);
    qstar = Precompute_pstar(q, w);

    % 计算第一个矩阵 M1
    M1 = v - pstar;
    M2 = zeros(2,2);

    % 获取点集的数量 np
    np = size(p, 1);

    % 初始化单元格数组来存储 q_hat
    q_hat = cell(1, np);

    % 遍历点集：
    for i = 1:np
        % 计算 q_hat：
        q_hat{i} = bsxfun(@minus, q(i, :), qstar);
    end

    % 初始化单元格数组来存储 p_hat：
    p_hat = cell(1, np);

    % 遍历点集：
    for i = 1:np
        % 计算 p_hat
        p_hat{i} = bsxfun(@minus, p(i, :), pstar);

        % 计算矩阵 M2 元素：
        M2(1, 1) = M2(1, 1) + p_hat{i}(1)^2 * w(i);
        M2(1, 2) = M2(1, 2) + p_hat{i}(1) * p_hat{i}(2) * w(i);
        M2(2, 2) = M2(2, 2) + p_hat{i}(2)^2 * w(i);
    end

    % 对称元素赋值
    M2(2, 1) = M2(1, 2);

    % 计算逆矩阵 IM2
    IM2 = Inv(M2);

    % 初始化 Aj 向量
    Aj = zeros(1,np);

    % 计算 Aj
    for i = 1:np
        Aj(i) = (M1(1) * p_hat{i}(1) * IM2(1, 1) + M1(2) * p_hat{i}(1) * IM2(2, 1) + ...
                M1(1) * p_hat{i}(2) * IM2(1, 2) + M1(2) * p_hat{i}(2) * IM2(2, 2))*w(i);
    end

    % 初始化 v_deform：
    v_deform = zeros(1,2);

    % 计算 v_deform：
    for j = 1:np
        v_deform(1) = v_deform(1) + Aj(j) * q_hat{j}(1);
        v_deform(2) = v_deform(2) + Aj(j) * q_hat{j}(2);
    end

    % 添加 qstar 以获得最终结果：
    v_deform = v_deform + qstar;
end



