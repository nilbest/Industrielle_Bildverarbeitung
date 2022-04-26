Mat = [ones(7,9)]

Mat(2,2:4)=0
Mat(2:6,2)=0
Mat(4,3)=0
Mat(6,2:4)=0

Mat(2,6:8)=0
Mat(2:6,7)=0

ETBild = logical(Mat)
imshow(ETBild)
%imagesc(ETBild,)


imwrite(ETBild,'ET_Bild.tif');

imread('ET_Bild.tif');

