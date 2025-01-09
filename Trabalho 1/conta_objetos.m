function resultado = conta_objetos(I)
resultado = 0;
% Verifica a Quantidade de Objetos no Quadro
[~, m, parents, cls] = ilabel(I, 8);
for j = 1:m
    if parents(j) >= 1 && parents(j) <= 5 && cls(j) == 0
        resultado = resultado + 1;
    end
end