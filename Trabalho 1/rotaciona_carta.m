function resultado = rotaciona_carta(Im)

% Filtro para Capturar Somente o Contorno da Carta
I2 = icanny(Im);

% Gera uma Imagem Convexa
I2 = bwconvhull(I2,'objects', 8); I2 = bwconvhull(I2,'objects', 8); I2 = bwconvhull(I2,'objects', 8); I2 = bwconvhull(I2,'objects', 8);
I2 = bwconvhull(I2,'objects', 8);

% Recorta a Imagem e Aumenta a Sua Área
m = size(I2, 1); n = size(I2, 2);
incArea = 50;
I3 = zeros(m+incArea, n+incArea);
m2 = size(I3, 1); n2 = size(I3, 2);
I3((incArea/2):m2-(incArea/2)-1, (incArea/2):n2-(incArea/2)-1) = I2;

% Pega Somente o Contorno da Carta
I2 = isobel(I2);
I3 = isobel(I3);

% Calcula o Ângulo da Carta
f = imoments(I3);
deg = rad2deg(f.theta*180/pi);

% Linhas de Tendência
j = Hough(I3, 'suppress', 10);
linhas2 = j.lines();
linhas2 = linhas2.seglength(I3);
linhas2 = linhas2((find(linhas2.length > 1)));
x = encontra_pontos(linhas2, I3);
y = x(:, 2)';
x = x(:, 1)';

% Momento Central
m00 = mpq(I3, 0, 0);
vc = mpq(I3, 0, 1) / m00;

% Verifica e Corrigi os Pontos
prob = x((find(y < vc )));
x1 = x((find(x == min(prob)))); y1 = y((find(x == min(prob))));
x2 = x((find(x == max(prob)))); y2 = y((find(x == max(prob))));

prob = x((find(y > vc )));
x3 = x((find(x == max(prob)))); y3 = y((find(x == max(prob))));
x4 = x((find(x == min(prob)))); y4 = y((find(x == min(prob))));

x = [x1 x2 x3 x4]; y = [y1 y2 y3 y4];

if deg > 0
    if sqrt((x2 - x1)^2 + (y2 - y1)^2) > sqrt((x3 - x2)^2 + (y3 - y2)^2)
        x1 = x(4); y1 = y(4);
        x2 = x(1); y2 = y(1);
        x3 = x(2); y3 = y(2);
        x4 = x(3); y4 = y(3);
    end
end

if deg <  0
    if sqrt((x2 - x1)^2 + (y2 - y1)^2) > sqrt((x3 - x2)^2 + (y3 - y2)^2)
        x1 = x(2); y1 = y(2);
        x2 = x(3); y2 = y(3);
        x3 = x(4); y3 = y(4);
        x4 = x(1); y4 = y(1);
    end
end

% Realiza a Homeografia
x = [x1; x2; x3; x4]; y = [y1; y2; y3; y4];
x2 = [1; 500; 500; 1]; y2 = [1; 1; 500; 500];

tform = fitgeotrans([x, y], [x2, y2], 'projective');
Im = imwarp(Im,tform, 'cubic');
I2 = imwarp(I2,tform, 'cubic');

j = Hough(I2, 'suppress', 10);
linhas2 = j.lines();
linhas2 = linhas2.seglength(I2);
linhas2 = linhas2((find(linhas2.length > 1)));
x = encontra_pontos(linhas2, I2);
y = x(:, 2)';
x = x(:, 1)';

% Recorta a Carta e Força a uma Dimensão Fixa
u_min = min(x); u_max = max(x); v_min = min(y); v_max = max(y);
Im = Im(v_min+8:v_max-8, u_min+8:u_max-8);
M = [283 197];
Im = imresize(Im, M, 'nearest');

resultado = Im;

end