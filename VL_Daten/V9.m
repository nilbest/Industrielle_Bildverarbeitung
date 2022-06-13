clear all; close all; clc;
% 
% im = imread('cameraman.tif');
% figure; imshow(im);
% h = size(im,1);
% w = size(im,2);
% 
% switch 1
%     case 1
%         % Forward transform by faktor k
%         k = 2;
%         hOut = floor(k*h);
%         wOut = floor(k*w);
%         imOut = zeros(hOut,wOut);
%         for v = 1:h
%             for u = 1:w
%                 yp = k*v;
%                 xp = k*u;
%                 vpNN = round(yp);
%                 upNN = round(xp);
%                 imOut(vpNN,upNN) = im(v,u);
%             end
%         end
%         figure; imshow(imOut,[])
%     case 2
%         % Backward Transform
%         k = 2;
%         hOut = floor(k*h);
%         wOut = floor(k*w);
%         imOut = zeros(hOut,wOut);
%         for vp = 1:hOut
%             for up = 1:wOut
%                 y = vp/k;
%                 x = up/k;
%                 % NN interpolation
%                 vNN =round(y);
%                 uNN =round(x);
%                 imOut(vp,up) = im(vNN,uNN);
%             end
%         end
%         figure; imshow(imOut,[]);
% end
% 
% im = imread('cameraman.tif');
% imNearest = imresize(im,2,'nearest');
% imLinear = imresize(im,2,'bilinear');
% imCubic = imresize(im,2,'bicubic');
% 
% figure; imshow(im);
% figure; imshow(imNearest);
% figure; imshow(imLinear);
% figure; imshow(imCubic);

x = (0:pi/10:pi);
y = sin(x)-3*sin(2.3*x)+4*sin(5*x)+1;

x_neu = (0:pi/30:pi);

y_opt = sin(x_neu)-3*sin(2.3*x_neu)+4*sin(5*x_neu)+1;
y_lin = interp1(x,y,x_neu);
y_cub = interp1(x,y,x_neu,'cubic');

figure;
hold on
stem(x,y,'LineStyle','none');
stem(x_neu,y_lin,'LineStyle','none', 'Marker', '+');
stem(x_neu,y_cub,'LineStyle','none', 'Marker', 'x');
stem(x_neu,y_opt,'LineStyle','none', 'Marker', '*');

legend('Abtastwerte','Linear','Kubisch','Optimal');
