% %Debug-Hilfe
% Schachbrett = imread('Images/Schachbrett.png');
% fType=2
% original_picture=Schachbrett;

function Kantenfilter(fType,original_picture)

switch fType
    case 1
        %Prewitt-Filter x
        filter_name="Prewitt-Filter X [3x3]";
        hSize = 3;
        filter=[-1 0 1;
                -1 0 1; 
                -1 0 1];
        filtered_picture_2=imfilter(original_picture,filter);

   case 2
       %Prewitt-Filter y
       filter_name="Prewitt-Filter Y [3x3]";
       hSize = 3;
       filter=[-1 -1 -1; 
                0  0  0; 
                1  1  1];
       filtered_picture_2=imfilter(original_picture,filter);

   case 3
       %LoG-Filter
       filter_name="LoG-Filter [5x5]";
       hSize=5;
       filter =  [  0  0 -1  0  0;
                    0 -1 -2 -1  0;
                   -1 -2 16 -2 -1;
                    0 -1 -2 -1  0;
                    0  0 -1  0  0];
       filtered_picture_2=imfilter(original_picture,filter);

   otherwise
      Fehler="Falscher FilterTyp übergeben"
end



% %Versuchte Javascrip impelementierung
% [w,h] = size(original_picture);
% filtered_picture=original_picture;
% [f_w,f_h]=size(filter);

% for v = 1+(f_h-1)/2:h+(f_h-1)/2
%     for u = 1+(f_h-1)/2:w+(f_w-1)/2
%         sum=0;
%         for j = 1:f_h
%             for i = 1:f_w
% %                 Test1=u+i
% %                 Test2=v+j
% %                 Test3=j+1
% %                 Test4=i+1
%                 p=original_picture(u+i,v+j);
%                 c=filter(j-1,i-1);
%                 sum = sum + c*p;
%             end
%         end
%         q = round(sum);
%         filtered_picture(u,v)=q;
%     end
% end

%Loesung nach Vorlage V4
% Randerweiterung
[nbRows, nbCols] = size(original_picture);
radiusH = (hSize-1)/2;
imExt = zeros(nbRows+2*radiusH,nbCols+2*radiusH);
imExt(1+radiusH:nbRows+radiusH, 1+radiusH:nbCols+radiusH) = original_picture;

filtered_picture = zeros(nbRows, nbCols);
for r = 1+radiusH:nbRows+radiusH
    for c = 1+radiusH:nbCols+radiusH
        sum = 0;
        for i = 1:hSize
            for j = 1:hSize
                sum = sum + filter(i,j)*imExt(r+i-radiusH-1,c+j-radiusH-1);
            end
        end
        filtered_picture(r-radiusH, c-radiusH) = sum;
    end
end


%Plotten
%filter
figure('Name','Aufgabe 3: Bildfilterung und Kantendetektion','NumberTitle','off');
subplot(2,2,[1,2]); 
imshow(original_picture,[]);
title('Original Bild');
subplot(2,2,3);
imshow(filtered_picture);
title(filter_name+" (Loops)");
subplot(2,2,4);
imshow(filtered_picture_2,[]);
title(filter_name);
%end

% %Anzeige Test
% figure('Name','Test Groß Bild Filterung durch imfilter','NumberTitle','off');
% imshow(filtered_picture_2)
% 
% figure('Name','Test Groß Bild Filterung durch eigene Schleife','NumberTitle','off');
% imshow(filtered_picture)

