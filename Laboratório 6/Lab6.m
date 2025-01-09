clc
clear
close all

I  = iread('castle.png');

t  = 180;
I1 = (I > t);                   
amin = 100;
amax = 5000;
figure(); idisp(I);
boxes = search_components(I1, amin, amax);
figure(); idisp(I1);
figure(); idisp(I);
plot_box(boxes(1, 1), boxes(1, 3)  , boxes(3, 2)  ,  boxes(3, 4), 'g', 'LineWidth', 2);
plot_box(boxes(11, 1), boxes(11, 3)  , boxes(13, 2)  ,  boxes(13, 4), 'g', 'LineWidth', 2);
plot_box(boxes(26, 1), boxes(26, 3)  , boxes(27, 2)  ,  boxes(27, 4), 'g', 'LineWidth', 2);
plot_box(boxes(23, 1), boxes(9, 3)  , boxes(9, 2)  ,  boxes(23, 4), 'g', 'LineWidth', 2);

function box = search_components(image, v_min, v_max) 
    [label, m, ~, cls] = ilabel(image);
    figure(); idisp(label, 'colormap', jet, 'bar')
    
    box = [];
    
    for i = 1 : m 
        im2 = (label==i); 
        [v, u] = find(im2);
        umin = min(u);  
        umax = max(u);
        vmin = min(v); 
        vmax = max(v);
        a = (umax-umin)*(vmax-vmin);
        
        if a >= v_min && a <= v_max && cls(i) == 1
           box = [box; umin-10 umax+10 vmin-5 vmax+10 i]; 
        end 
    end 
end 
