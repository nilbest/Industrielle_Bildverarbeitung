clear; clc;
close all;

Schachbrett = imread('Images/Schachbrett.png');

Kantenfilter(1,Schachbrett);
Kantenfilter(2,Schachbrett);
Kantenfilter(3,Schachbrett);

%Info die Darstellung der Bilder in klein wird je nach größe der Bilder
%falsch gerendert. Ein manuelles vergrößern / verkleinern der Fenster löst dies!!!
