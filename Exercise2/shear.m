clc
% �������ǰ��ͼ��(б�ŵ�ͼ��)�Լ����к��ͼ�����ŵ�ͼ��
ori_img = imread('reality.jpg'); % б�ŵ�ͼ��
mod_img = imread('target.jpg'); % ���ŵ�ͼ��
%subplot(1,2,1);
figure();
imshow(ori_img);

% �������ǰ�ʹ��к��Ӧ�����ص��λ��
% mod_pos_x = [62; 133; 70; 119];
% mod_pos_y = [139; 231; 46; 163];
% ori_pos = [62, 170, 1; 133, 294, 1; 71, 81, 1; 119, 220, 1];
pos_x = [62; 133; 71; 119; 104; 62]; % б�ŵ�ͼ���x����
pos_y = [170; 294; 81; 220; 79; 148]; % б�ŵ�ͼ���y����
mod_pos = [62, 139, 1; 133, 231, 1; 70, 46, 1; 119, 163, 1; 105, 28, 1; 61, 119, 1]; % ���ŵ�ͼ�����꣨x,y,1��

% W_x = inv((ori_pos'* ori_pos)) * ori_pos' * mod_pos_x; % ������С���˷��õ� x'=ax+by+c ��ϵ��
% W_y = inv((ori_pos'* ori_pos)) * ori_pos' * mod_pos_y; % ������С���˷��õ� y'=a'x+b'y+c' ��ϵ��
W_x = inv((mod_pos'* mod_pos)) * mod_pos' * pos_x; % ������С���˷��õ� x'=ax+by+c ��ϵ��
W_y = inv((mod_pos'* mod_pos)) * mod_pos' * pos_y; % ������С���˷��õ� y'=a'x+b'y+c' ��ϵ��

[hight_tar, wide_tar, nsc] = size(ori_img); % б�ŵ�ͼ��ĳߴ�
[hight, wide, nsc] = size(mod_img); % ���ŵ�ͼ��ߴ�

recover_img = uint8(ones(hight, wide, 3)*128); % ��ʼ���ָ���ͼ�����

% x_pos = [212, 23, 1] * W_x
% y_pos = [212, 23, 1] * W_y


for i = 1:wide
    for j = 1:hight
        map_x = floor([i, j, 1] * W_x); % ��֪���ŵ�ͼ�������õ�б�ŵ�ͼ�������x
        map_y = floor([i, j, 1] * W_y); % ��֪���ŵ�ͼ�������õ�б�ŵ�ͼ�������y
        if map_x >= 1 && map_x <= wide_tar && map_y >= 1 && map_y <= hight_tar
            recover_img(j, i, :) = ori_img(map_y, map_x, :); % ��б�ŵ�ͼ��ĻҶ�ֵ�������ʼ��ͼ�����
        end
    end
end

%subplot(2,2,2);
figure();
imshow(mod_img);
%subplot(2,2,4);
figure();
imshow(recover_img);
        