function resultado = encontra_pontos(linhas, I)

x = [];
y = [];
for i = 1 : size(linhas, 2)
    rho1 = linhas(i).rho;
    theta1 = linhas(i).theta;
    if i + 1 <= size(linhas,2)
        for j = i + 1 : size(linhas,2)
            rho2 = linhas(j).rho;
            theta2 = linhas(j).theta;
            v = (rho2/cos(theta2) - rho1/cos(theta1))/(tan(theta2) - tan(theta1));
            u = -tan(theta1)*v + rho1/cos(theta1);
            if u > 0 && v > 0 && v < size(I,2) && u < size(I,1)
                x = [x; v];
                y = [y; u];
            end
        end
    end
end

resultado = [x, y];
end