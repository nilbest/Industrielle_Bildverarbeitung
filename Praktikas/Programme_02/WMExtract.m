function  WMExtract(original_picture)
%Bit's extrahieren
extracted_bit_1=bitget(original_picture,1,"uint8");
extracted_bit_2=bitget(original_picture,2,"uint8");
extracted_bit_3=bitget(original_picture,3,"uint8");
extracted_bit_4=bitget(original_picture,4,"uint8");
extracted_bit_5=bitget(original_picture,5,"uint8");
extracted_bit_6=bitget(original_picture,6,"uint8");
extracted_bit_7=bitget(original_picture,7,"uint8");
extracted_bit_8=bitget(original_picture,8,"uint8");


%Bild-Datei schreiben
imwrite(logical(extracted_bit_1),'Export/WM.png');
WM=imread('Export/WM.png');

%Plotten
figure('Name','Aufgabe 1: Extrahieren eines Wasserzeichens','NumberTitle','off');
subplot(3,4,1); 
imshow(original_picture);
title('Original Bild');
subplot(3,4,2);
imshow(WM);
title('Wasserzeichen');

subplot(3,4,5); 
imshow(extracted_bit_1,[]);
title('Extrhiertes Bit 1');
subplot(3,4,6); 
imshow(extracted_bit_2,[]);
title('Extrhiertes Bit 2');
subplot(3,4,7); 
imshow(extracted_bit_3,[]);
title('Extrhiertes Bit 3');
subplot(3,4,8); 
imshow(extracted_bit_4,[]);%die [] sagen das es aufs maximum angepaast wird, logical() ginge auch
title('Extrhiertes Bit 4');
subplot(3,4,9); 
imshow(extracted_bit_5,[]);
title('Extrhiertes Bit 5');
subplot(3,4,10); 
imshow(extracted_bit_6,[]);
title('Extrhiertes Bit 6');
subplot(3,4,11); 
imshow(extracted_bit_7,[]);
title('Extrhiertes Bit 7');
subplot(3,4,12); 
imshow(extracted_bit_8,[]);
title('Extrhiertes Bit 8');

