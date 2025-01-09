clc
clear
close all

% Carrega as Imns
Img1 = iread('capa.jpg');
I = iread('capa.jpg', 'gray', 'double');
figure();idisp(I);

I2 = icanny(I);
figure();idisp(I2);

% Linhas que contenham a maior a intensidade de pixels
j = Hough(I2, 'suppress', 10);
linhas2 = j.lines();
linhas2 = linhas2.seglength(I2);
k2 = find(linhas2.length > 60);
figure();idisp(I2); hold on
l = linhas2(k2).plot('g');
delete(l(5));
delete(l(6));

% Encontra os pontos de intersecção das linhas
[x1,y1] = polyxpoly([l(2).XData],[l(2).YData],[l(4).XData],[l(4).YData]);
plot(x1,y1, 'or', 'LineWidth', 4)

[x2,y2] = polyxpoly([l(1).XData],[l(1).YData],[l(4).XData],[l(4).YData]);
plot(x2,y2, 'oy', 'LineWidth', 4)

[x3,y3] = polyxpoly([l(1).XData],[l(1).YData],[l(3).XData],[l(3).YData]);
plot(x3,y3, 'ob', 'LineWidth', 4)

[x4, y4] = polyxpoly([l(2).XData],[l(2).YData],[l(3).XData],[l(3).YData]);
plot(x4,y4, 'om', 'LineWidth', 4)

% Realiza a homeografia da imagem com base nos pontos de intersecção
x = [x1; x2; x3; x4];
y = [y1; y2; y3; y4];
x2 = [1; 500; 500; 1];
y2 = [1; 1; 500; 500];

T = maketform('projective', [x, y], [x2, y2]);
T.tdata.T
[Im, xdata, ydata] = imtransform(Img1,T);
figure();idisp(Im);
