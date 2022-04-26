clear; clc;

imcoin = imread('C:/Daten/Uni_Nils/Programmieren/Industrielle_Bildverarbeitung/Programme/Praktikum_01/Images/coins.png');
imshow(imcoin);

[m,n] = size(imcoin);
amin = min(imcoin(:));
amax = max(imcoin(:));

Zeilenbildgroese=m
Spaltenbildgroese=n
Max_Grauwert = amax
Min_Grauwert = amin



