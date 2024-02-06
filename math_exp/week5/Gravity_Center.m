function [x_average,y_average] = Gravity_Center(k,points,F)
    Areas = areas(points,F);
    gravity = Gravity(k,points,F);
    x = zeros(size(F,1));
    y = zeros(size(F,1));
    x_sum = 0;
    y_sum = 0;
    for i = 1:size(F,1)
        index = F(i,:);
        x(i) = (points(index(1,1),1)+points(index(1,2),1)+points(index(1,3),1))/3;
        y(i) = (points(index(1,1),2)+points(index(1,2),2)+points(index(1,3),2))/3;
        x_sum = x_sum + k(i) * Areas(i) * x(i);
        y_sum = y_sum + k(i) * Areas(i) * y(i);
    end
    x_average = x_sum / gravity;
    y_average = y_sum / gravity;
end

