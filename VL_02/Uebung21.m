rowVec = [1 4 7];
rowVec
lineVec = [1 4 7];
lineVec

x = 5;
x
y = x + x;
y
y_neu = y-x;
y_neu;

x_2 = x*2;
x_2
x_3 = x_2/2;
x_3

Vec1 = [1 3 6];
Vec2 = [5 8 9];
Skalarprodukt = Vec1 * Vec2';
Skalarprodukt
%%

Mat01 = [1 2 3 4 5; 6 7 8 9 10];
Mat01

Mat01(2,5)
Mat01(2,:)
Mat01(:,5)

save = Mat01

Mat01(2,:)=[];
Mat01

Mat01= save;

Mat01(:,3)=[];
Mat01

Mat01 = save;

Mat02= [2 2 2 2 2; 5 5 5 5 5];
Mat02

Mat01+Mat02

Mat01-Mat02

Mat01.*Mat02

Mat01./Mat02

%Matrixprodukt
Mat1 = [1 2 3; 4 5 6]
Mat2 = [5 6 7; 8 9 0]

Mat2 = reshape(Mat2,3,2);
Mat2

Mat1 * Mat2












