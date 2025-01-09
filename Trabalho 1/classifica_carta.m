function resultado = classifica_carta(I)
I2 = icanny(I);

I2 = bwconvhull(I2,'objects', 8); I2 = bwconvhull(I2,'objects', 8); I2 = bwconvhull(I2,'objects', 8);
I2 = bwconvhull(I2,'objects', 8); I2 = bwconvhull(I2,'objects', 8);

[label, m, ~, cls] = ilabel(I2, 8);
for i = 1:m
    I2 = (label == i);
    if cls(i) == 1
        
        % Segmenta a Carta
        [v, u] = find(I2); u_min = min(u); u_max = max(u); v_min = min(v); v_max = max(v);
        incArea = 4; u_min = u_min - incArea; v_min = v_min - incArea; u_max = u_max + incArea; v_max = v_max + incArea;
        Im = I(v_min:v_max, u_min:u_max);
        % Algoritmo para Segmentar e Dimensionar a Carta
        Im = rotaciona_carta(Im);
        
        idisp(Im)
        
        % Filtro do Quadro de Interesse do Algoritmo
        [v, u] = find(Im); u_min = min(u); v_min = min(v);
        Realce = (1/32)*[1 3 1; 3 16 3; 1 3 1];
        %         Realce = (1/8)*[0 1 0; 1 4 1; 0 1 0];
        Im = imfilter(Im(v_min+12:v_min+80, u_min+6:u_min+34), Realce);
        Im = imbinarize(Im);
        
        % Identificação da Quantidade de Objetos no Quadro de Interesse
        if conta_objetos(Im) < 2
            linha = 0;
            n = size(Im, 1);
            min_size = sum(sum(Im));
            for k = (round(n/2)):n
                if size(find(Im(k, :) == 0), 2) >= 2
                    if  min_size > size(find(Im(k, :) == 0), 2)
                        min_size = size(find(Im(k, :) == 0), 2);
                        linha = k;
                    end
                end
            end
            linha = linha - 1;
            Im(linha, :) = 1 ;
        end
        
        % Identificação da Carta
        resultado = identifica_carta(Im)
        
    end
end
end