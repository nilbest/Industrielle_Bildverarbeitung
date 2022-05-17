%function Bild = KantenFilter_Test_Richart(fType)
function KantenFilter_Test_Richart(fType)

img = imread("Images/Schachbrett.png");

[row col] = size(img);


prex1 = [-1 0 1; -1 0 1; -1 0 1];
prey2 = [-1 -1 -1; 0 0 0; 1 1 1];
%logF3 = [0 0 -1 0 0; 0 -1 -2 -2 0; -1 -2 16 -2 -1; 0 0 -1 0 0; 0 -1 -2 -2 0];
 logF3 =[  0  0 -1  0  0;
           0 -1 -2 -1  0;
          -1 -2 16 -2 -1;
           0 -1 -2 -1  0;
           0  0 -1  0  0];
% Filterung mit for-Schleife
if fType == '1'
    h = prex1;
    hSize = 3;
elseif fType == '2'
    h = prey2;
    hSize = 3;
elseif fType == '3'
    h = logF3;
    hSize = 5;
end

[row col] = size(img);
radiusH = (hSize-1)/2;
imExt = zeros(row+2*radiusH,col+2*radiusH);
imExt(1+radiusH:row+radiusH, 1+radiusH:col+radiusH) = img;


out = zeros(row, col);
for r = 1+radiusH:row+radiusH
    for c = 1+radiusH:col+radiusH
        sum = 0;
        for i = 1:hSize
            for j = 1:hSize
                sum = sum + h(i,j)*imExt(r+i-radiusH-1,c+j-radiusH-1);
            end
        end
        out(r-radiusH, c-radiusH) = sum;
    end
end

  Bild = out;     
      
        
        

% %% Filterung mit imfilter
% if fType == '1'
%         out = imfilter(img,prex1);
%    
% 
%     elseif fType == '2'
%         out = imfilter(img,prey2);
%   
% 
%     elseif fType == '3'
%         out = imfilter(img,logF3);
% end
% 
% imshow(out);
%  %Bild = out;      