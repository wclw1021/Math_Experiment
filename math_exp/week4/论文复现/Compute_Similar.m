% 计算相似变换
function v_deform = Compute_Similar(p, q, v)
    % 计算权重 w
    w = Precompute_w(p, v);

    % 计算 pstar 和 qstar
    pstar = Precompute_pstar(p, w);
    qstar = Precompute_pstar(q, w);
    
    % 获取点集的数量 np
    np = size(p, 1);

    % 初始化单元格数组来存储 p_hat
    p_hat = cell(1, np);

    % 遍历点集：
    for i = 1 : np
        % 计算 p_hat
        p_hat{i} = bsxfun(@minus, p(i, :), pstar);
    end

    % 初始化单元格数组来存储 q_hat
    q_hat = cell(1, np);

    % 遍历点集：
    for i = 1 : np
        % 计算 q_hat
        q_hat{i} = bsxfun(@minus, q(i, :), qstar);
    end
    
    %计算mu_s
    mu_s = 0;
    for i = 1 : np
        mu_s = mu_s + w(i)*(p_hat{i}(1)^2 + p_hat{i}(2)^2);
    end
    
    % 初始化 Ai 单元格数组, 索引为i, 存储元素为2×2矩阵, A与B矩阵应用于下方计算
    Ai = cell(1, np);
    A = zeros(2, 2);
    B = zeros(2, 2);
    
    % 计算 Ai
    for i = 1 : np   
        A(1, :) = [p_hat{i}(1), p_hat{i}(2)];
        A(2, :) = [p_hat{i}(2), -p_hat{i}(1)];
        B(:, 1) = [(v(1) - pstar(1)),(v(2) - pstar(2))];
        B(:, 2) = [(v(2) - pstar(2)), (-v(1) + pstar(1))];
        Ai{i} = w(i) * A * B;
    end

    % 初始化 v_deform，表示v向量变换后的结果
    v_deform = zeros(1,2);

    % 计算 v_deform
    for i = 1 : np
        v_deform = v_deform + q_hat{i}*Ai{i};
    end

    % 添加 qstar 以获得最终结果
    v_deform = v_deform / mu_s+ qstar;
end

