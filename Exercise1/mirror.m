clc;
% ����ͼ��
img = imread('image1.jpeg');
[hight, width, ~] = size(img);
subplot(1,2,1);
imshow(img);title('ԭͼ');

% ���ɾ������
mir_mat_h = [1, 0, 0; 0, -1, 0; 0, 0, 1]; % ˮƽ���������
mir_mat_v = [-1, 0, 0; 0, 1, 0; 0, 0, 1]; % ��ֱ���������

% ��ˮƽ����ľ������
new_img_h = zeros(hight, width, 3);
for i = 1 : hight
    for j = 1 : width
        mod_pos = mir_mat_h * [i; j; 1];
        mod_x = mod_pos(1, 1);
        mod_y = mod_pos(2, 1) + width + 1;
        if(mod_x <= hight && mod_y <= width && mod_x >= 1 && mod_y >= 1)
            new_img_h(mod_x, mod_y, :) = img(i, j, :);
        end
    end
end
new_img_h = uint8(new_img_h);
subplot(2,2,2);
imshow(new_img_h);title('ˮƽ����');

% ����ֱ����ľ������
new_img_v = zeros(hight, width, 3);
for i = 1 : hight
    for j = 1 : width
        mod_pos = mir_mat_v * [i; j; 1];
        mod_x = mod_pos(1, 1) + hight + 1;
        mod_y = mod_pos(2, 1);
        if(mod_x <= hight && mod_y <= width && mod_x >= 1 && mod_y >=1)
            new_img_v(mod_x, mod_y, :) = img(i, j, :);
        end
    end
end
new_img_v = uint8(new_img_v);
subplot(2,2,4);
imshow(new_img_v);title('��ֱ����');