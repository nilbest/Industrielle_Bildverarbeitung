clear; clc;
close all;

im = imread("Images\sine_shaded_text_small.png");
[nbRows, nbCols] = size(im);
max_nbRows=nbRows-10;
max_nbCols=nbCols-10;
min_nbRows=11;
min_nbCols=11;

pixelscan=10;

% M=zeros(21);
imBin = im;

for r=min_nbRows:max_nbRows
    for c=min_nbCols:max_nbCols

        %Schleifen zum erstellen der 21*21 Matrix mit Auslesen aus im
        M=[im(r-10:r+10,c-10:c+10)];
        mittelwert=mean(M);
        standardabweichung=std2(M);
        k = -0.00000001; %k(-1:0) möglich (fast 0 ist optimal)
        T = mittelwert+k*standardabweichung;

        %Schwellwert
        ath = T;
        
        %Problem die Werte werden nicht geändert!!!
        %Theoretisch schon bei T?
        if im(r,c)<=ath
            imBin(r,c)=0;
        else
            imBin(r,c)=255;
        end

    end
end

figure('Name','Aufgabe 1: Farbbildverarbeitung Ergebnis','NumberTitle','off'); 
imshowpair(im,imBin,'montage');
title('Original Bild & Auswahl der Pixel');

