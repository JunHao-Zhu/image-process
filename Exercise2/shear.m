clc
% 输入错切前的图像(斜着的图像)以及错切后的图像（正着的图像）
ori_img = imread('reality.jpg'); % 斜着的图像
mod_img = imread('target.jpg'); % 正着的图像
%subplot(1,2,1);
figure();
imshow(ori_img);

% 输入错切前和错切后对应的像素点的位置
% mod_pos_x = [62; 133; 70; 119];
% mod_pos_y = [139; 231; 46; 163];
% ori_pos = [62, 170, 1; 133, 294, 1; 71, 81, 1; 119, 220, 1];
pos_x = [62; 133; 71; 119; 104; 62]; % 斜着的图像的x坐标
pos_y = [170; 294; 81; 220; 79; 148]; % 斜着的图像的y坐标
mod_pos = [62, 139, 1; 133, 231, 1; 70, 46, 1; 119, 163, 1; 105, 28, 1; 61, 119, 1]; % 正着的图像坐标（x,y,1）

% W_x = inv((ori_pos'* ori_pos)) * ori_pos' * mod_pos_x; % 根据最小二乘法得到 x'=ax+by+c 的系数
% W_y = inv((ori_pos'* ori_pos)) * ori_pos' * mod_pos_y; % 根据最小二乘法得到 y'=a'x+b'y+c' 的系数
W_x = inv((mod_pos'* mod_pos)) * mod_pos' * pos_x; % 根据最小二乘法得到 x'=ax+by+c 的系数
W_y = inv((mod_pos'* mod_pos)) * mod_pos' * pos_y; % 根据最小二乘法得到 y'=a'x+b'y+c' 的系数

[hight_tar, wide_tar, nsc] = size(ori_img); % 斜着的图像的尺寸
[hight, wide, nsc] = size(mod_img); % 正着的图像尺寸

recover_img = uint8(ones(hight, wide, 3)*128); % 初始化恢复的图像矩阵

% x_pos = [212, 23, 1] * W_x
% y_pos = [212, 23, 1] * W_y


for i = 1:wide
    for j = 1:hight
        map_x = floor([i, j, 1] * W_x); % 已知正着的图像的坐标得到斜着的图像的坐标x
        map_y = floor([i, j, 1] * W_y); % 已知正着的图像的坐标得到斜着的图像的坐标y
        if map_x >= 1 && map_x <= wide_tar && map_y >= 1 && map_y <= hight_tar
            recover_img(j, i, :) = ori_img(map_y, map_x, :); % 用斜着的图像的灰度值来代替初始化图像矩阵
        end
    end
end

%subplot(2,2,2);
figure();
imshow(mod_img);
%subplot(2,2,4);
figure();
imshow(recover_img);
        