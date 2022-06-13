close all, clear, clc;

% Affine Transformation
D = [0 0; 0 1; 1 0];
DP = [2 3; 2 2; 4 3];
tform = fitgeotrans(D,DP,'affine');
tform.T'

% % Projective Transformation
% imSource = imread('Images/sideView.jpg');
% figure; imshow(imSource);
% [x,y] = ginput(4);
% sourcePts = [x,y];
% 
% figure; imshow('Images/reference.jpg');
% [xp,yp] = ginput(4);
% destPts = [xp,yp];
% 
% tform = fitgeotrans(sourcePts,destPts,'projective');
% tform.T
% 
% imDest = imwarp(imSource,tform);
% figure; imshow(imDest,[]);
% 
% % cropping
% imCropped = imcrop(imDest);
% figure; imshow(imCropped);

% % Hochhaus
% im = imread('Images/Hochhaus.jpeg');
% out = ones(size(im,1),size(im,2));
% out(100:size(im,1)-100,300:size(im,2)-300)=0;
% 
% [sourcePts, targetPts] = cpselect(im,out,'Wait',true);
% 
% tform = fitgeotrans(sourcePts, targetPts, 'Projective');
% 
% im2 = imwarp(im, tform);
% 
% figure; imshowpair(im,im2,'montage');
