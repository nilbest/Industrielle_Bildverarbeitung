clear; clc;
close all;

LBild = uint8(GWVerlauf("Links"));
%imshow(LBild)
RBild = uint8(GWVerlauf("Rechts"));
%imshow(RBild)

%Plotten

figure('Name','Aufgabe 1: Synthetische Bilderzeugung (Grauwertverlauf)','NumberTitle','off');

subplot(1,2,1); imshow(LBild);
subplot(1,2,2); imshow(RBild);
title(subplot(1,2,1),"Grauwertverlauf -->");
title(subplot(1,2,2),"Grauverlauf <--");




