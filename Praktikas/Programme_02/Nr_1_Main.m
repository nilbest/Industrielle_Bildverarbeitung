clear; clc;
close all;

%Nr.1
coinsWM = imread('Images/coinsWM.png');
WMExtract(coinsWM);




%Nr.2
coins = imread('Images/coins.png');
watermark1 = imread('Images/WM.png');
WMEmbed(coins,watermark1);

%test=imread('Export/myCoinsWM.png');
%figure;
%imshow(test);

