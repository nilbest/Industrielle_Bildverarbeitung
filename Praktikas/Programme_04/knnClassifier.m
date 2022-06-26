function Tested_Data=knnClassifier(Data_1,Data_2,K)

%D1 = pdist2(X,Y,'euclidean');
% D = pdist2(Data_1(1:2,:),Data_2,'Smallest',K); nur mit extra Toolbox
% moeglich!!!

[nbRows_2, nbCols_2] = size(Data_2);
[nbRows_1, nbCols_1] = size(Data_1);

Data_1_new = zeros(nbRows_1,(nbCols_1+1));
Data_1_new(:,1:nbCols_1)= Data_1(:,:);
Data_Klass_for_Test = zeros(nbRows_2,(nbCols_2+1));
Data_Klass_for_Test(:,1:nbCols_2)= Data_2(:,:);

%Schleife Data Set 2
 for r2=1:nbRows_2
     x_2=Data_2(r2,1);
     y_2=Data_2(r2,2);
        %Schleife Data Set 1
        for r1=1:nbRows_1
%           D = sqrt((x_2-x_1)^2+(y_2-y_1)^2);
            %D = abs(sqrt(Data_2(r2,1)-Data_1(r1,1))^2+(Data_2(r2,2)-Data_1(r1,2))^2);
            x_1=Data_1(r1,1);
            y_1=Data_1(r1,2);

            D=norm([x_2,y_2]-[x_1,y_1]);
            Data_1_new(r1,4)=D;
        end
        [~,idx] = sort(Data_1_new(:,4)); % sort just the 4. column
        nearest_Data_1_sorted = Data_1_new(idx,:);
%       nearest_Data_1_sorted(1:K,3);
        Data_Klass_for_Test(r2,3)=mode(nearest_Data_1_sorted(1:K,3));
end

Tested_Data=Data_Klass_for_Test;



% A=rand(3,4);
% A=[ones(3,1),A];
%Data_1_Dist(4,:)=D;

%mode()