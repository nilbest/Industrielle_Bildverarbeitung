clear; close all;

im = double(imread('Images/Kreis.png'));

hVer = fspecial('Sobel');
hVer = flipud(hVer);
hHor = hVer';

imFiltHor = imfilter(im,hHor);
imFiltVer = imfilter(im,hVer);

% Gradientenberechnung
E = sqrt(imFiltHor.^2 + imFiltVer.^2);
phi = atan2(-imFiltVer,imFiltHor);
figure; imshowpair(E,phi,'montage');

[eG, phiG] = imgradient(im,'prewitt');
figure; imshowpair(eG,phiG,'montage');