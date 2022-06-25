Data_1=load("knnDataTrain.txt");
Data_2=load("knnDataTest.txt");

figure('Name','Aufgabe 3: kNN-Klassifikation ','NumberTitle','off');
plot([Data_1(1:10,1)],[Data_1(1:10,2)],'r+');
hold on;
plot([Data_1(11:end,1)],[Data_1(11:end,2)],'bo');
plot([Data_2(:,1)],[Data_2(:,2)],'g*');
legend("Data_1 Klasse 1","Data_1 Klass 2", "Data_2 Testdaten");
hold off;

k=input("Bitte geben Sie den gewuenschten K-Wert fuer die kNN-Klassifikation ein: ");
if k<1
    error("Zu geringe Eingabe des K-Werts!");
end
if k>19
    error("Zu hoher K-Wert, nicht genuegend Trainingsdaten vorhanden!");
end
Test_Data=knnClassifier(Data_1,Data_2,k);


figure('Name','Aufgabe 3: kNN-Klassifikation','NumberTitle','off');
plot([Data_1(1:10,1)],[Data_1(1:10,2)],'r+');
hold on;
plot([Data_1(11:end,1)],[Data_1(11:end,2)],'bo');

[Rows, Cols] = size(Test_Data(:,:));
for r=1:Rows
    if Test_Data(r,3)==1
        plot([Test_Data(r,1)],[Test_Data(r,2)],'r+');
    else
        plot([Test_Data(r,1)],[Test_Data(r,2)],'bo');
    end
end
legend("Klasse 1","Klass 2");
hold off;
