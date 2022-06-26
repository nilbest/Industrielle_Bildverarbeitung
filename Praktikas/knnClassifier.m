function l = knnClassifier(train, test, k)
    [h, w] = size(test);
    [h_t, w_t] = size(train);

    l = zeros(h, 1); 

    for i = 1:h
        x = test(i, 1);
        y = test(i, 2);
        
        D = zeros(h_t, 1);

        for j = 1:h_t
            x_t = train(j, 1);
            y_t = train(j, 2);
            D(j, 1) = norm([x,y] - [x_t,y_t]);
        end
        
        [~, idx] = sort(D(:, 1));

        label = mode(train(idx(1:k), 3));
        l(i) = label;
    end

    return

end