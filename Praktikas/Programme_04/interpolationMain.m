clear; clc;
close all;

all_Abtastwerte = [0,7;1,1;2,6;3,4;4,6;5,5];
P1=[all_Abtastwerte(3,1),all_Abtastwerte(3,2)];
P2=[all_Abtastwerte(4,1),all_Abtastwerte(4,2)];

List_N_N=[zeros(101,2)];
List_linear=[zeros(101,2)];
List_kubisch=[zeros(101,2)];

List_N_N(1,1)=P1(1,1);
List_N_N(1,2)=P1(1,2);
List_linear(1,1)=P1(1,1);
List_linear(1,2)=P1(1,2);
List_kubisch(1,1)=P1(1,1);
List_kubisch(1,2)=P1(1,2);


for i=1:99
    %"Nearest_Neighbour"
    x=P1(1,1)+(i/100);
    y=[P1(1,2),P2(1,2)];
    List_N_N(i+1,1)=x;
    List_N_N(i+1,2)=intpol(x,y,"Nearest_Neighbour");

    %"linear"
    x=P1(1,1)+(i/100);
    y=[P1(1,2),P2(1,2)];
    List_linear(i+1,1)=x;
    List_linear(i+1,2)=intpol(x,y,"linear");

  

end

List_N_N(end,1)=P2(1,1);
List_N_N(end,2)=P2(1,2);
List_linear(end,1)=P2(1,1);
List_linear(end,2)=P2(1,2);
List_kubisch(end,1)=P2(1,1);
List_kubisch(end,2)=P2(1,2);

figure('Name','Aufgabe 2: Interpolation','NumberTitle','off');
plot([List_N_N(:,1)],[List_N_N(:,2)]);
hold on;
plot([List_linear(:,1)],[List_linear(:,2)]);
legend("Nearest Neighbour Interpolation","lineare Interpolation");

%plot(List_kubisch)
