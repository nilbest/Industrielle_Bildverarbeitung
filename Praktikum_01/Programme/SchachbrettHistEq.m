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

imSchachbrett_histeq = histeq(imSchachbrett);


%Plotten
figure('Name','Aufgabe4: Histogrammausgleich','NumberTitle','off');

subplot(2,2,1); 
imshow(imSchachbrett);
title('Original Schachbrett');
subplot(2,2,2); 
imhist(imSchachbrett);ylim('auto');
title('Histogramm Original');

subplot(2,2,3); 
imshow(imSchachbrett_histeq);
title('Schachbrett mit Histogrammausgleich');
subplot(2,2,4); 
imhist(imSchachbrett_histeq);ylim('auto');
title('Historgramm mit Histogrammausgleich');
