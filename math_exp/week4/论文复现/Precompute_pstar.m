% 根据p和w计算平均中点pstar
function pstar = Precompute_pstar(p,w)

    % 初始化
    np = size(p,1);
    sigma_w =0;
    sigma_pw = zeros(1,2);

    % 计算求和
    for i=1:np
        sigma_w = sigma_w + w(i);
        sigma_pw(1) = sigma_pw(1) + p(i,1) * w(i);
        sigma_pw(2) = sigma_pw(2) + p(i,2) * w(i);
    end

    % 计算所求
    pstar = zeros(1,2);
    pstar(1) = sigma_pw(1) / sigma_w;
    pstar(2) = sigma_pw(2) / sigma_w;
end