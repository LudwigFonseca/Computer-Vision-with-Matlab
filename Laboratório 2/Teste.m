clc
clear
close all

Im = imread('Pieces.jpg');
figure(1);imshow(Im);

Imr = Im(:,:,1);
Img = Im(:,:,2);
Imb = Im(:,:,3);
gray = 0.299*Imr + 0.587*Img + 0.114*Imb;
imshow(gray);

[x, y] = ginput(1);
x = fix(x);
y = fix(y);

Percentual = 10;
BW = gray <= (gray(y,x) + gray(y,x)*Percentual/100) & gray >= (gray(y,x) - gray(y,x)*Percentual/100);
% imshow(BW)

Im = double(Im);
Im(:,:,1) = Im(:,:,1)./max(max(Im(:,:,1)));
Im(:,:,2) = Im(:,:,2)./max(max(Im(:,:,2)));
Im(:,:,3) = Im(:,:,3)./max(max(Im(:,:,3)));

BW2 = double(BW);
New(:,:,1) = Im(:,:,1).*BW2;
New(:,:,2) = Im(:,:,2).*BW2;
New(:,:,3) = Im(:,:,3).*BW2;
imshow(New)

%%
clc
clear
close all
Im = imread('Teste.jpg');
figure(1);
imshow(Im);

Imr = Im(:,:,1);
Img = Im(:,:,2);
Imb = Im(:,:,3);

[x, y] = ginput(1);
x = fix(x);
y = fix(y);
Porcentagem = 80;

ImrS = Imr <= (Imr(y,x)+Imr(y,x)*(Porcentagem/100)) & Imr >= (Imr(y,x)-Imr(y,x)*(Porcentagem/100));
ImgS = Img <= (Img(y,x)+Img(y,x)*(Porcentagem/100)) & Img >= (Img(y,x)-Img(y,x)*(Porcentagem/100));
ImbS = Imb <= (Imb(y,x)+Imb(y,x)*(Porcentagem/100)) & Imb >= (Imb(y,x)-Imb(y,x)*(Porcentagem/100));
ImS(:,:,1) = ImrS;
ImS(:,:,2) = ImgS;
ImS(:,:,3) = ImbS;

ImS = double(ImS);
ImS(:,:,1) = ImS(:,:,1)./max(max(ImS(:,:,1)));
ImS(:,:,2) = ImS(:,:,2)./max(max(ImS(:,:,2)));
ImS(:,:,3) = ImS(:,:,3)./max(max(ImS(:,:,3)));

% figure(20);imshow(ImS(:,:,1));
% figure(21);imshow(ImS(:,:,2));
% figure(22);imshow(ImS(:,:,3));

Im = double(Im);
Im(:,:,1) = Im(:,:,1)./max(max(Im(:,:,1)));
Im(:,:,2) = Im(:,:,2)./max(max(Im(:,:,2)));
Im(:,:,3) = Im(:,:,3)./max(max(Im(:,:,3)));
% figure(30);imshow(Im);

ImSBW = (ImS(:,:,1).*ImS(:,:,2).*ImS(:,:,3));
figure(40);imshow(ImSBW);

New(:,:,1) = Im(:,:,1).*ImSBW;
New(:,:,2) = Im(:,:,2).*ImSBW;
New(:,:,3) = Im(:,:,3).*ImSBW;
% figure(4);imshow(New)

%%
clc
clear
close all
img1=imread('Pieces.jpg');
figure(1);imshow(img1);

img1=rgb2gray(img1);
figure(2);imshow(img1)

img2=Im1bw(img1,graythresh(img1));
figure(3);imshow(img2)

img2=~img2;
figure(4);imshow(img2)

B = bwboundaries(img2,'holes');
figure(5);imshow(img2)
text(15,15,strcat('\color{green}Objects Found:',num2str(length(B))))
hold on

for k = 1:length(B)
    boundary = B{k};
    plot(boundary(:,2), boundary(:,1), 'g', 'LineWidth', 2)
end

%%
clc
clear
close all

p = [40; 30; 20; 10; 20];
v = [840; 600; 400; 100; 300];
x = zeros(5, 1);
c = 50;
n = 4;

for j = n:-1:1
    if p(j) <= c
        x(j) = 1;
        c = c - p(j);                
    else
        x(j) = c/p(j);
        c = 0;
    end
end

%%
clc
clear
close all

Im = imread('Teste.jpg');
figure(1);imshow(Im);

Imr = Im(:,:,1);
Img = Im(:,:,2);
Imb = Im(:,:,3);
gray = 0.299*Imr + 0.587*Img + 0.114*Imb;
imshow(gray);

[x, y] = ginput(1);
x = fix(x);
y = fix(y);

Percentual = 10;
BW = gray <= (gray(y,x) + gray(y,x)*Percentual/100) & gray >= (gray(y,x) - gray(y,x)*Percentual/100);
% imshow(BW)

Im = double(Im);
Im(:,:,1) = Im(:,:,1)./max(max(Im(:,:,1)));
Im(:,:,2) = Im(:,:,2)./max(max(Im(:,:,2)));
Im(:,:,3) = Im(:,:,3)./max(max(Im(:,:,3)));

BW2 = double(BW);
New(:,:,1) = Im(:,:,1).*BW2;
New(:,:,2) = Im(:,:,2).*BW2;
New(:,:,3) = Im(:,:,3).*BW2;
imshow(BW)


[m, n] = size(BW);
temp = 0;
for i = 1:m-1
    for j = 1:n-1
        if BW(i, j) == 1
            [BW, cont] = Greedy(i, j, i, i+1, j, BW);
            temp = temp + cont;
        end        
    end
end

function [image, cont] = Greedy(i, j, A, B, C, BW)                                                 
    BW(A:B, A:C) = 0; 
    imshow(BW)
    
    if BW(i, j+1) == 0 && BW(i, j-1) == 0 && BW(i+1, j) == 0 && BW(i-1, j) == 0 && BW(i-1, j-1) == 0 && BW(i+1, j+1) == 0 && BW(i+1, j-1) == 0 && BW(i-1, j+1) == 0
        i = i + 1;
    end
    
    if sum(sum(BW(A:B,A:C))) == 0
        image = BW;
        cont = 1;
    end     
    
    if sum(sum(BW(A:B,A:C))) > 0                
        if BW(i, j-1) == 1 || BW(i, j-2) == 1
             A = i - 1;
        end
        
        if BW(i, j+1) == 1 || BW(i, j+2) == 1
             B = i + 1;
        end
        
        if BW(i-1, j) == 1 || BW(i-2, j) == 1
            C = j + 1;
        end               
        Greedy(i, j+1, A, B, C, BW)  
    end
end
