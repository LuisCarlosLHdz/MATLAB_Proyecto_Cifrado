function [ MatrizOUT, Fila, Columna ] = Permutar( MatrizIN, num1, num2 )
a = 1;
b = 16;
%----Mapeo
y1 = (num1)*(b-a) + a;
y2 = (num2)*(b-a) + a;
%----Fila o Columna
Fila = round(y1,0);
Columna = round(y2,0);
%----Fila y Columna de los Datos
Dat_F = MatrizIN(Fila,:);
Dat_C = MatrizIN(:,Columna);
%----Intercambio a Columna y Fila
Per_F = reshape(Dat_C,1,16);
Per_C = reshape(Dat_F,16,1);
%----Sustitucion de Filas y Columnas en los Datos
MatrizIN(Fila,:) = Per_F;
MatrizIN(:,Columna) = Per_C;
MatrizOUT = MatrizIN;
end