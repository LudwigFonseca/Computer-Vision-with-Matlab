%%
% Questão 1
clc
clear
close all
Img1 = imread('WomanGray.jpg');
Img2 = imread('ManGray.jpg');
[m, n] = size(Img1);
Img_Trans = zeros(m, n);

for int1 = 0:0.1:1
   Img_Trans = Img1(:,:)*int1 + Img2(:,:)*(1 - int1);                   
   pause(0.1);
   imshow(Img_Trans)  
end
