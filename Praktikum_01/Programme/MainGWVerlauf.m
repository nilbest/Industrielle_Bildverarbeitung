clear;

figure("Name",'Test');
LBild = uint8(GWVerlauf("Links"));
%imshow(LBild)
RBild = uint8(GWVerlauf("Rechts"));
%imshow(RBild)
subplot(1,2,1); imshow(LBild);
subplot(1,2,2); imshow(RBild);
title(subplot(1,2,1),"Grauwertverlauf -->");
title(subplot(1,2,2),"Grauverlauf <--");




