function mod_img = mirror(img, flag)
    % ˮƽ������ߴ�ֱ�����ʵ��
    % img: �����ͼ����� flag: ˮƽ�����Ǵ�ֱ���� 1: ˮƽ���� 0:��ֱ����
    shape = size(img);
    if length(shape) ~= 2
        error('�������ά����');
    end
    mod_img = img;
    if flag == 1
        mod_img(:,:) = mod_img(:, end:-1:1); % ˮƽ����
    else
        if flag == 0
            mod_img(:,:) = mod_img(end:-1:1, :); % ��ֱ����
        else
            error('flagȡֵΪ0��1'); 
        end
    end
end