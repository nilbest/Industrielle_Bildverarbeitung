close all; clear; clc;

% Morphology
BW = zeros(14,10);
BW(4,6) = 1;
BW(5,4:7) = 1;
BW(6,3:8) = 1;
BW(7,3:7) = 1;
BW(8,5) = 1;
BW(9,3:6) = 1;
BW(10,3:6) = 1;
BW(11,3:6) = 1;
BW(12,4) = 1; BW(12,7) = 1;

NHOOD = [1 1 1; 1 1 1; 1 1 1];
SE = strel(NHOOD);

% Opening
figure;
subplot(1,4,1); imshow(BW); title("BW");
BWero = imerode(BW,SE);
subplot(1,4,2); imshow(BWero); title("BWero = imerode(BW,SE)");
BWopen = imdilate(BWero,SE);
subplot(1,4,3); imshow(BWopen); title("BWopen = imdilate(BWero,SE)");
BWopen2 = imopen(BW,SE);
subplot(1,4,4); imshow(BWopen2); title("BWopen2 = imopen(BW,SE)");

% % Closing
% figure;
% subplot(1,4,1); imshow(BW);  title("BW");
% BWdil = imdilate(BW,SE);
% subplot(1,4,2); imshow(BWdil); title("BWdil = imdilate(BW,SE)");
% BWclose = imerode(BWdil,SE);
% subplot(1,4,3); imshow(BWclose); title("BWclose = imerode(BWdil,SE)");
% BWclose2 = imclose(BW,SE);
% subplot(1,4,4); imshow(BWclose2);  title("BWclose2 = imclose(BW,SE)");

% % Nonflat Morphology
% BW = imread("cameraman.tif");
% NHOOD = [1 2 1; 2 4 2; 1 2 1];
% SE = offsetstrel(NHOOD);
% 
% % Opening
% figure;
% subplot(1,4,1); imshow(BW); title("BW");
% BWero = imerode(BW,SE);
% subplot(1,4,2); imshow(BWero); title("BWero = imerode(BW,SE)");
% BWopen = imdilate(BWero,SE);
% subplot(1,4,3); imshow(BWopen); title("BWopen = imdilate(BWero,SE)");
% BWopen2 = imopen(BW,SE);
% subplot(1,4,4); imshow(BWopen2); title("BWopen2 = imopen(BW,SE)");
% 
% % Closing
% figure;
% subplot(1,4,1); imshow(BW);  title("BW");
% BWdil = imdilate(BW,SE);
% subplot(1,4,2); imshow(BWdil); title("BWdil = imdilate(BW,SE)");
% BWclose = imerode(BWdil,SE);
% subplot(1,4,3); imshow(BWclose); title("BWclose = imerode(BWdil,SE)");
% BWclose2 = imclose(BW,SE);
% subplot(1,4,4); imshow(BWclose2);  title("BWclose2 = imclose(BW,SE)");
