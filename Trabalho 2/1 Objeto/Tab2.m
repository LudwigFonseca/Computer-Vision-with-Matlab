clc
% clear
close all

% vid = VideoReader('vid.mp4'); %1 Objeto
vid = VideoReader('vid2.mp4'); %1 Objeto com Oclusão Resultado Melhor
% vid = VideoReader('vid3.mp4'); %1 Objeto com Oclusão 

% Número de Objetos é Conhecido
numElementos = 1;

% Inicializa
numFrames = get(vid, 'NumberOfFrames');
uc      = zeros(numElementos, numFrames); 
vc      = zeros(numElementos, numFrames); 
pred    = zeros(numElementos, numFrames); 

mov = read(vid, 1);
objFind = conta_objetos(mov);
uc(1, 1) = objFind(1, 1); 
vc(1, 1) = objFind(1, 2);

% Aplica o Filtro de Kalman no Vídeo
for frame = 2 : numFrames
    
    mov = read(vid, frame);
    
    objFind = conta_objetos(mov);       
    uc(1, frame) = objFind(1, 1); 
    vc(1, frame) = objFind(1, 2);
        
    imshow(mov);      
    hold on;    
    plot(uc(:, 1:frame), vc(:, 1:frame), '*r', 'LineWidth', 10);    
                 
    T = 1/vid.FrameRate;
    pred(1, frame) = filtro_kalman(uc(1, 1:frame), T);            
    pred(2, frame) = filtro_kalman(vc(1, 1:frame), T);            
    
    plot(pred(1, 1:frame), pred(2, 1:frame), '*b', 'LineWidth', 2);    
                
    hold off;
    drawnow;
end