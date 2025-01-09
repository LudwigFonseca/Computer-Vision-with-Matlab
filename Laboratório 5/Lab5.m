clc
clear
close all

% Captura uma imagem da câmera
video = videoinput('winvideo', 1);
preview(video)
pause(5);
closepreview(video);
Im_rgb = getsnapshot(video);
    
Im_gray  = rgb2gray(Im_rgb);
Im_bw    = imbinarize(Im_gray, 'global');
Im_bin   = not(Im_bw);
Im_label = bwlabel(Im_bin, 8);
N        = max(max(Im_label));

Prop     = regionprops(logical(Im_label), 'all');
Temp     = [Prop.Area];
Temp     = find(Temp ~= 698975 & Temp ~= 2 & Temp ~= 4 & Temp ~=1);
Prop     = Prop(Temp);
N        = size(Prop, 1);

imshow(Im_rgb);
hold on
axis on
title('Laboratório 5')
xlabel('pixels')
ylabel('pixels')

% Marca o centro dos objetos
for i = 1:N
    if Prop(i).Area > 2300
        plot(Prop(i).Centroid(:,1), Prop(i).Centroid(:,2),'k*')
    end
end

for i = 1:N-1
    if isequal(Prop(i).Area, Prop(i+1).Area)
    end
end

X =  [Prop.Area];
[~, n1] = find(X > 100 & X < 400);
[~, n2] = find(X > 300 & X < 1100);
[~, n3] = find(X > 1500 &  X < 2000);

L1 = line([fix(Prop(n1(:, 1)).Centroid(:,1)) fix(Prop(n1(:, 2)).Centroid(:,1))], [fix(Prop(n1(:, 1)).Centroid(:,2)) fix(Prop(n1(:, 2)).Centroid(:,2))], 'Color', 'k');
L2 = line([fix(Prop(n1(:, 2)).Centroid(:,1)) fix(Prop(n1(:, 3)).Centroid(:,1))], [fix(Prop(n1(:, 2)).Centroid(:,2)) fix(Prop(n1(:, 3)).Centroid(:,2))], 'Color', 'k');
L3 = line([fix(Prop(n1(:, 3)).Centroid(:,1)) fix(Prop(n1(:, 4)).Centroid(:,1))], [fix(Prop(n1(:, 3)).Centroid(:,2)) fix(Prop(n1(:, 4)).Centroid(:,2))], 'Color', 'k');
L4 = line([fix(Prop(n1(:, 4)).Centroid(:,1)) fix(Prop(n1(:, 1)).Centroid(:,1))], [fix(Prop(n1(:, 4)).Centroid(:,2)) fix(Prop(n1(:, 1)).Centroid(:,2))], 'Color', 'k');

L5 = line([fix(Prop(n2(:, 1)).Centroid(:,1)) fix(Prop(n2(:, 2)).Centroid(:,1))], [fix(Prop(n2(:, 1)).Centroid(:,2)) fix(Prop(n2(:, 2)).Centroid(:,2))], 'Color', 'k');
L6 = line([fix(Prop(n2(:, 2)).Centroid(:,1)) fix(Prop(n2(:, 4)).Centroid(:,1))], [fix(Prop(n2(:, 2)).Centroid(:,2)) fix(Prop(n2(:, 4)).Centroid(:,2))], 'Color', 'k');
L7 = line([fix(Prop(n2(:, 4)).Centroid(:,1)) fix(Prop(n2(:, 3)).Centroid(:,1))], [fix(Prop(n2(:, 4)).Centroid(:,2)) fix(Prop(n2(:, 3)).Centroid(:,2))], 'Color', 'k');
L8 = line([fix(Prop(n2(:, 3)).Centroid(:,1)) fix(Prop(n2(:, 1)).Centroid(:,1))], [fix(Prop(n2(:, 3)).Centroid(:,2)) fix(Prop(n2(:, 1)).Centroid(:,2))], 'Color', 'k');

% Desenha a linha de menor distância no plano
a = n3(:,1);

% Procura a posição no plano do objeto não estático
L     = [L1, L2, L3, L4, L5, L6, L7, L8];
min   = size(2*Im_rgb, 2);
n     = [n1 n2];

for i = 1:N-1
    temp = sqrt((L(i).XData(1) - Prop(n3(:, 1)).Centroid(:,1))^2 + (L(i).XData(2) - Prop(n3(:, 1)).Centroid(:,1))^2 ...
    + (L(i).YData(1) - Prop(n3(:, 1)).Centroid(:,2))^2 + (L(i).YData(2) - Prop(n3(:, 1)).Centroid(:,2))^2);    

%     temp = sqrt((Prop(n(:,i)).Centroid(:,1) - Prop(a).Centroid(:,1))^2 + (Prop(n(:,i)).Centroid(:,2) - Prop(a).Centroid(:,2))^2);  

    if temp < min
        min = temp;
        pos = i;        
    end

end

% Linhas Externas
if pos == 1
    b = n1(:,1);
    c = n1(:,2);
end

if pos == 2
    b = n1(:,2);
    c = n1(:,3);
end

if pos == 3
    b = n1(:,3);
    c = n1(:,4);
end

if pos == 4
    b = n1(:,4);
    c = n1(:,1);
end

% Linhas Internas
if pos == 5
    b = n2(:,1);
    c = n2(:,2);
end

if pos == 6
    b = n2(:,2);
    c = n2(:,4);
end

if pos == 7
    b = n2(:,4);
    c = n2(:,3);
end

if pos == 8
    b = n2(:,3);
    c = n2(:,1);
end

delete(L(pos));

% Raio do Objeto Central
Rad = sqrt((Prop(a).EquivDiameter/2)^2 + (Prop(a).MinorAxisLength/2)^2);

for i = 0:360
   Cx = Prop(a).Centroid(:,1) + Rad*cosd(i);
   Cy = Prop(a).Centroid(:,2) + Rad*sind(i);
   plot(Cx,Cy,'k.')
end
Norm = [(Prop(b).Centroid(:,1)-Prop(c).Centroid(:,1)), (Prop(b).Centroid(:,2)-Prop(c).Centroid(:,2)), 0] / sqrt((Prop(b).Centroid(:,1) - Prop(c).Centroid(:,1))^2 + (Prop(b).Centroid(:,2) - Prop(c).Centroid(:,2))^2);
k = [0, 0, 1];
w1 = [Norm(2)*k(3)-Norm(3)*k(2), Norm(3)*k(1)-Norm(1)*k(3)];
w2 = -w1;

p1 = Prop(a).Centroid(:,1) + w1(1)*Rad;
p2 = Prop(a).Centroid(:,2) + w1(2)*Rad;

p3 = Prop(a).Centroid(:,1) + w2(1)*Rad;
p4 = Prop(a).Centroid(:,2) + w2(2)*Rad;

scatter(p1, p2, '*b')
scatter(p3, p4, '*r')

x1 = [fix(Prop(b).Centroid(:,1)) p1];
y1 = [fix(Prop(b).Centroid(:,2)) p2];

x2 = [p1 fix(Prop(c).Centroid(:,1))];
y2 = [p2 fix(Prop(c).Centroid(:,2))];
temp1 = sqrt((x1(1) - x2(1)).^2 + (x1(2) - x2(2)).^2 + (y1(1) - y2(1)).^2 + (y1(2) - y2(2)).^2);

x3 = [fix(Prop(b).Centroid(:,1)) p3];
y3 = [fix(Prop(b).Centroid(:,2)) p4];

x4 = [p3  fix(Prop(c).Centroid(:,1))];
y4 = [p4  fix(Prop(c).Centroid(:,2))];
temp2 = sqrt((x3(1) - x4(1)).^2 + (x3(2) - x4(2)).^2 + (y3(1) - y4(1)).^2 + (y3(2) - y4(2)).^2);


if temp1 < temp2   
   L(pos) = line([x1 x2], [y1 y2], 'Color', 'red');
elseif temp1 > temp2   
   L(pos) = line([x3 x4], [y3 y4], 'Color', 'red');
end



 