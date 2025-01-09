clc
clear
close all

Im = imread('Lua.jpg');
% Im = imread('Burrinhos.jpg');

Realce1 = [1 -2 1; -2 5 -2; 1 -2 1];
Realce2 = [0 -1 0; -1 5 -1; 0 -1 0];
Realce3 = [-1 -1 -1; -1 9 -1; -1 -1 -1];

[m, n, ~] = size(Im);

Img = double(Im);

[Resultado] = Filter(Img, Realce);

Resultado = uint8(255*(Resultado/ max(Resultado(: ))));

figure(1)
imshowpair(Im, Resultado, 'montage')

function [Image] = Filter(Im, Filter_App)        
    
    [m, n, ~] = size(Im);  
    Resultado = Im; 

    for i = 2:m-1
        for j = 2:n-1
            Resultado(i, j)   = sum(sum(Im(i-1:i+1, j-1:j+1).*Filter_App));        
        end
    end  
    Image = Resultado;    
end