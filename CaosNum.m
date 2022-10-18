function [ NumRand ] = CaosNum()
%Parametros
d = 100;
r = 4;
xi = rand; %semilla
%Funcion
A = d*xi*exp(((r+9)*(1-xi))-((r+5)*(xi)*(1-xi)));
NumRand = mod(A,1);
end