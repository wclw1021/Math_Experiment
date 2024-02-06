% 计算刚体变换
function v_deform = Compute_Rigid(p, q, v)
    % 计算权重 w
    w = Precompute_w(p, v);

    % 计算 pstar 和 qstar
    pstar = Precompute_pstar(p, w);
    qstar = Precompute_pstar(q, w);
    
    % 获取点集的数量 np
    np = size(p, 1);

    % 初始化单元格数组来存储 p_hat
    p_hat = cell(1, np);

    % 遍历点集
    for i = 1:np
        % 计算 p_hat
        p_hat{i} = bsxfun(@minus, p(i, :), pstar);
    end

    % 初始化单元格数组来存储 q_hat
    q_hat = cell(1, np);

    % 遍历点集
    for i = 1:np
        % 计算 "hat" 点 q_hat
        q_hat{i} = bsxfun(@minus, q(i, :), qstar);
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
    
    % 计算fr(v)向量函数
    fr_v = zeros(1,2);
    for i = 1:np
        fr_v(1) = fr_v(1) + q_hat{i}(1)*Ai{i}(1,1) + q_hat{i}(2)*Ai{i}(2,1);
        fr_v(2) = fr_v(2) + q_hat{i}(1)*Ai{i}(1,2) + q_hat{i}(2)*Ai{i}(2,2);
    end

    % 计算 v_deform
    dist = sqrt((v(1)-pstar(1))^2 + (v(2)-pstar(2))^2);
    fr_v_dist = sqrt(fr_v(1)^2 + fr_v(2)^2);
    v_deform = dist/fr_v_dist * fr_v + qstar;
end

