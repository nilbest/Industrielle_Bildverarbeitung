% 4.1
% Führen Sie eine Bildfilterung der inneren 4 Werte des Eingangsbildes I(u,v) mit dem Mittelwertfilter, 
% dem Gaußfilter und dem Laplacefilter durch.
clear; clc;

I = [3 4 7 6; 2 5 5 4; 7 9 8 5; 1 5 7 3];

h_mean = [1 1 1; 1 1 1; 1 1 1]/9;
h_gaussian = [0 1 0; 1 2 1; 0 1 0]/6;
h_laplace = [0 -1 0; -1 4 -1; 0 -1 0];

I_m = round(imfilter(I, h_mean));
I_g = round(imfilter(I, h_gaussian));
I_l = I + round(imfilter(I, h_laplace));

I_m(2:3,2:3)
I_g(2:3,2:3)
I_l(2:3,2:3)