%%
clc
clear
close all

% vid = VideoReader('vid4.mp4'); %2 Objetos
vid = VideoReader('vid5.mp4'); %2 Objetos com Oclusão 

% Inicializa
numFrames = get(vid, 'NumberOfFrames');

% Número de Objetos
numElementos = 2;

uc        = zeros(numElementos, numFrames); 
vc        = zeros(numElementos, numFrames); 
pred      = zeros(2*numElementos, numFrames);
distancia = [NaN, NaN; NaN NaN];

mov  = read(vid, 1);
objFind = conta_objetos(mov);
uc(1, 1) = objFind(1, 1); vc(1, 1) = objFind(1, 2);
uc(2, 1) = objFind(2, 1); vc(2, 1) = objFind(2, 2);

% Aplica o Filtro de Kalman no Vídeo
for frame = 2 : numFrames
    
    mov = read(vid, frame);
    
    objFind = conta_objetos(mov);    
    
    D1 = sqrt((pred(1, frame-1) - objFind(1, 1))^2 +  (pred(3, frame-1) - objFind(1, 2))^2 );
    D2 = sqrt((pred(1, frame-1) - objFind(2, 1))^2 +  (pred(3, frame-1) - objFind(2, 2))^2 );
    D3 = sqrt((pred(2, frame-1) - objFind(1, 1))^2 +  (pred(4, frame-1) - objFind(1, 2))^2 );
    D4 = sqrt((pred(2, frame-1) - objFind(2, 1))^2 +  (pred(4, frame-1) - objFind(2, 2))^2 );
    distancia = [D1 D3; D2 D4];

    [a, ~] = assignmentoptimal(distancia);
    
    uc(1, frame) = NaN; vc(1, frame) = NaN;
    uc(2, frame) = NaN; vc(2, frame) = NaN;
    
    if (a(1) > 0)
        uc(1, frame) = objFind(a(1), 1); vc(1, frame) = objFind(a(1), 2);
    end
    
    if (a(2) > 0)
        uc(2, frame) = objFind(a(2), 1); vc(2, frame) = objFind(a(2), 2);
    end
    
    imshow(mov);  
    
    hold on;
    plot(uc(:, 1:frame), vc(:, 1:frame), '*r', 'LineWidth', 10);    
                 
    T = 1/vid.FrameRate;
    
    pred(1,frame) = filtro_kalman(uc(1, 1:frame), T);    
    pred(2,frame) = filtro_kalman(uc(2, 1:frame), T);
    
    pred(3,frame) = filtro_kalman(vc(1, 1:frame), T); 
    pred(4,frame) = filtro_kalman(vc(2, 1:frame), T);           
        
    plot(pred(1, 1:frame), pred(3, 1:frame), '*b', 'LineWidth', 2);    
    plot(pred(2, 1:frame), pred(4, 1:frame), '*g', 'LineWidth', 2);     
    
    hold off;
    drawnow;
end


