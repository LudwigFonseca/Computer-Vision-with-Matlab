clc
clear
close all

Im = imread('UFSC.jpg');
figure(1);imshow(Im);

x = [50; 1510; 4060; 2590];
y = [860; 20; 1025; 1855];
x1 = fix(x);
y1 = fix(y);
x2 = [1; 500; 500; 1];
y2 = [1; 1; 500; 500];

T = maketform('projective', [x1, y1], [x2, y2]);
T.tdata.T
[Im, xdata, ydata] = imtransform(Im,T);
figure(2);imshow(Im);

Imr = Im(:,:,1);
Img = Im(:,:,2);
Imb = Im(:,:,3);
gray = 0.35*Imr + 0.25*Img + 0.4*Imb;
cor = [89 64 102 153];

[x, y] = size(gray);
Imag = zeros(x,y,4);
figure(3);
for h = 1:4
    for i = 1:x
        for j = 1:y
            if gray(i,j) > 0.95*cor(h) && 1.05*cor(h) > gray(i,j)
                Imag(i,j,h) = 255;
            else
                Imag(i,j,h) = 0; 
            end          
        end
    end    
    subplot(2,2,h)
    imshow(Imag(:,:,h))
    hold on
end
quantidade = [0 0 0 0];

for h = 1:4
    for i = 1:x
        for j = 1:y
            if Imag(i,j,h) == 255                
                [Imag(:,:,h), cont] = Greedy_Algorithm(Imag(:,:,h),i,j);
                if cont>40
                    quantidade(h) = quantidade(h) + 1;
                end
            end    
        end
    end  
end

erro = quantidade(:)-15;

function [i, j, list_of_points] = pop_front(list_of_points)
    i = list_of_points(1, 1);
    j = list_of_points(1, 2);
    if isequal(size(list_of_points), [1 2])
       list_of_points = [];
    else
       list_of_points = list_of_points(2:end,:);
    end
end

function [list_of_points] = push_back(list_of_points, i, j)
    list_of_points = [list_of_points; i, j];
end

function [imagem, n_pixels] = Greedy_Algorithm(imagem, i, j)   
    pontos = [i j];
    imagem(i, j) = 0;
    n_pixels = 1;

    while ~isequal(pontos, [])       
       [i, j, pontos] = pop_front(pontos);
       if i + 1 <= size(imagem, 1) && j + 1 <= size(imagem, 2) && imagem(i + 1, j + 1) == 255
          pontos = push_back(pontos, i + 1, j + 1);
          imagem(i + 1, j + 1) = 0;
          n_pixels = n_pixels + 1;
       end
       
       if i - 1 > 0 && j - 1 > 0 && imagem(i - 1, j - 1) == 255 
          pontos = push_back(pontos, i - 1, j - 1);
          imagem(i - 1, j - 1) = 0;
          n_pixels = n_pixels + 1;
       end
              
       if i - 1 > 0 && j + 1 <= size(imagem, 2) && imagem(i - 1, j + 1) == 255 
          pontos = push_back(pontos, i - 1, j + 1);
          imagem(i - 1, j + 1) = 0;
          n_pixels = n_pixels + 1;
       end
       
       if i + 1 <= size(imagem, 1)&& j - 1 > 0 && imagem(i + 1, j - 1) == 255 
          pontos = push_back(pontos, i + 1, j - 1);
          imagem(i + 1, j - 1) = 0;
          n_pixels = n_pixels + 1;
       end

       if j - 1 > 0 && imagem(i, j - 1) == 255 
          pontos = push_back(pontos, i, j - 1);
          imagem(i, j - 1) = 0;
          n_pixels = n_pixels + 1;
       end
       
       if j + 1 <= size(imagem, 2) && imagem(i, j + 1) == 255
          pontos = push_back(pontos, i, j + 1);
          imagem(i, j + 1) = 0;
          n_pixels = n_pixels + 1;
       end

       if i - 1 > 0 && imagem(i - 1, j) == 255 
          pontos = push_back(pontos, i - 1, j);
          imagem(i - 1, j) = 0;
          n_pixels = n_pixels + 1;
       end

       if i + 1 <= size(imagem, 1) && imagem(i + 1, j) == 255 
          pontos = push_back(pontos, i + 1, j);
          imagem(i + 1, j) = 0;
          n_pixels = n_pixels + 1;
       end
    end
end

