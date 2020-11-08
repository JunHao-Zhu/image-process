clc;
% 导入图像
img = imread('image1.jpeg');
[hight, width, ~] = size(img);
subplot(1,2,1);
imshow(img);

% 设置x，y方向上的平移量
del_x = 50;
del_y = 50;
del_mat = [1, 0, del_x; 0, 1, del_y; 0, 0, 1];

new_img = zeros(hight, width, 3);
for i = 1 : hight
    for j = 1 : width
        mod_pos = del_mat * [i; j; 1];
        mod_x = mod_pos(1, 1);
        mod_y = mod_pos(2, 1);
        if(mod_x <= hight && mod_y <= width && mod_x >= 1 && mod_y >= 1)
            new_img(mod_x, mod_y, :) = img(i, j, :);
        end
    end
end
new_img = uint8(new_img);
subplot(1,2,2);
imshow(new_img);