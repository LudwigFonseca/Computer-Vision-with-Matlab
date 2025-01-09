function value_ssd = zncc_rgb(Original, Matching)    
    [xb, yb, ~] = size(Original);
    [xs, ys, ~] = size(Matching);
    x = [0 0 0];
    value_ssd = [];
    for i = 1:xb-xs-1
        for j = 1:yb-ys-1
            x(1) = sum(sum((Original(i:(i+xs-1),j:(j+ys-1),1).*Matching(1:xs,1:ys,1))))./sqrt(sum(sum(Original(i:(i+xs-1),j:(j+ys-1),1).^2.*Matching(1:xs,1:ys, 1).^2)));
            x(2) = sum(sum((Original(i:(i+xs-1),j:(j+ys-1),2).*Matching(1:xs,1:ys,2))))./sqrt(sum(sum(Original(i:(i+xs-1),j:(j+ys-1),2).^2.*Matching(1:xs,1:ys, 2).^2)));
            x(3) = sum(sum((Original(i:(i+xs-1),j:(j+ys-1),3).*Matching(1:xs,1:ys,3))))./sqrt(sum(sum(Original(i:(i+xs-1),j:(j+ys-1),3).^2.*Matching(1:xs,1:ys, 3).^2)));
            if isequal(value_ssd,[])
                value_ssd = [(x(1) + x(2) + x(3))/3 i j i+xs j+ys];
            elseif (value_ssd(1)>(x(1)+x(2)+x(3))/3)
                value_ssd = [(x(1) + x(2) + x(3))/3 i j i+xs j+ys];
            end
        end
    end
end