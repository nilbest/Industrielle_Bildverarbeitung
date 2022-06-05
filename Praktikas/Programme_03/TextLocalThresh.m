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
        %k = -0;
        %k = -0.1;
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

figure('Name','Aufgabe 2.1: Local Thresholding','NumberTitle','off'); 
imshowpair(im,imBin,'montage');
title('Original Bild & Verbessertes Bild');

%%
%Teil 2

Struct=[0,1,0;
    1,1,1;
    0,1,0];

% SE = offsetstrel(Struct);
% figure('Name','Aufgabe 2.2.1: Local Thresholding','NumberTitle','off'); 
% subplot(1,3,1); imshow(im); title("Original Bild");
% subplot(1,3,2); imshow(imBin); title("Verbessertes Bild");
% BWopen = imerode(imBin,SE);
% %BWopen = imopen(BWopen1,SE);
% subplot(1,3,3); imshow(BWopen); title("Verbesserung via Morph");

SE = strel(Struct);
figure('Name','Aufgabe 2.2.2: Local Thresholding','NumberTitle','off'); 
subplot(1,3,1); imshow(im); title("Original Bild");
subplot(1,3,2); imshow(imBin); title("Verbessertes Bild");
BWopen = imerode(imBin,SE);
%BWopen = imopen(imBin,SE);
subplot(1,3,3); imshow(BWopen); title("Verbesserung via Morph");

%Unklar welches besser aussieht!!! 2.2.1 ist dicker und 2.2.2 ist dünner
%Außerdem ist das halbe morphen gefühlt besser lesbar als das fertige
%Morphen, hier auskommentiert...