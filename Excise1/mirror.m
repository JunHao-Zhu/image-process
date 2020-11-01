function mod_img = mirror(img, flag)
    % 水平镜像或者垂直镜像的实现
    % img: 输入的图像矩阵 flag: 水平镜像还是垂直镜像 1: 水平镜像 0:垂直镜像
    shape = size(img);
    if length(shape) ~= 2
        error('请输入二维矩阵');
    end
    mod_img = img;
    if flag == 1
        mod_img(:,:) = mod_img(:, end:-1:1); % 水平镜像
    else
        if flag == 0
            mod_img(:,:) = mod_img(end:-1:1, :); % 垂直镜像
        else
            error('flag取值为0或1'); 
        end
    end
end