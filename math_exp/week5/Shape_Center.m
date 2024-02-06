function x_average = Shape_Center(points,F)
    Areas = areas(points,F);
    x = zeros(size(F,1));
    x_sum = 0;
    floatage = Floatage(points,F);
    for i = 1:size(F,1)
        index = F(i,:);
        x(i) = (points(index(1,1),1)+points(index(1,2),1)+points(index(1,3),1))/3;
        x_sum = x_sum + Areas(i) * x(i);
    end
    x_average = x_sum / floatage;
end

