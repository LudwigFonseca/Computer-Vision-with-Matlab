clc
clear
close all

Im                 = imread('Moedas.jpg');
Img                = rgb2gray(Im);
ImHBW              = imbinarize(Img);
Im_Bin             = not(ImHBW);
[Im_Label, Number] = bwlabel(Im_Bin,8);
[rows, cols, vals] = find(Im_Label == 1);
N = max(max(Im_Label));

imshow(Im_Label)