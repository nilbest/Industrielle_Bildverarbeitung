% x="Bitte hier die Pixel Dimenssionen der Flagge angeben!";
% x
% vertical_pixels = input("Vertical Pixel: ");
% horizontal_pixels = input("Horizontale Pixel: ");

vertical_pixels=300;
horizontal_pixels=600;

M = [zeros(vertical_pixels,horizontal_pixels)];

Red=M;
Blue=M;
Green=M;

%Black
for y=1:horizontal_pixels
    for x=1:(vertical_pixels*(1/3))
        Red(x,y)=0.00;
        Blue(x,y)=0.00;
        Green(x,y)=0.00;
    end
end

%%
%Rot
for y=1:horizontal_pixels
    for x=(vertical_pixels*(1/3)):(vertical_pixels*(2/3))
        Red(x,y)=1;
    end
end
%%
%Gold / Yello
for y=1:horizontal_pixels
    for x=(vertical_pixels*(2/3)):(vertical_pixels)
        Red(x,y)=1.00;
        Green(x,y)=1.00;
    end
end

rgbFlag=cat(3,Red,Green,Blue);

%Plott
figure('Name','Aufgabe 2: Flagge erstellen','NumberTitle','off');
subplot(2,3,[1,3]);
imshow(rgbFlag);
title('Deutschlandflagge');

subplot(2,3,4);
imshow(Red);
title('Red');

subplot(2,3,5);
imshow(Green);
title('Green');

subplot(2,3,6);
imshow(Blue);
title('Blue');

