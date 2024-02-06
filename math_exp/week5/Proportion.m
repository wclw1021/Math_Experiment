function prop = Proportion(boundary, points, F)
    a = max(boundary(:, 2));
    b = min(boundary(:, 2));
    c = (a - b) / 5;
    floatage = Floatage(points, F);
    Areas = areas(points, F);
    Underwater = 0;
    
    for i = 1:size(F, 1)
        index = F(i, :);
        
        % 检查三角形的所有三个顶点是否都在水下
        if ( points(index(1,1), 2) <= c ...
             && points(index(1,2), 2) <= c ...
             && points(index(1,3), 2) <= c)
            
            Underwater = Underwater + Areas(i);
        end
    end
    prop = Underwater / floatage;
end


