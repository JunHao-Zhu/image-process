clc;
% 导入图像
img = imread('image1.jpeg');
[hight, width, ~] = size(img);
figure();
imshow(img);title('原图');

% 设置水平方向上的缩放比例以及垂直方向上的缩放比例
scale_x = 1.5;
scale_y = 1.5;
scale_mat = [scale_x, 0, 0; 0, scale_y, 0; 0, 0, 1];

% 获得缩放后图像的画布大小
mod_h = floor(hight * scale_x) + 1;
mod_w = floor(width * scale_y) + 1;

new_img = zeros(mod_h, mod_w, 3);
for i = 1 : mod_h
    for j = 1 : mod_w
        ori_pos = scale_mat \ [i; j; 1];
        mod_x = floor(ori_pos(1,1));
        mod_y = floor(ori_pos(2,1));
        D_x = ori_pos(1,1) - mod_x;
        D_y = ori_pos(2,1) - mod_y;
        if(mod_x <= hight-1 && mod_y <= width-1 && mod_x >= 2 && mod_y >= 2)
            new_img(i, j, :) = (1-D_x)*(1-D_y)*img(mod_x,mod_y,:) + D_x*(1-D_y)*img(mod_x+1,mod_y,:) +...
                (1-D_x)*D_y*img(mod_x,mod_y+1,:) + D_x*D_y*img(mod_x+1,mod_y+1,:);
        end
    end
end
new_img = uint8(new_img);
figure();
imshow(new_img);title('缩放后图像');