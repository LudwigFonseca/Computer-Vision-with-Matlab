function value_sad = sad_rgb(Original, Matching)
[xb,yb,~] = size(Original);
[xs,ys,~] = size(Matching);
x = [0 0 0];
value_sad = [];
for i = 1:xb-xs-1
    for j = 1:yb-ys-1
        x(1) = sum(sum(abs(Original(i:(i+xs-1),j:(j+ys-1),1)-Matching(1:xs,1:ys,1))));
        x(2) = sum(sum(abs(Original(i:(i+xs-1),j:(j+ys-1),2)-Matching(1:xs,1:ys,2))));
        x(3) = sum(sum(abs(Original(i:(i+xs-1),j:(j+ys-1),3)-Matching(1:xs,1:ys,3))));
        if isequal(value_sad,[])
            value_sad = [(x(1) + x(2) + x(3))/3 i j i+xs j+ys];
        elseif (value_sad(1)>(x(1)+x(2)+x(3))/3)
            value_sad = [(x(1) + x(2) + x(3))/3 i j i+xs j+ys];
        end
    end
end
end