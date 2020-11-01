function mod_img = rotate(img, theta)
    % 图像的旋转
    % img: 输入的图像 theta: 旋转角度
    angle = theta / 180 * pi;
    shape = size(img);
    c1 = [shape(1); shape(2)] / 2;
    rot_mat = [cos(angle), -sin(angle);sin(angle), cos(angle)];
    rot_mat = rot_mat';
    
    reshape = [floor(shape(2)*sin(angle)+shape(1)*cos(angle))+1, floor(shape(1)*sin(angle)+shape(2)*cos(angle))+1];
    c2 = [reshape(1); reshape(2)] / 2;
    mod_img = uint8(ones(reshape)*128);
    for i = 1:reshape(1)
        for j = 1:reshape(2)
            mod_pos = [i; j];
            pos = round(rot_mat*(mod_pos-c2)+c1);
            if pos(1)>=1 && pos(1)<=shape(1) && pos(2)>=1 && pos(2)<=shape(2)
                mod_img(i, j) = img(pos(1), pos(2));
            end
        end
    end
end