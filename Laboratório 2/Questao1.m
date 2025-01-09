clc
clear 
close all 

Img1 = imread('UFSC.jpg'); 
figure(1);imshow(Img1);
[x, y] = ginput(4);
x1 = fix(x);
y1 = fix(y);
x2 = [1; 500; 500; 1];
y2 = [1; 1; 500; 500];

T = maketform('projective', [x1, y1], [x2, y2]);
T.tdata.T
[Im, xdata, ydata] = imtransform(Img1,T);
imshow(Im);

Imr = Im(:,:,1);
Img = Im(:,:,2);
Imb = Im(:,:,3);
gray = 0.299*Imr + 0.587*Img + 0.114*Imb;
figure(2);imshow(gray);

[x, y] = ginput(1);
x = fix(x);
y = fix(y);

Percentual = 10;
BW = gray <= (gray(y,x)+gray(y,x)*Percentual/100) & gray >= (gray(y,x)-gray(y,x)*Percentual/100);
% figure(3);imshow(BW)

Im = double(Im);
Im(:,:,1) = Im(:,:,1)./max(max(Im(:,:,1)));
Im(:,:,2) = Im(:,:,2)./max(max(Im(:,:,2)));
Im(:,:,3) = Im(:,:,3)./max(max(Im(:,:,3)));

BW2 = double(BW);
New(:,:,1) = Im(:,:,1).*BW2;
New(:,:,2) = Im(:,:,2).*BW2;
New(:,:,3) = Im(:,:,3).*BW2;
imshow(New)

img2 = ~BW;
B = bwboundaries(img2,'holes');
imshow(img2)
text(15,15,strcat('\color{green}Objects Found:',num2str(length(B))))
hold on

for k = 1:length(B)
    boundary = B{k};
    plot(boundary(:,2), boundary(:,1), 'g', 'LineWidth', 2)
end