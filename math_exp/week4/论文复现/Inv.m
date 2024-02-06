% 求解二维逆矩阵
function Inv_M = Inv(M)
    Inv_M = zeros(2,2);
    det = M(1,1) * M(2,2) - M(1,2) * M(2,1);
    Inv_M(1,1) = M(2,2) / det;
    Inv_M(1,2) = -M(1,2) / det;
    Inv_M(2,1) = -M(2,1) / det;
    Inv_M(2,2) = M(1,1) / det;
end