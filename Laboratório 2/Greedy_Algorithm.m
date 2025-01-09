function [image, cont] = Greedy_Algorithm(i, j, A, B, C, BW)                                                 
    BW(A:B, A:C) = 0; 
    imshow(BW)
    
    if BW(i, j+1) == 0 && BW(i, j-1) == 0 && BW(i+1, j) == 0 && BW(i-1, j) == 0 && BW(i-1, j-1) == 0 && BW(i+1, j+1) == 0 && BW(i+1, j-1) == 0 && BW(i-1, j+1) == 0
        i = i + 1;
    end
    
    if sum(sum(BW(A:B,A:C))) == 0
        image = BW;
        cont = 1;
    end   
    
    if sum(sum(BW(A:B,A:C))) > 0                
        if BW(i, j-1) == 1 || BW(i, j-2) == 1
             A = i - 1;
        end
        
        if BW(i, j+1) == 1 || BW(i, j+2) == 1
             B = i + 1;
        end
        
        if BW(i-1, j) == 1 || BW(i-2, j) == 1
            C = j + 1;
        end               
        Greedy_Algorithm(i, j+1, A, B, C, BW)  
    end
    
%     if BW(i, j+1) == 0 && BW(i, j-1) == 0 && BW(i+1, j) == 0 && BW(i-1, j) == 0 && BW(i-1, j-1) == 0 && BW(i+1, j+1) == 0 && BW(i+1, j-1) == 0 && BW(i-1, j+1) == 0
%         image = BW;        
%     end    
%     if BW(i, j+1) == 1 || BW(i, j-1) == 1 || BW(i+1, j) == 1 || BW(i-1, j) == 1 || BW(i-1, j-1) == 1 || BW(i+1, j+1) == 1 || BW(i+1, j-1) == 1 || BW(i-1, j+1) == 1
%         Greedy_Algorithm(i, j+1, BW)
%     end
end