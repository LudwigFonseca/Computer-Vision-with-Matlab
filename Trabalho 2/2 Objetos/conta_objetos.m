function resultado = conta_objetos(quadro)
resultado = zeros(2, 2);
resultado(2, 1) = NaN; 
resultado(2, 2) = NaN;
j = 1;
bw   = (quadro(:,:,3) - quadro(:,:,1) - quadro(:,:,2) > 10);
Prop = regionprops(logical(bw), 'Area', 'Centroid');
for i = 1:size(Prop, 1)
    if Prop(i).Area > 100                             
        resultado(j, 1) = Prop(i).Centroid(:,1);         
        resultado(j, 2) = Prop(i).Centroid(:,2);
        j = j + 1;
    end    
end
end
