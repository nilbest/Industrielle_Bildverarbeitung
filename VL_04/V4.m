clear; close all; clc;

im = imread('cameraman.tif');
hSize = 11; sigma = 10;
h = fspecial('gaussian', hSize, sigma);

% Randerweiterung
[nbRows, nbCols] = size(im);
radiusH = (hSize-1)/2;
imExt = zeros(nbRows+2*radiusH,nbCols+2*radiusH);
imExt(1+radiusH:nbRows+radiusH, 1+radiusH:nbCols+radiusH) = im;
figure;
imshow(imExt,[]);

% Korrelation (Filterung mit Gauss-Filter)
out = zeros(nbRows, nbCols);
for r = 1+radiusH:nbRows+radiusH
    for c = 1+radiusH:nbCols+radiusH
        sum = 0;
        for i = 1:hSize
            for j = 1:hSize
                sum = sum + h(i,j)*imExt(r+i-radiusH-1,c+j-radiusH-1);
            end
        end
        out(r-radiusH, c-radiusH) = sum;
    end
end
imshowpair(im,out,'montage');

% % Filterung mit Matlab:
% outMatlab = imfilter(im,h);
% figure;
% subplot(1,3,1); imshow(im);
% subplot(1,3,2); imshow(out/255);
% subplot(1,3,3); imshow(outMatlab);