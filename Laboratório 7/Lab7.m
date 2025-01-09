clc
clear
close all

% Carrega as Imns
I         = iread('LAB2_FIG.png');
figure();idisp(I);
I         = (I == 1);
circulo   = iread('referencia_circulo.png');
estrela   = iread('referencia_estrela.png');
pentagono = iread('referencia_pentagono.png');
quadrado  = iread('referencia_quadrado.png');

% Regiões de interesse
[label, m, parents, cls] = ilabel(I);
% figure(); idisp(label, 'colormap', jet, 'bar')

% Calcula o momento de inércia da região de interesse
[v, u] = find(circulo); u_min = min(u); u_max = max(u); v_min = min(v); v_max = max(v);
mC = momento(circulo(v_min:v_max, u_min:u_max));

[v, u] = find(estrela); u_min = min(u); u_max = max(u); v_min = min(v); v_max = max(v);
mE = momento(estrela(v_min:v_max, u_min:u_max));

[v, u] = find(pentagono); u_min = min(u); u_max = max(u); v_min = min(v); v_max = max(v);
mP = momento(pentagono(v_min:v_max, u_min:u_max));


mQ = momento(quadrado(v_min:v_max, u_min:u_max));

% Compara o momento de inércia [v, u] = find(quadrado); u_min = min(u); u_max = max(u); v_min = min(v); v_max = max(v);
objetos = (1:1:m-1);

figure(); idisp(I); hold on

for i = 1:m-1
    I2 = (label == objetos(i));
    
    [v, u] = find(I2); 
    u_min = min(u); u_max = max(u); v_min = min(v); v_max = max(v);
    
    phiO = momento(I2(v_min:v_max, u_min:u_max));
    
    c1 = sum( sqrt( (phiO - mC).^2 ));
    c2 = sum( sqrt( (phiO - mE).^2 ));
    c3 = sum( sqrt( (phiO - mP).^2 ));
    c4 = sum( sqrt( (phiO - mQ).^2 ));
    c = [c1 c2 c3 c4];
    
    f = find(c == min(c));
    
    if f == 1
        plot_box(u_min, v_min, u_max, v_max, 'r', 'LineWidth', 2)
    end
    
    if f == 2
       plot_box(u_min, v_min, u_max, v_max, 'g', 'LineWidth', 2)
    end
    
    if f == 3
        plot_box(u_min, v_min, u_max, v_max, 'b', 'LineWidth', 2)
    end
    
    if f == 4
        plot_box(u_min, v_min, u_max, v_max, 'm', 'LineWidth', 2)
        
    end
end

% Função de momentos das regiões de interesse
function phi = momento(Im)     
    phi = zeros(1, 7);            
    phi(1) = N(Im, 2, 0) + N(Im, 0, 2);    
    phi(2) = ( N(Im, 2, 0) - N(Im, 0, 2) )^2 + ( 4*N(Im, 1, 1) )^2;    
    phi(3) = ( N(Im, 3, 0) - 3*N(Im, 1, 2) )^2 + ( 3*N(Im, 2, 1) - N(Im, 0, 3) )^2;
    phi(4) = ( N(Im, 3, 0) + N(Im, 1, 2) )^2 + ( N(Im, 2, 1) + N(Im, 0, 3) )^2;      
    phi(5) = ( N(Im, 3, 0) - 3*N(Im, 1, 2))*( N(Im, 3, 0) + N(Im, 1, 2) )*( ( N(Im, 3, 0) + N(Im, 1, 2) )^2 - 3*( N(Im, 2, 1) + N(Im, 0, 3) )^2 ) + ( 3*N(Im, 2, 1) - N(Im, 0, 3) )*( N(Im, 2, 1) + N(Im, 0, 3))*( 3*( N(Im, 3, 0) + N(Im, 1, 2) )^2 - ( N(Im, 2, 1) + N(Im, 0, 3)^2));
    phi(6) = ( N(Im, 2, 0) - N(Im, 0, 2))*( ( N(Im, 3, 0) + N(Im, 1, 2) )^2 - ( N(Im, 2, 1) + N(Im, 0, 3) )^2 ) + 4*( N(Im, 1, 1) )*( N(Im, 3, 0) + N(Im, 1, 2) )*( N(Im, 2, 1) + N(Im, 0, 3));
    phi(7) = ( 3*N(Im, 2, 1) - N(Im, 0, 3))*( N(Im, 3, 0) + N(Im, 1, 2) )*( ( N(Im, 3, 0) + N(Im, 1, 2) )^2 - 3*( N(Im, 2, 1) + N(Im, 0, 3) )^2 ) + ( 3*N(Im, 1, 2) - N(Im, 3, 0) )*( N(Im, 2, 1) + N(Im, 0, 3))*( 3*( N(Im, 3, 0) + N(Im, 1, 2) )^2 - ( N(Im, 2, 1) + N(Im, 0, 3)^2));        
end 

% Cálculo do momento central de ordem p + q
function npq = N(Im, p, q)
    y = 0.5*(p + q) + 1;
    npq = upq(Im, p, q) / upq(Im, 0, 0)^y;
end
