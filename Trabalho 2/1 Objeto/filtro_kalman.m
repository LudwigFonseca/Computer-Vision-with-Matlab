% % Filtro de Kalman para predição de pontos
% v -> vetor de pontos
% t -> período de amostragem do sinal
function resultado = filtro_kalman(z, T)
sigma_w2 = 0.0001;
sigma_s2 = 100;

F = [1, T; 0, 1];
h = [1; 0];

x_e = zeros(2, numel(z));
x_e(:,1) = h*z(2);

P_e = eye(2);

S_e = [0.25*T^4, 0.5*T^3; 0.5*T^3, T^2]*sigma_s2;

for k = 2:numel(z)
    
    %     Predição
    x_p = F * x_e(:,k-1);
    P_p = F * P_e * F' + S_e;
    
    %     Estimado
    e = z(k) - h' * x_p;
    K = P_p * h / (h' * P_p * h + sigma_w2);
    
    if isnan(z(k))
        x_e(:, k) = x_p;
    else
        x_e(:, k) = x_p + K*e;
    end
    
    P_e = P_p - K * h' * P_p;
end

resultado = x_e(1, end);

end