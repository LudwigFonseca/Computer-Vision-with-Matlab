clc
clear
close all

paus   = iread('BD/naipes/paus.png'  ); mP = imoments(paus); mP =  cell2mat(struct2cell(mP.moments));
copas  = iread('BD/naipes/copas.png' ); mC = imoments(copas); mC =  cell2mat(struct2cell(mC.moments));
espada = iread('BD/naipes/espada.png'); mE = imoments(espada); mE =  cell2mat(struct2cell(mE.moments));
ouro   = iread('BD/naipes/ouro.png'  ); mO = imoments(ouro); mO =  cell2mat(struct2cell(mO.moments));

as     = iread('BD/valor/as.png'    ); mA  = imoments(as); mA =  cell2mat(struct2cell(mA.moments));
dois   = iread('BD/valor/dois.png'  ); mD  = imoments(dois); mD =  cell2mat(struct2cell(mD.moments));
tres   = iread('BD/valor/tres.png'  ); mT  = imoments(tres); mT =  cell2mat(struct2cell(mT.moments));
quatro = iread('BD/valor/quatro.png'); mQ  = imoments(quatro); mQ =  cell2mat(struct2cell(mQ.moments));
cinco  = iread('BD/valor/cinco.png' ); mCi = imoments(cinco); mCi =  cell2mat(struct2cell(mCi.moments));
seis   = iread('BD/valor/seis.png'  ); mS  = imoments(seis); mS =  cell2mat(struct2cell(mS.moments));
sete   = iread('BD/valor/sete.png'  ); mSe = imoments(sete); mSe =  cell2mat(struct2cell(mSe.moments));
oito   = iread('BD/valor/oito.png'  ); mOi = imoments(oito); mOi =  cell2mat(struct2cell(mOi.moments));
nove   = iread('BD/valor/nove.png'  ); mN  = imoments(nove); mN =  cell2mat(struct2cell(mN.moments));
um     = iread('BD/valor/um.png'    ); mU = imoments(um); mU =  cell2mat(struct2cell(mU.moments));
zero   = iread('BD/valor/zero.png'  ); mZ = imoments(zero); mZ =  cell2mat(struct2cell(mZ.moments));
valete = iread('BD/valor/valete.png'); mV  = imoments(valete); mV =  cell2mat(struct2cell(mV.moments));
dama   = iread('BD/valor/dama.png'  ); mDa = imoments(dama); mDa =  cell2mat(struct2cell(mDa.moments));
rei    = iread('BD/valor/rei.png'   ); mR  = imoments(rei); mR =  cell2mat(struct2cell(mR.moments));

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
            objInt = imoments(I2(v_min:v_max, u_min:u_max));
            objInt =  cell2mat(struct2cell(objInt.moments));
            
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
