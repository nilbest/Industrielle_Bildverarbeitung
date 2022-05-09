function  WMExtract(original_picture,watermark)
edited_picture=bitset(original_picture,1,watermark);

imwrite(edited_picture,'Export/myCoinsWM.png')

%Plott
figure('Name','Aufgabe 1: Einbetten eines Wasserzeichens','NumberTitle','off');
subplot(1,3,1);
imshow(original_picture);
title('Original Bild');

subplot(1,3,2);
imshow(watermark,[]);
title('Original Bild');

subplot(1,3,3);
imshow(edited_picture);
title('Bild mit Wasserzeichen');
