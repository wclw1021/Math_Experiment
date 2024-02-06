% 根据p和v计算平均向量w
function w = Precompute_w(p,v)

    % 初始化
    np=size(p,1);
    w=zeros(1,np);

    % 计算，alpha的值在这里进行调整
    for i =1:np
        dist = (p(i,1)-v(1))^2+(p(i,2)-v(2))^2;
        w(i) = 1.0/dist;
    end
end
