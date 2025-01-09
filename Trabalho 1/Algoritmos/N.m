% Cálculo do momento central de ordem p + q
function npq = N(Im, p, q)
    y = 0.5*(p + q) + 1;
    npq = upq(Im, p, q) / upq(Im, 0, 0)^y;
end