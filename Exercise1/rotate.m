clc;
% ����ͼ��
img = imread('image1.jpeg');
[hight, width, ~] = size(img);
figure();
imshow(img);title('ԭͼ');

% ������ת�ǶȲ�ת��Ϊ����
theta = 60;
angel = theta * pi / 180;
rotate_mat = [cos(angel), sin(angel), 0; -sin(angel), cos(angel), 0; 0, 0, 1];

% �����ת��ͼ��Ļ�����С
rot_h = floor(width*sin(angel) + hight*cos(angel)) + 1;
rot_w = floor(width*cos(angel) + hight*sin(angel)) + 1;

%�õ�ͼ���������ͼ������Ľ�����ת
cent1 = [hight/2; width/2; 1];
cent2 = [rot_h/2; rot_w/2; 1];

new_img = ones(rot_h, rot_w, 3);
for i = 1 : rot_h
    for j = 1 : rot_w
        ori_pos = rotate_mat \ ([i; j; 1] - cent2) + cent1; %�����Ľ�����ת
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
imshow(new_img);title('��ת���ͼ��');