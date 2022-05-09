% clear; close all;
% 
% im = double(imread('coins.png'));
% 
% hVer = fspecial('Sobel');
% hVer = flipud(hVer);
% hHor = hVer';
% 
% imFiltHor = imfilter(im,hHor);
% imFiltVer = imfilter(im,hVer);
% 
% figure;
% subplot(1,3,1); imshow(im,[]);
% subplot(1,3,2); imshow(imFiltHor,[]);
% subplot(1,3,3); imshow(imFiltVer,[]);
% 
% th = 50;
% imEdgeHor = imFiltHor;
% imEdgeHor(find(imFiltHor >= th)) = 255;
% imEdgeHor(find(imFiltHor < th)) = 0;
% figure; imshowpair(imFiltHor, imEdgeHor,'montage');
% 
% imEdgeHor2 = edge(imFiltHor,'sobel');
% figure; imshowpair(imFiltHor, imEdgeHor2,'montage');
% 
% % Gradientenberechnung
% E = sqrt(imFiltHor.^2 + imFiltVer.^2);
% phi = atan2(-imFiltVer,imFiltHor);
% figure; imshowpair(E,phi,'montage');

%Unsharp Masking
imOrg = double(imread('Images/blurryMoon.tif'));
imshow(imOrg,[]);
% Variante1:
hSizeGauss = 11;
sigma = 5;
hGauss = fspecial('gaussian',hSizeGauss,sigma);
imBlur = imfilter(imOrg,hGauss);
mask = imOrg-imBlur;
imSharp1 = imOrg + mask;

%Variante 2
% Bilde 2. Ableitung:
hLap = [-1 -1 -1; -1 8 -1; -1 -1 -1];
imLap = imfilter(imOrg,hLap);
mask = imLap;
imSharp2 = imOrg + mask;

figure;
subplot(1,3,1); imshow(imOrg,[0 255]);
subplot(1,3,2); imshow(imSharp1,[0 255]);
subplot(1,3,3); imshow(imSharp2,[0 255]);