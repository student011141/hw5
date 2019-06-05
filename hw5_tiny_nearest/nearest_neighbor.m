function result = nearest_neighbor(train_image_matrix, train_labels, test_image_matrix)
    %caculate dist
    dist = vl_alldist2(train_image_matrix', test_image_matrix');
    dist = dist';
    result = [];
    for i = 1:size(test_image_matrix,1)
        %find the nearset dist and select so as the label
        [value, index] = min(dist(i, :));
        label = train_labels(index, 1);
        result = [result; label];
    end
end