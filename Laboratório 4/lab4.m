% Questão A
clc
clear
close all

ImO = imread('Wally.jpg');
ImO1 = ImO;
ImO2 = ImO;
ImO3 = ImO;

ImS1 = imread('Search1.jpg');
ImS2 = imread('Search2.jpg');
ImS3 = imread('Search3.jpg');
ImS1 = imread('Search4.jpg');

tic
A = sad_rgb(ImO1, ImS1);
toc
[m, n, p]                     = size(ImO1(A(2):A(4), A(3):A(5), :));
Quadro1                       = zeros(m, n, p);
Quadro1(:,:,2)                = 255*ones(m, n, 1);
Quadro1(6:end-5, 6:end-5, :)  = -1*(double(ImO1(A(2)+5:A(4)-5, A(3)+5:A(5)-5, :))-255);
Quadro1                       = uint8(255*(Quadro1/max(Quadro1(:))));
ImO1(A(2):A(4), A(3):A(5), :) = Quadro1(:, :, :);
figure(1)
imshow(ImO1)
title('SAD')

tic
B = ssd_rgb(ImO2, ImS1);
toc
[m, n, p]                     = size(ImO2(B(2):B(4), B(3):B(5), :));
Quadro2                       = zeros(m, n, p);
Quadro2(:,:,2)                = 255*ones(m, n, 1);
Quadro2(6:end-5, 6:end-5, :)  = -1*(double(ImO2(B(2)+5:B(4)-5, B(3)+5:B(5)-5, :))-255);
Quadro2                       = uint8(255*(Quadro2/max(Quadro2(:))));
ImO2(B(2):B(4), B(3):B(5), :)  = Quadro2(:, :, :);
figure(2)
imshow(ImO2)
title('SSD')

tic
C = zncc_rgb(ImO3, ImS1);
toc
[m, n, p]                     = size(ImO3(C(2):C(4), C(3):C(5), :));
Quadro3                       = zeros(m, n, p);
Quadro3(:,:,2)                = 255*ones(m, n, 1);
Quadro3(6:end-5, 6:end-5, :)  = -1*(double(ImO3(C(2)+5:C(4)-5, C(3)+5:C(5)-5, :))-255);
Quadro3                       = uint8(255*(Quadro3/max(Quadro3(:))));
ImO3(C(2):C(4), C(3):C(5), :)  = Quadro3(:, :, :);
figure(3)
imshow(ImO3)
title('ZNCC')
%%
% Questão B
clc
clear
close all

Im_Green = imread('Green2.jpg');

limiar = 350;
a      = double(Im_Green)/limiar;
b      = a.^2;
c      = uint8(b*limiar);

Negativo  = uint8(-1*(double(c)-255));

Im_gray   = rgb2gray(Im_Green + 0.08);
Im_gray2  = rgb2gray(Negativo);

Im_bw     = imbinarize(Im_gray, 0.6705);
Im_bw2    = imbinarize(Im_gray2, 0.6705);

Im_bin    = not(Im_bw + Im_bw2);

Im_Green        = double(Im_Green);
Im_Green(:,:,1) = Im_Green(:,:,1)./max(max(Im_Green(:,:,1)));
Im_Green(:,:,2) = Im_Green(:,:,2)./max(max(Im_Green(:,:,2)));
Im_Green(:,:,3) = Im_Green(:,:,3)./max(max(Im_Green(:,:,3)));

Im_bw2     = double(Im_bw + Im_bw2);
New(:,:,1) = Im_Green(:,:,1).*Im_bw2;
New(:,:,2) = Im_Green(:,:,2).*Im_bw2;
New(:,:,3) = Im_Green(:,:,3).*Im_bw2;

Im_Beach   = imread('Beach.jpg');
Temp       = Im_Beach(361:805, 264:550, :);

Temp   = double(Temp);
Temp(:, :, 1) = Temp(:, :, 1)./max(max(Temp(:, :, 1)));
Temp(:, :, 2) = Temp(:, :, 2)./max(max(Temp(:, :, 2)));
Temp(:, :, 3) = Temp(:, :, 3)./max(max(Temp(:, :, 3)));

Im_bw3     = double(Im_bin);    
New2(:, :, 1) = Temp(:, :, 1).*Im_bw3 + New(:, :, 1);
New2(:, :, 2) = Temp(:, :, 2).*Im_bw3 + New(:, :, 2);
New2(:, :, 3) = Temp(:, :, 3).*Im_bw3 + New(:, :, 3);

New2 = uint8(255*(New2));
Im_Beach(361:805, 264:550, :) = New2(:, :, :);
imshow(Im_Beach)
