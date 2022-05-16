Schachbrett = imread('Images/Schachbrett.png');
fType=3
original_picture=Schachbrett;
% Kantenfilter(1,Schachbrett);

%function Kantenfilter(fType,original_picture)

switch fType
    case 1
        %Prewitt-Filter x
        filter_name="Prewitt-Filter X [3x3]";
       filter =    [1 0 -1;
                    1 0 -1;
                    1 0 -1];
        filtered_picture_2=imfilter(original_picture,filter);

   case 2
       %Prewitt-Filter y
       filter_name="Prewitt-Filter Y [3x3]";
       filter =  [ 1  1  1;
                   0  0  0;
                  -1 -1 -1];
        filtered_picture_2=imfilter(original_picture,filter);

   case 3
       %LoG-Filter
       filter_name="LoG-Filter [5x5]";
         filter =  [  0  0 -1  0  0;
                      0 -1 -2 -1  0;
                     -1 -2 16 -2 -1;
                      0 -1 -2 -1  0;
                      0  0 -1  0  0];
        filtered_picture_2=imfilter(original_picture,filter);

   otherwise
      Fehler="Falscher FilterTyp übergeben"
end

[w,h] = size(original_picture);
filtered_picture=original_picture;
[f_w,f_h]=size(filter);

%Versuchte Javascrip impelementierung
for v = 1:h-(f_h-1)
    for u = 1:w-(f_w-1)
        sum=0;
        for j = 1:f_h-1
            for i = 1:f_w-1
%                 Test1=u+i
%                 Test2=v+j
%                 Test3=j+1
%                 Test4=i+1
                p=original_picture(u+i,v+j);
                c=filter(j+1,i+1);
                sum = sum + c*p;
            end
        end
        q = round(sum);
        filtered_picture(u,v)=q;
    end
end

%Loesung nach 


%Plotten
filter
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




