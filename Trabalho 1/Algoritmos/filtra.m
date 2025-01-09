listAllFiles = dir('Level_1');
for i = 3:size(listAllFiles, 1)
    temp = iread(strcat('Level_1/',listAllFiles(i).name), 'gray', 'double');
    [v, u] = find(temp); u_min = min(u); v_min = min(v);
    [label, m, parents, cls] = ilabel(temp(v_min+15:v_min+85, u_min+11:u_min+37), 8);
    for j = 1:m
        I2 = (label == j);
        
        if parents(j) >= 1 && parents(j) <= 5 && cls(j) == 0
            [v, u] = find(I2); u_min = min(u); u_max = max(u); v_min = min(v); v_max = max(v);
            h = figure();
            idisp(I2(v_min:v_max, u_min:u_max));
            imsave(h);
        end
    end
end