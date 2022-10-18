clear
clc
Datos = zeros(1,256);
prompt = 'Texto: ';  
x = input(prompt,'s');
%Convierte de Caracteres a Unicode
ValUnicode = double(x);
%-------Matriz de Datos
[~,c] = size(ValUnicode);
for i=1:c
    Datos(1,i) =  ValUnicode(1,i);
end
Datos = (reshape(Datos,16,16)).';
%-------Permutar
%----Key 1
Key1_1 = CaosNum();
Key1_2 = CaosNum();
%----Permutar 1
[Perm1, F1, C1] = Permutar(Datos,Key1_1,Key1_2);
%----Key 2
Key2_1 = CaosNum();
Key2_2 = CaosNum();
%----Permutar 2
[Perm2, F2, C2] = Permutar(Perm1,Key2_1,Key2_2);
%----S-box
Sbox = S_box_f();
%-------Sustitucion Sus
Sus = zeros(16,16);
for s1 = 1:16
    for s2 = 1:16
        Dat = Perm2(s1,s2);
        Bin = dec2bin(Dat,8);
        Fil_Bin = [Bin(1,1) Bin(1,2) Bin(1,7) Bin(1,8)];
        Col_Bin = [Bin(1,3) Bin(1,4) Bin(1,5) Bin(1,6)];
        Fil = bin2dec(Fil_Bin);
        Col = bin2dec(Col_Bin);
        Sus(s1,s2) = Sbox(Fil+1,Col+1);
    end
end
%%-------Dato Final
Vector = zeros(1,c);
resto = rem(c,16);
rep = (c - resto)/16;
for i = 1:rep
    for l = 1:16
        Vector(1,l+(16*(i-1))) = Sus(i,l);
    end
end
[~,d] = size(Vector);
for i = 1:resto
    Vector(1,(c-resto+i)) = Sus(rep+1,i);
end
%----Mensaje Final
cifrado = char(Vector);
display(cifrado)