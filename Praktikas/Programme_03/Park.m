clear; clc;
close all;
%function Bild = Park()
%function Park()

im = imread("Images\ParkGraySmall.png");
h=figure('Name','Aufgabe 1: Farbbildverarbeitung','NumberTitle','off'); 
imshow(im);
title('Original Bild & Auswahl der Pixel');

[x, y]=getpts(h);

x=uint32(x);
y=uint32(y);

im_Red=im(:,:,1);
im_Green=im(:,:,2);
im_Blue=im(:,:,3);

pixels_red = zeros(length(x),1);
pixels_green = zeros(length(x),1);
pixels_blue = zeros(length(x),1);

for i=1:length(x)
        pixels_red(i) = im_Red(y(i),x(i));
        pixels_green(i)= im_Green(y(i),x(i));
        pixels_blue(i)= im_Blue(y(i),x(i));
end

min_r=min(pixels_red);
max_r=max(pixels_red);
min_g=min(pixels_green);
max_g=max(pixels_green);
min_b=min(pixels_blue);
max_b=max(pixels_blue);

% r_range=0.9*min_r:1.1*max_r;
% g_range=0.9*min_g:1.1*max_g;
% b_range=0.9*min_b:1.1*max_b;
[nbRows, nbCols] = size(im(:,:,1));

blau=[100,200,250];
a=192;

for r=1:a
    for c=1:nbCols
        if (im_Red(r,c) >= 0.9*min_r) && (im_Red(r,c) <= 1.1*min_r)
            im_Red(r,c)=blau(1);
        end
        if (im_Green(r,c) >= 0.9*min_g) && (im_Green(r,c) <= 1.1*min_g)
                    im_Green(r,c)=blau(2);
        end
        if (im_Blue(r,c) >= 0.9*min_b) && (im_Blue(r,c) <= 1.1*min_b)
                    im_Blue(r,c)=blau(3);
        end
    end
end









%bild(find(im==0.9*min_x))=100;

im_newsky=cat(3,im_Red,im_Green,im_Blue);

% % perform thresholding by logical indexing
% image_thresholded = im;
% image_thresholded(im>=0.9*min_x) = 100;
% image_thresholded(im<=1.1*max_x) = 200;

figure('Name','Aufgabe 1: Farbbildverarbeitung Ergebnis','NumberTitle','off'); 
imshowpair(im,im_newsky,'montage');
title('Original Bild & Auswahl der Pixel');







