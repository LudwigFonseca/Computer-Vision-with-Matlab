clc
clear
close all

Im = imread('Tom Jerry.jpg');

gray = rgb2gray(Im);
Img = imbinarize(gray);
Img = not(Img);

Op_Sobel_Vt = (1/16)*[-1 0 1; -2 0 2; -1 0 1];
Op_Sobel_Ht = (1/16)*[-1 -2 -1; 0 0 0; 1 2 1];

[m, n, ~] = size(Im);

Vertical1   = zeros(m, n);
Vertical2   = zeros(m, n);
Horizontal1 = zeros(m, n);
Horizontal2 = zeros(m, n);

for i = 2:m-1
    for j = 2:n-1
        Horizontal1(i, j)   = sum(sum(Img(i-1:i+1, j-1:j+1).*Op_Sobel_Ht));
    end
end

for i = m-1:-1:2
    for j = n-1:-1:2
        Horizontal2(i, j)   = sum(sum(Img(i-1:i+1, j-1:j+1).*Op_Sobel_Ht));
    end
end

for j = 2:n-1
    for i = 2:m-1        
        Vertical1(i, j)     = sum(sum(Img(i-1:i+1, j-1:j+1).*Op_Sobel_Vt));
    end
end

for j = n-1:-1:2
    for i = m-1:-1:2
        Vertical2(i, j)     = sum(sum(Img(i-1:i+1, j-1:j+1).*Op_Sobel_Vt));
    end
end

Resultado = Vertical1 + Horizontal1 + Vertical2 + Horizontal2;

figure(1)
imshowpair(Im, not(uint8(255*(Resultado/ max(Resultado(: ))))), 'montage')