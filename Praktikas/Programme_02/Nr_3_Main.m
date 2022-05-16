clear; clc;
close all;

Schachbrett = imread('Images/Schachbrett.png');

% Kantenfilter(1,Schachbrett);

filter =    [1 0 -1;1 0 -1;1 0 -1]

filtered_picture_2=imfilter(Schachbrett,filter);