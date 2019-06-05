function tiny_image_matrix = produce_tiny_img(image_paths)
    % initial setting
    tiny_image_matrix=[];
    tiny_length=16;
    % construct tiny img
    for i = 1:size(image_paths)
        %read and resize
        img = imread(image_paths{i, 1});
        img = imresize(img, [tiny_length tiny_length]);
        %making the tiny images zero mean and unit length to improve
        %performance
        tmp_img = [];
        for j = 1:tiny_length
            tmp_img = [tmp_img, img(j, :)];
        end
        tmp_img = double(tmp_img);
        tmp_img = tmp_img ./ sum(tmp_img);
        tmp_img = tmp_img - mean(tmp_img);
        tiny_image_matrix = [tiny_image_matrix; tmp_img];
    end
end