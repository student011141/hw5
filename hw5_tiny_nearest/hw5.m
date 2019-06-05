%% Computer Vision Team #22
% Homework 5
% VLFeat Download : http://www.vlfeat.org/download.html
%initial setting
clc; clear; close all;
disp('--initializing...');
libpath = genpath('./lib');
addpath(libpath);
setup_m = '.\vlfeat-0.9.21\toolbox\vl_setup.m';
VLFeat_init(setup_m)
disp('--initialization finished');
data_path = './hw5_data/';
categories = {'Kitchen', 'Store', 'Bedroom', 'LivingRoom', 'Office', ...
       'Industrial', 'Suburb', 'InsideCity', 'TallBuilding', 'Street', ...
       'Highway', 'OpenCountry', 'Coast', 'Mountain', 'Forest'};
abbr_categories = {'Ki', 'St', 'Be', 'Li', 'Of', 'In', 'Su', ...
    'Ct', 'Bl', 'Str', 'HW', 'OC', 'Ct', 'Mn', 'Fo'};
train_num = 100;
test_num = 10;
[train_image_paths, test_image_paths, train_labels, test_labels] = ...
    get_image_paths(data_path, categories, train_num, test_num);
%tiny img and nearest neighbor
train_image_matrix = produce_tiny_img(train_image_paths);
test_image_matrix  = produce_tiny_img(test_image_paths);
result = nearest_neighbor(train_image_matrix, train_labels, test_image_matrix);
%draw confusion matrix and accuracy
num_categories = length(categories);
confusion_matrix = zeros(num_categories, num_categories);
for i=1:length(result)
    row = find(strcmp(test_labels{i}, categories));
    column = find(strcmp(result{i}, categories));
    confusion_matrix(row, column) = confusion_matrix(row, column) + 1;
end
test_num = length(test_labels) / num_categories;
confusion_matrix = confusion_matrix ./ test_num;   
accuracy = mean(diag(confusion_matrix));
fprintf('Accuracy is %.3f\n', accuracy)

fig_handle = figure; 
imagesc(confusion_matrix, [0 1]); 
set(fig_handle, 'Color', [.988, .988, .988])
axis_handle = get(fig_handle, 'CurrentAxes');
set(axis_handle, 'XTick', 1:15)
set(axis_handle, 'XTickLabel', abbr_categories)
set(axis_handle, 'YTick', 1:15)
set(axis_handle, 'YTickLabel', categories)
colorbar;title('tiny image nearest neighbor classifier');