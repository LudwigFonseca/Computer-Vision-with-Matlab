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
