test = readmatrix("knnDataTest.txt");
train = readmatrix("knnDataTrain.txt");

subplot(1,2,1)
scatter(test(:, 1), test(:, 2),'g', marker='*')
hold on
scatter(train(train(:, 3) == 1, 1), train(train(:, 3) == 1, 2), 'r', marker='+')
scatter(train(train(:, 3) == 2, 1), train(train(:, 3) == 2, 2), 'b', marker='o')
hold off

test(:, 3) = knnClassifier(train, test, 5);

train = cat(1, train, test);

subplot(1,2,2)
scatter(train(train(:, 3) == 1, 1), train(train(:, 3) == 1, 2), 'r', marker='+')
hold on
scatter(train(train(:, 3) == 2, 1), train(train(:, 3) == 2, 2), 'b', marker='o')
hold off