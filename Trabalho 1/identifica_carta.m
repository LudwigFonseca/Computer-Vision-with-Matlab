function resultado = identifica_carta(Im)
% paus   = iread('BD/naipes/paus.png'  ); mP = iblobs(paus, 'boundary'); mP1 = imoments(paus); [mP, ~] = mP((find(mP.area == mP1.area))).boundary;
% copas  = iread('BD/naipes/copas.png' ); mC = iblobs(copas, 'boundary'); mC1 = imoments(copas); [mC, ~] = mC((find(mC.area == mC1.area))).boundary;
% espada = iread('BD/naipes/espada.png'); mE = iblobs(espada, 'boundary'); mE1 = imoments(espada); [mE, ~] = mE((find(mE.area == mE1.area))).boundary;
% ouro   = iread('BD/naipes/ouro.png'  ); mO = iblobs(ouro, 'boundary'); mO1 = imoments(ouro); [mO, ~] = mO((find(mO.area == mO1.area))).boundary;
%
% as     = iread('BD/valor/as.png'    ); mA  = iblobs(as, 'boundary'); mA1 = imoments(as); [mA, ~] = mA((find(mA.area == mA1.area))).boundary;
% dois   = iread('BD/valor/dois.png'  ); mD  = iblobs(dois, 'boundary'); mD1 = imoments(dois); [mD, ~] = mD((find(mD.area == mD1.area))).boundary;
% tres   = iread('BD/valor/tres.png'  ); mT  = iblobs(tres, 'boundary'); mT1 = imoments(tres); [mT, ~] = mT((find(mT.area == mT1.area))).boundary;
% quatro = iread('BD/valor/quatro.png'); mQ  = iblobs(quatro, 'boundary'); mQ1 = imoments(quatro); [mQ, ~] = mQ((find(mQ.area == mQ1.area))).boundary;
% cinco  = iread('BD/valor/cinco.png' ); mCi = iblobs(cinco, 'boundary'); mCi1 = imoments(cinco); [mCi, ~] = mCi((find(mCi.area == mCi1.area))).boundary;
% seis   = iread('BD/valor/seis.png'  ); mS  = iblobs(seis, 'boundary'); mS1 = imoments(seis); [mS, ~] = mS((find(mS.area == mS1.area))).boundary;
% sete   = iread('BD/valor/sete.png'  ); mSe = iblobs(sete, 'boundary'); mSe1 = imoments(sete); [mSe, ~] = mSe((find(mSe.area == mSe1.area))).boundary;
% oito   = iread('BD/valor/oito.png'  ); mOi = iblobs(oito, 'boundary'); mOi1 = imoments(oito); [mOi, ~] = mOi((find(mOi.area == mOi1.area))).boundary;
% nove   = iread('BD/valor/nove.png'  ); mN  = iblobs(nove, 'boundary'); mN1 = imoments(nove); [mN, ~] = mN((find(mN.area == mN1.area))).boundary;
% um     = iread('BD/valor/um.png'    ); mU = iblobs(um, 'boundary'); mU1 = imoments(um); [mU, ~] = mU((find(mU.area == mU1.area))).boundary;
% zero   = iread('BD/valor/zero.png'  ); mZ = iblobs(zero, 'boundary'); mZ1 = imoments(zero); [mZ, ~] = mZ((find(mZ.area == mZ1.area))).boundary;
% valete = iread('BD/valor/valete.png'); mV  = iblobs(valete, 'boundary'); mV1 = imoments(valete); [mV, ~] = mV((find(mV.area == mV1.area))).boundary;
% dama   = iread('BD/valor/dama.png'  ); mDa = iblobs(dama, 'boundary'); mDa1 = imoments(dama); [mDa, ~] = mDa((find(mDa.area == mDa1.area))).boundary;
% rei    = iread('BD/valor/rei.png'   ); mR  = iblobs(rei, 'boundary'); mR1 = imoments(rei); [mR, ~] = mR((find(mR.area == mR1.area))).boundary;
resultado = [];

load('dados.mat');

[label, m, parents, cls] = ilabel(Im, 8);
carta = zeros(1, 3);
k = 0;
for j = 1:m
    I2 = (label == j);
    if parents(j) >= 1 && parents(j) <= 5 && cls(j) == 0
        
        [v, u] = find(I2); u_min = min(u); u_max = max(u); v_min = min(v); v_max = max(v);
        objInt = iblobs(I2(v_min:v_max, u_min:u_max), 'boundary');
        objInt1 = imoments(I2(v_min:v_max, u_min:u_max));
        [objInt, ~] = objInt((find(objInt.area == objInt1.area))).boundary;
        
        c1  = [RegionFeature.boundmatch(objInt, mP) sum( sqrt( (objInt' - mP').^2 ))];
        c2  = [RegionFeature.boundmatch(objInt, mC) sum( sqrt( (objInt' - mC').^2 ))];
        c3  = [RegionFeature.boundmatch(objInt, mE) sum( sqrt( (objInt' - mE').^2 ))];
        c4  = [RegionFeature.boundmatch(objInt, mO) sum( sqrt( (objInt' - mO').^2 ))];
        
        v1  = [RegionFeature.boundmatch(objInt, mA) sum( sqrt( (objInt' - mA').^2 ))];
        v2  = [RegionFeature.boundmatch(objInt, mD) sum( sqrt( (objInt' - mD').^2 ))];
        v3  = [RegionFeature.boundmatch(objInt, mT) sum( sqrt( (objInt' - mT').^2 ))];
        v4  = [RegionFeature.boundmatch(objInt, mQ) sum( sqrt( (objInt' - mQ').^2 ))];
        v5  = [RegionFeature.boundmatch(objInt, mCi) sum( sqrt( (objInt' - mCi').^2 ))];
        v6  = [RegionFeature.boundmatch(objInt, mS) sum( sqrt( (objInt' - mS').^2 ))];
        v7  = [RegionFeature.boundmatch(objInt, mSe) sum( sqrt( (objInt' - mSe').^2 ))];
        v8  = [RegionFeature.boundmatch(objInt, mOi) sum( sqrt( (objInt' - mOi').^2 ))];
        v9  = [RegionFeature.boundmatch(objInt, mN) sum( sqrt( (objInt' - mN').^2 ))];
        v10 = [RegionFeature.boundmatch(objInt, mV) sum( sqrt( (objInt' - mV').^2 ))];
        v11 = [RegionFeature.boundmatch(objInt, mDa) sum( sqrt( (objInt' - mDa').^2 ))];
        v12 = [RegionFeature.boundmatch(objInt, mR) sum( sqrt( (objInt' - mR').^2 ))];
        
        v13 = [RegionFeature.boundmatch(objInt, mU) sum( sqrt( (objInt' - mU').^2 ))];
        v14 = [RegionFeature.boundmatch(objInt, mZ) sum( sqrt( (objInt' - mZ').^2 ))];
        
        v = [c1(1) c2(1) c3(1) c4(1) v1(1) v2(1) v3(1) v4(1) v5(1) v6(1) v7(1) v8(1) v9(1) v10(1) v11(1) v12(1) v13(1) v14(1)];
        c = [c1(2) c2(2) c3(2) c4(2) v1(2) v2(2) v3(2) v4(2) v5(2) v6(2) v7(2) v8(2) v9(2) v10(2) v11(2) v12(2) v13(2) v14(2)];
        t = [c1(1)/c1(2) c2(1)/c2(2) c3(1)/c3(2) c4(1)/c4(2) v1(1)/v1(2) v2(1)/v2(2) v3(1)/v3(2) v4(1)/v4(2) v5(1)/v5(2) v6(1)/v6(2) v7(1)/v7(2) v8(1)/v8(2) v9(1)/v9(2) v10(1)/v10(2) v11(1)/v11(2) v12(1)/v12(2) v13(1)/v13(2) v14(1)/v14(2)];
        fv = find(t == max(t));
        
        k = k + 1;
        carta(k) = fv;
    end
end

if carta(1) == 5
    switch carta(2)
        case 1
            resultado = 'A paus';
        case 2
            resultado = 'A copas';
        case 3
            resultado = 'A espada';
        case 4
            resultado = 'A ouro';
    end
end

if carta(1) == 6
    switch carta(2)
        case 1
            resultado = 'Dois paus';
        case 2
            resultado = 'Dois copas';
        case 3
            resultado = 'Dois espada';
        case 4
            resultado = 'Dois ouro';
    end
end

if carta(1) == 7
    switch carta(2)
        case 1
            resultado = 'Tres paus';
        case 2
            resultado = 'Tres copas';
        case 3
            resultado = 'Tres espada';
        case 4
            resultado = 'Tres ouro';
    end
end

if carta(1) == 8
    switch carta(2)
        case 1
            resultado = 'Quatro paus';
        case 2
            resultado = 'Quatro copas';
        case 3
            resultado = 'Quatro espada';
        case 4
            resultado = 'Quatro ouro';
    end
end

if carta(1) == 9
    switch carta(2)
        case 1
            resultado = 'Cinco paus';
        case 2
            resultado = 'Cinco copas';
        case 3
            resultado = 'Cinco espada';
        case 4
            resultado = 'Cinco ouro';
    end
end

if carta(1) == 10
    switch carta(2)
        case 1
            resultado = 'Seis paus';
        case 2
            resultado = 'Seis copas';
        case 3
            resultado = 'Seis espada';
        case 4
            resultado = 'Seis ouro';
    end
end

if carta(1) == 11
    switch carta(2)
        case 1
            resultado = 'Sete paus';
        case 2
            resultado = 'Sete copas';
        case 3
            resultado = 'Sete espada';
        case 4
            resultado = 'Sete ouro';
    end
end

if carta(1) == 12
    switch carta(2)
        case 1
            resultado = 'Oito paus';
        case 2
            resultado = 'Oito copas';
        case 3
            resultado = 'Oito espada';
        case 4
            resultado = 'Oito ouro';
    end
end

if carta(1) == 13
    switch carta(2)
        case 1
            resultado = 'Nove paus';
        case 2
            resultado = 'Nove copas';
        case 3
            resultado = 'Nove espada';
        case 4
            resultado = 'Nove ouro';
    end
end

if carta(1) == 14
    switch carta(2)
        case 1
            resultado = 'J paus';
        case 2
            resultado = 'J copas';
        case 3
            resultado = 'J espada';
        case 4
            resultado = 'J ouro';
    end
end

if carta(1) == 15
    switch carta(2)
        case 1
            resultado = 'Q paus';
        case 2
            resultado = 'Q copas';
        case 3
            resultado = 'Q espada';
        case 4
            resultado = 'Q ouro';
    end
end

if carta(1) == 16
    switch carta(2)
        case 1
            resultado = 'K paus';
        case 2
            resultado = 'K copas';
        case 3
            resultado = 'K espada';
        case 4
            resultado = 'K ouro';
    end
end

if carta(1) == 17
    switch carta(3)
        case 1
            resultado = 'Dez paus';
        case 2
            resultado = 'Dez copas';
        case 3
            resultado = 'Dez espada';
        case 4
            resultado = 'Dez ouro';
    end
end

if sum(carta) <= 0 || sum(carta) >= 40
    resultado = 'Carta Não Classificada';
end

if isequal(resultado, [])
    resultado = 'Carta Não Classificada';
end

end