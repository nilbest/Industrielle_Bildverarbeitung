clear; clc;
close all;

figure('Name','Original Bild Schachbrett','NumberTitle','off');
imSchachbrett = imread('C:/00_Uni_Laptop/Programmieren/Industrielle_Bildverarbeitung/Praktikum_01/Images/Schachbrett.png');
imshow(imSchachbrett);

%%
close all;
%Nr.1
figure('Name','Schachbrett mit Histogramm','NumberTitle','off');

subplot(1,2,1); imshow(imSchachbrett);
subplot(1,2,2); imhist(imSchachbrett);ylim('auto');

%%
close all;
%Nr.2

anz_Abstufungen = 16;
anz_Graustufen = anz_Abstufungen-1; %Da 16 Klötze und einer gleich Weiß
new_Graustufen = 256/anz_Graustufen/10;
new_imSchachbrett = imSchachbrett;
[x,y] = size(new_imSchachbrett);
amin = min(new_imSchachbrett(:));
amax = max(new_imSchachbrett(:));


for i=1:x
    for j=1:y
        new_imSchachbrett(i,j) =(imSchachbrett(i,j)-amin) .* new_Graustufen;
    end
end

%Plotten
figure('Name','Aufgabe 3: Grauwertskalierung','NumberTitle','off');

subplot(2,2,1); 
imshow(imSchachbrett);
title('Original Schachbrett');
subplot(2,2,2); 
imhist(imSchachbrett);ylim('auto');
title('Histogramm Original');

subplot(2,2,3); 
imshow(new_imSchachbrett);
title('Schachbrett Grauwerttransformiert');
subplot(2,2,4); 
imhist(new_imSchachbrett);ylim('auto');
title('Historgramm Grauwerttransformiert');
