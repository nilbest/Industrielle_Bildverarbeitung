clear; clc;

imOrg = imread('Images/darkseedSmall.png');
imshow(imOrg);
[m,n] = size(imOrg)
amin = min(imOrg(:))
amax = max(imOrg(:))

% % Invertieren
% for i=1:m
%     for j=1:n
%         imInv(i,j) = 255-imOrg(i,j);
%     end
% end
% 
% % imInv = 255 - imOrg;
% 
% figure, imshowpair(imOrg, imInv, 'montage','scaling','none');

% % Addition
% gvalue = 50;
% 
% for i=1:m
%     for j=1:n
%         imAdd(i,j) = imOrg(i,j) + gvalue;
%     end
% end
% 
% % imAdd = imOrg + 50;
% 
% figure, imshowpair(imOrg,imAdd,'montage','scaling','none');

% % Lineare Skalierung
% for i=1:m
%     for j=1:n
%         imLinSkal(i,j) = 255./(amax-amin) .* (imOrg(i,j)-amin);
%     end
% end
% 
% % imLinSkal = 255./(amax-amin) .* (imOrg-amin);
% 
% figure, imshowpair(imOrg,imLinSkal,'montage','scaling','none');

% % Schwellwert
% ath = 50;
% imBin = imOrg;
% for i=1:m
%     for j=1:n
%         if imOrg(i,j) >= ath
%             imBin(i,j) = 255;
%         else
%             imBin(i,j) = 0;
%         end
%     end
% end
% 
% % imBin(imOrg>=ath) = 255;
% % imBin(imOrg<ath) = 0;
% 
% figure, imshowpair(imOrg,imBin,'montage','scaling','none');

% % Histogramm
% imLinScal = 255./(amax-amin) .* (imOrg-amin);
% figure; imshowpair(imOrg,imLinScal,'montage','scaling','none');
% 
% imHeq = histeq(imOrg,256);
% figure; imshowpair(imOrg,imHeq,'montage','scaling','none');
% 
% figure;
% subplot(3,2,1); imshow(imOrg);
% subplot(3,2,2); imhist(imOrg); ylim('auto');
% subplot(3,2,3); imshow(imLinScal);
% subplot(3,2,4); imhist(imLinScal); ylim('auto');
% subplot(3,2,5); imshow(imHeq);
% subplot(3,2,6); imhist(imHeq); ylim('auto');

% % Denoising
% im = double(imread('cameraman.tif'));
% numIm = 50;
% sigma = 20;
% [m,n] = size(im);
% imNoisyStack = zeros(m,n,numIm);
% 
% for i=1:numIm
%     noise = randn([m,n])*sigma;
%     imNoisyStack(:,:,i) = im + noise;
% end
% 
% figure;
% subplot(1,3,1), imshow(im,[]);
% subplot(1,3,2), imshow(imNoisyStack(:,:,1),[]);
% imSum = zeros(m,n);
% for i=1:numIm
%     imSum = imSum + imNoisyStack(:,:,i);
% end
% imMean = imSum ./ numIm;
% subplot(1,3,3); imshow(imMean,[]);

im = imread('peppers.png');

imR = im(:,:,1);
imG = im(:,:,2);
imB = im(:,:,3);

% figure;
% subplot(2,3,2); imshow(im); title('RGB')
% subplot(2,3,4); imshow(imR); title('R')
% subplot(2,3,5); imshow(imG); title('G')
% subplot(2,3,6); imshow(imB); title('B')

% % Luminanz
% Y1 = 0.299*imR + 0.587*imG + 0.114*imB;
% Y2 = 0.2125*imR + 0.7154*imG + 0.072*imB;
% Y3 = rgb2gray(im);
% figure;
% subplot(1,4,1); imshow(im);
% subplot(1,4,2); imshow(Y1);
% subplot(1,4,3); imshow(Y2);
% subplot(1,4,4); imshow(Y3);
% max(max(abs(Y3-Y1)))
% max(max(abs(Y3-Y2)))
% mean(mean(Y3-Y1))
% mean(mean(Y3-Y2))

% % YCbCr
% im_ycbcr = rgb2ycbcr(im);
% figure;
% subplot(2,3,2); imshow(im); title('RGB')
% subplot(2,3,4); imshow(im_ycbcr(:,:,1));  title('Y')
% subplot(2,3,5); imshow(im_ycbcr(:,:,2));  title('Cb')
% subplot(2,3,6); imshow(im_ycbcr(:,:,3));  title('Cr')

% % HSV
% im_hsv = rgb2hsv(im);
% figure;
% subplot(2,3,2); imshow(im); title('RGB')
% subplot(2,3,4); imshow(im_hsv(:,:,1));  title('H')
% subplot(2,3,5); imshow(im_hsv(:,:,2));  title('S')
% subplot(2,3,6); imshow(im_hsv(:,:,3));  title('V')

% % LAB
% im_lab = rgb2lab(im);
% figure;
% subplot(2,3,2); imshow(im); title('RGB')
% subplot(2,3,4); imshow(im_lab(:,:,1),[]);  title('L')
% subplot(2,3,5); imshow(im_lab(:,:,2),[]);  title('A')
% subplot(2,3,6); imshow(im_lab(:,:,3),[]);  title('B')

% % Color Maps
% figure;
% ax(1) = subplot(2,3,1); hold on;
% imshow(rgb2gray(im)); colormap(ax(1),autumn); title('autumn')
% ax(2) = subplot(2,3,2); hold on;
% imshow(rgb2gray(im)); colormap(ax(2),colorcube); title('colorcube')
% ax(3) = subplot(2,3,3); hold on;
% imshow(rgb2gray(im)); colormap(ax(3),jet); title('jet')
% ax(4) = subplot(2,3,4); hold on;
% imshow(rgb2gray(im)); colormap(ax(4),spring); title('spring')
% ax(5) = subplot(2,3,5); hold on;
% imshow(rgb2gray(im)); colormap(ax(5),summer); title('summer')
% ax(6) = subplot(2,3,6); hold on;
% imshow(rgb2gray(im)); colormap(ax(6),winter); title('winter')