function [ Matriz_S_box ] = S_box_f(  )
%INICIO
%Paso 2
Bits_XOR = zeros(1,16);
LSB = zeros(1,8);
S_box = [];
%Paso 4
l = 1;
while l < 257
    regreso = 0;
    while regreso == 0
        %Paso 5
        %------------- X1 y X2
        x1 = CaosNum();
        x2 = CaosNum();
        %Paso 6
        %-----------------Binario a 16bits
        x1b = round(x1*65535,0);
        x2b = round(x2*65535,0);
        Binx1 = de2bi(x1b,16);
        Binx2 = de2bi(x2b,16);
        %Paso 7
        %-----------------XOR
        for i=1:16
            Bits_XOR(1,i) = xor(Binx1(1,i),Binx2(1,i));
        end
        %Paso 8
        for i=1:8
            LSB(1,i) = Bits_XOR(1,i);
        end
        %Paso 9
        Dec = bi2de(LSB);
        %Paso 10-15
        k = find(S_box == Dec);
        [~,c] = size(k);
        if c >= 1
            regreso = 0;
        else
            S_box(1,l) = Dec;
            regreso = 1;
            l = l + 1;
        end
    end
    %Paso 16
end
%Paso 17
Matriz_S_box = reshape(S_box,[16,16]);
%--------- FIN -----------
end