
clc
clear
close all

Im = imread('Tatoo1.jpg');

Suavizacao1 = (1/5) *[0 1 0; 1 1 1; 0 1 0];
Suavizacao2 = (1/9) *[1 1 1; 1 1 1; 1 1 1];
Suavizacao3 = (1/32)*[1 3 1; 3 1 3; 1 3 1];
Suavizacao4 = (1/8) *[0 1 0; 1 4 1; 0 1 0];

[m, n, ~] = size(Im);

Img = rgb2gray(Im);
Img = double(Img);

[Resultado] = Filter(Img, Suavizacao1);
for i = 1:200
    [Resultado] = Filter(Resultado, Suavizacao1);
end

Resultado = uint8(255*(Resultado/ max(Resultado(:))));

figure(2);
imshowpair(Img, Resultado, 'montage')

function [Image] = Filter(Im, Filter_App)        
      
    Resultado = Im; 

    for i = 80:584
        for j = 251:431
            Resultado(i, j)   = sum(sum(Im(i-1:i+1, j-1:j+1).*Filter_App));        
        end
    end  
    Image = Resultado;    
end