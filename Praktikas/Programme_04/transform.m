function transform(im,back,x_skal,y_skal,x_ver,y_ver,rot)

tform_skal = affine2d([x_skal 0 0; 0 y_skal  0; 0 0 1]);

tform_rot= affine2d([cosd(rot) -sind(rot) 0;sind(rot) cosd(rot) 0;0 0 1]);
%tform_rot= affine2d('Rotation',rot);

im_skaled=imwarp(im,tform_skal);

% figure('Name','Test skale','NumberTitle','off'); 
% imshowpair(im,im_skaled,'montage');
% title('Original Bild & Auswahl der Pixel');

im_skaled_rot=imwarp(im_skaled,tform_rot);

% figure('Name','Test 2','NumberTitle','off'); 
% imshowpair(im,im_skaled_rot,'montage');
% title('Original Bild & Auswahl der Pixel');

[x, y]=size(im_skaled_rot);

back(x_ver:x_ver+x-1,y_ver:y_ver+y-1)=im_skaled_rot;
back(1025:end,:)=[];
back(:,1025:end)=[];
%Back hart abschneiden bei 1024
 
figure('Name','Aufgabe 1: Affine Transformation','NumberTitle','off'); 
imshow(back,[]);
title('Original Bild & Auswahl der Pixel');


% origin_mid=1024/2;
% 
% [x,y]=transformPointsForward(tform,origin_mid,origign_mid);
