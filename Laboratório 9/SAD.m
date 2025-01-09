function value_sad = SAD(Original, Matching, vc, uc)
[xs,ys,~] = size(Matching);
value_sad = [];
i = vc;
for j = (uc-ys-1):-1:(uc*0.4)
    x = sum( sum( abs( Original(i:(i+xs-1), j:(j+ys-1)) - Matching(1:xs, 1:ys) )));
    if isequal(value_sad, [])
        value_sad = [x, i, j, i+xs-1, j+ys];
    elseif (value_sad(1) > x)
        value_sad = [x, i, j, i+xs-1, j+ys];
    end
end
end