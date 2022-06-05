clear; clc;
close all;
im_apple = imread("Images\apple1.jpg");
im_orange = imread("Images\orange1.jpg");

[nbRows_apple, nbCols_apple] = size(im_apple(:,:,1));
[nbRows_orange, nbCols_orange] = size(im_orange(:,:,1));
% nbRows_orange=50; 
% nbCols_orange=10;

%Prüfung ob Alpha Überlagerung möglich
if ((nbRows_orange~=nbRows_apple) && (nbCols_orange~=nbCols_apple))
    error ('Bilder nicht gleichgroß') 
end
    nbRows=nbRows_apple;
    nbCols=nbCols_apple;
clear("nbCols_apple","nbRows_apple","nbCols_orange","nbRows_orange");

% %Seperieren der Bilder in RGB (geht auch ohne!!!)
% im_apple_Red=im(:,:,1);
% im_apple_Green=im(:,:,2);
% im_apple_Blue=im(:,:,3);
% im_orange_Red=im(:,:,1);
% im_orange_Green=im(:,:,2);
% im_orange_Blue=im(:,:,3);

im_alpha_apple=im_apple;
im_alpha_orange=im_orange;

%Alpha Verteilung
alpha_1=3/8;
alpha_2=(5/8)-(3/8);
alpha_3=5/8;

range_of_blend=nbCols*alpha_2;
blend_per_pixle=1/range_of_blend;
%%
for rgb=1:3
    for r=1:nbRows
        for c=1:nbCols
                if (c<=(nbCols*alpha_1)) %Bis Alpha Punkt 1 (192)
                    im_alpha_apple(r,c,rgb)=im_apple(r,c,rgb)*(1-0);
                    im_alpha_orange(r,c,rgb)=im_orange(r,c,rgb)*(1-1);
                elseif (c>=(nbCols*alpha_3)) %Ab Alpha Punkt 3 (320)
                    im_alpha_apple(r,c,rgb)=im_apple(r,c,rgb)*(1-1);
                    im_alpha_orange(r,c,rgb)=im_orange(r,c,rgb)*(1-0);
                else %Zwischen Alpha Punkt 1 & 3
                    anz=(nbCols*5/8-c)*blend_per_pixle; %Um den Uebergang prozentual anzupassen 
                    im_alpha_apple(r,c,rgb)=im_apple(r,c,rgb)*(1-(1-anz)); %Bei dem Wert wo c gering ist anz =1
                    im_alpha_orange(r,c,rgb)=im_orange(r,c,rgb)*(1-(0+anz));
                end
        end
    end
end

im_blend=im_apple;
for rgb=1:3
    for r=1:nbRows
        for c=1:nbCols
            im_blend(r,c,rgb)=im_alpha_apple(r,c,rgb)+im_alpha_orange(r,c,rgb);
        end
    end
end

%Plotten

figure('Name','Aufgabe 3: Geladene Bilder','NumberTitle','off'); 
imshowpair(im_apple,im_orange,'montage');
title('Apfel & Orange');

figure('Name','Aufgabe 3: Alpha Bilder','NumberTitle','off'); 
subplot(2,1,1); imshow(im_alpha_apple);title('Apfel + Alpha');
subplot(2,1,2); imshow(im_alpha_orange);title('Orange + Alpha');

figure('Name','Aufgabe 3: Überblenden (Mischen) zweier Farbbilder','NumberTitle','off'); 
imshow(im_blend);
title('Die Apfel - Orange');