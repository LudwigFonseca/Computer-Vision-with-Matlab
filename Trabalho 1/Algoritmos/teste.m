clc
clear
close all

paus   = iread('BD/naipes/paus.png'  ); mP = iblobs(paus, 'boundary'); mP1 = imoments(paus); mP = [sum(mP((find(mP.area == mP1.area))).edge(1,:)) sum(mP((find(mP.area == mP1.area))).edge(2,:))];
copas  = iread('BD/naipes/copas.png' ); mC = iblobs(copas, 'boundary'); mC1 = imoments(copas); mC = [sum(mC((find(mC.area == mC1.area))).edge(1,:)) sum(mC((find(mC.area == mC1.area))).edge(2,:))];
espada = iread('BD/naipes/espada.png'); mE = iblobs(espada, 'boundary'); mE1 = imoments(espada); mE = [sum(mE((find(mE.area == mE1.area))).edge(1,:)) sum(mE((find(mE.area == mE1.area))).edge(2,:))];
ouro   = iread('BD/naipes/ouro.png'  ); mO = iblobs(ouro, 'boundary'); mO1 = imoments(ouro); mO = [sum(mO((find(mO.area == mO1.area))).edge(1,:)) sum(mO((find(mO.area == mO1.area))).edge(2,:))];

as     = iread('BD/valor/as.png'    ); mA  = iblobs(as, 'boundary'); mA1 = imoments(as); mA = [sum(mA((find(mA.area == mA1.area))).edge(1,:)) sum(mA((find(mA.area == mA1.area))).edge(2,:))];
dois   = iread('BD/valor/dois.png'  ); mD  = iblobs(dois, 'boundary'); mD1 = imoments(dois); mD = [sum(mD((find(mD.area == mD1.area))).edge(1,:)) sum(mD((find(mD.area == mD1.area))).edge(2,:))];
tres   = iread('BD/valor/tres.png'  ); mT  = iblobs(tres, 'boundary'); mT1 = imoments(tres); mT = [sum(mT((find(mT.area == mT1.area))).edge(1,:)) sum(mT((find(mT.area == mT1.area))).edge(2,:))];
quatro = iread('BD/valor/quatro.png'); mQ  = iblobs(quatro, 'boundary'); mQ1 = imoments(quatro); mQ = [sum(mQ((find(mQ.area == mQ1.area))).edge(1,:)) sum(mQ((find(mQ.area == mQ1.area))).edge(2,:))];
cinco  = iread('BD/valor/cinco.png' ); mCi = iblobs(cinco, 'boundary'); mCi1 = imoments(cinco); mCi = [sum(mCi((find(mCi.area == mCi1.area))).edge(1,:)) sum(mCi((find(mCi.area == mCi1.area))).edge(2,:))];
seis   = iread('BD/valor/seis.png'  ); mS  = iblobs(seis, 'boundary'); mS1 = imoments(seis); mS = [sum(mS((find(mS.area == mS1.area))).edge(1,:)) sum(mS((find(mS.area == mS1.area))).edge(2,:))];
sete   = iread('BD/valor/sete.png'  ); mSe = iblobs(sete, 'boundary'); mSe1 = imoments(sete); mSe = [sum(mSe((find(mSe.area == mSe1.area))).edge(1,:)) sum(mSe((find(mSe.area == mSe1.area))).edge(2,:))];
oito   = iread('BD/valor/oito.png'  ); mOi = iblobs(oito, 'boundary'); mOi1 = imoments(oito); mOi = [sum(mOi((find(mOi.area == mOi1.area))).edge(1,:)) sum(mOi((find(mOi.area == mOi1.area))).edge(2,:))];
nove   = iread('BD/valor/nove.png'  ); mN  = iblobs(nove, 'boundary'); mN1 = imoments(nove); mN = [sum(mN((find(mN.area == mN1.area))).edge(1,:)) sum(mN((find(mN.area == mN1.area))).edge(2,:))];
um     = iread('BD/valor/um.png'    ); mU = iblobs(um, 'boundary'); mU1 = imoments(um); mU = [sum(mU((find(mU.area == mU1.area))).edge(1,:)) sum(mU((find(mU.area == mU1.area))).edge(2,:))];
zero   = iread('BD/valor/zero.png'  ); mZ = iblobs(zero, 'boundary'); mZ1 = imoments(zero); mZ = [sum(mZ((find(mZ.area == mZ1.area))).edge(1,:)) sum(mZ((find(mZ.area == mZ1.area))).edge(2,:))];
valete = iread('BD/valor/valete.png'); mV  = iblobs(valete, 'boundary'); mV1 = imoments(valete); mV = [sum(mV((find(mV.area == mV1.area))).edge(1,:)) sum(mV((find(mV.area == mV1.area))).edge(2,:))];
dama   = iread('BD/valor/dama.png'  ); mDa = iblobs(dama, 'boundary'); mDa1 = imoments(dama); mDa = [sum(mDa((find(mDa.area == mDa1.area))).edge(1,:)) sum(mDa((find(mDa.area == mDa1.area))).edge(2,:))];
rei    = iread('BD/valor/rei.png'   ); mR  = iblobs(rei, 'boundary'); mR1 = imoments(rei); mR = [sum(mR((find(mR.area == mR1.area))).edge(1,:)) sum(mR((find(mR.area == mR1.area))).edge(2,:))];

listAllFiles = dir('Level_1');
resultado = zeros(1, 52);
for i = 3:size(listAllFiles, 1)
    Im = iread( strcat('Level_1/',listAllFiles(i).name), 'gray', 'double');
    [v, u] = find(Im); u_min = min(u); v_min = min(v);
    [label, m, parents, cls] = ilabel(Im(v_min+15:v_min+85, u_min+11:u_min+37), 8);
    carta = zeros(1, 3);
    k = 0;
    %     idisp(Im)
    for j = 1:m
        I2 = (label == j);
        if parents(j) >= 1 && parents(j) <= 5 && cls(j) == 0
            
            [v, u] = find(I2); u_min = min(u); u_max = max(u); v_min = min(v); v_max = max(v);
            objInt  = iblobs(I2(v_min:v_max, u_min:u_max), 'boundary'); objInt1 = imoments(I2(v_min:v_max, u_min:u_max)); objInt = [sum(objInt((find(objInt.area == objInt1.area))).edge(1,:)) sum(objInt((find(objInt.area == objInt1.area))).edge(2,:))];
            
            c1  = sum( sqrt( (objInt - mP).^2 ));
            c2  = sum( sqrt( (objInt - mC).^2 ));
            c3  = sum( sqrt( (objInt - mE).^2 ));
            c4  = sum( sqrt( (objInt - mO).^2 ));
            
            v1  = sum( sqrt( (objInt - mA).^2 ));
            v2  = sum( sqrt( (objInt - mD).^2 ));
            v3  = sum( sqrt( (objInt - mT).^2 ));
            v4  = sum( sqrt( (objInt - mQ).^2 ));
            v5  = sum( sqrt( (objInt - mCi).^2 ));
            v6  = sum( sqrt( (objInt - mS).^2 ));
            v7  = sum( sqrt( (objInt - mSe).^2 ));
            v8  = sum( sqrt( (objInt - mOi).^2 ));
            v9  = sum( sqrt( (objInt - mN).^2 ));
            v10 = sum( sqrt( (objInt - mV).^2 ));
            v11 = sum( sqrt( (objInt - mDa).^2 ));
            v12 = sum( sqrt( (objInt - mR).^2 ));
            
            v13 = sum( sqrt( (objInt - mU).^2 ));
            v14 = sum( sqrt( (objInt - mZ).^2 ));
            
            v = [c1 c2 c3 c4 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14];
            fv = find(v == min(v));
            k = k + 1;
            carta(k) = fv;
        end
    end
    
    if carta(1) == 5
        switch carta(2)
            case 1
                r = 'A_paus.png';
            case 2
                r = 'A_copas.png';
            case 3
                r = 'A_espada.png';
            case 4
                r = 'A_ouro.png';
        end
    end
    
    if carta(1) == 6
        switch carta(2)
            case 1
                r = 'Dois_paus.png';
            case 2
                r = 'Dois_copas.png';
            case 3
                r = 'Dois_espada.png';
            case 4
                r = 'Dois_ouro.png';
        end
    end
    
    if carta(1) == 7
        switch carta(2)
            case 1
                r = 'Tres_paus.png';
            case 2
                r = 'Tres_copas.png';
            case 3
                r = 'Tres_espada.png';
            case 4
                r = 'Tres_ouro.png';
        end
    end
    
    if carta(1) == 8
        switch carta(2)
            case 1
                r = 'Quatro_paus.png';
            case 2
                r = 'Quatro_copas.png';
            case 3
                r = 'Quatro_espada.png';
            case 4
                r = 'Quatro_ouro.png';
        end
    end
    
    if carta(1) == 9
        switch carta(2)
            case 1
                r = 'Cinco_paus.png';
            case 2
                r = 'Cinco_copas.png';
            case 3
                r = 'Cinco_espada.png';
            case 4
                r = 'Cinco_ouro.png';
        end
    end
    
    if carta(1) == 10
        switch carta(2)
            case 1
                r = 'Seis_paus.png';
            case 2
                r = 'Seis_copas.png';
            case 3
                r = 'Seis_espada.png';
            case 4
                r = 'Seis_ouro.png';
        end
    end
    
    if carta(1) == 11
        switch carta(2)
            case 1
                r = 'Sete_paus.png';
            case 2
                r = 'Sete_copas.png';
            case 3
                r = 'Sete_espada.png';
            case 4
                r = 'Sete_ouro.png';
        end
    end
    
    if carta(1) == 12
        switch carta(2)
            case 1
                r = 'Oito_paus.png';
            case 2
                r = 'Oito_copas.png';
            case 3
                r = 'Oito_espada.png';
            case 4
                r = 'Oito_ouro.png';
        end
    end
    
    if carta(1) == 13
        switch carta(2)
            case 1
                r = 'Nove_paus.png';
            case 2
                r = 'Nove_copas.png';
            case 3
                r = 'Nove_espada.png';
            case 4
                r = 'Nove_ouro.png';
        end
    end
    
    if carta(1) == 14
        switch carta(2)
            case 1
                r = 'J_paus.png';
            case 2
                r = 'J_copas.png';
            case 3
                r = 'J_espada.png';
            case 4
                r = 'J_ouro.png';
        end
    end
    
    if carta(1) == 15
        switch carta(2)
            case 1
                r = 'Q_paus.png';
            case 2
                r = 'Q_copas.png';
            case 3
                r = 'Q_espada.png';
            case 4
                r = 'Q_ouro.png';
        end
    end
    
    if carta(1) == 16
        switch carta(2)
            case 1
                r = 'K_paus.png';
            case 2
                r = 'K_copas.png';
            case 3
                r = 'K_espada.png';
            case 4
                r = 'K_ouro.png';
        end
    end
    
    if carta(1) == 17
        switch carta(3)
            case 1
                r = 'Dez_paus.png';
            case 2
                r = 'Dez_copas.png';
            case 3
                r = 'Dez_espada.png';
            case 4
                r = 'Dez_ouro.png';
        end
    end
    if i > 2
        resultado(1, i-2) = strcmp(r, listAllFiles(i).name);
    end
    %     r
    %     pause(1);
end

acertos = (size(find(resultado == 1),2)/52)*100
erros = (size(find(resultado == 0),2)/52)*100