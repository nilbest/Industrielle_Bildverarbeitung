clear, close all, clc;

% Einfache visuelle Effekte
imgA = imread('./Images/mandril_color.tif');
imgB = imread('./Images/lena_color_512.tif');

figure;
alpha = 1;
imgC = alpha*imgA + (1-alpha)*imgB;
subplot(2,2,1); imshow(imgC);
alpha = 0.6;
imgC = alpha*imgA + (1-alpha)*imgB;
subplot(2,2,2); imshow(imgC);
alpha = 0.3;
imgC = alpha*imgA + (1-alpha)*imgB;
subplot(2,2,3); imshow(imgC);
alpha = 0;
imgC = alpha*imgA + (1-alpha)*imgB;
subplot(2,2,4); imshow(imgC);

%%

% Binärregionen
img = im2double(imread('./Images/DominoZimtSmall2.png'));
img = 1 - img;
figure;
imshow(img); hold on;
[L,ncc] = bwlabel(img);
figure; imagesc(L); colormap('jet'); colorbar;

% Properties
P = regionprops(L,'area','perimeter');

area = [P.Area];
perimeter = [P.Perimeter];

figure; plot(area,perimeter,'o'); grid;
xlabel('area'); ylabel('perimeter');
hold on;
for i = 1:length(area)
    text(area(i)+50,perimeter(i),num2str(i),'Color','r');
end

compactness = area./perimeter;
circularity = 4*pi*area ./ perimeter.^2;
figure; plot(circularity,compactness,'o');
xlabel('circularity'); ylabel('compactness');
hold on;
for i = 1:length(circularity)
    text(circularity(i)+0.015,compactness(i),num2str(i),'Color','r');
end
