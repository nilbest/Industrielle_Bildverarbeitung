im = imread("Images\object.png");
back=zeros(1024,1024);

x_skal=2;
y_skal=2;
x_ver=900;
y_ver=900;
rot=90;
transform(im,back,x_skal,y_skal,x_ver,y_ver,rot);