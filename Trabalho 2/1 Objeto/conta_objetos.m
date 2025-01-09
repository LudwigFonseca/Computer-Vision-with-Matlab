function resultado = conta_objetos(quadro)
resultado = zeros(1, 2);
resultado(1, 1) = NaN; 
resultado(1, 2) = NaN;
bw   = (quadro(:,:,3) - quadro(:,:,1) - quadro(:,:,2) > 10);
Prop = regionprops(logical(bw), 'Area', 'Centroid');
for i = 1:size(Prop, 1)
    if Prop(i).Area > 100                             
        resultado(1, 1) = Prop(i).Centroid(:,1);         
        resultado(1, 2) = Prop(i).Centroid(:,2);         
    end    
end
end
