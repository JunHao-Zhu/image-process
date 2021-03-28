function[Figure]=Gray_change(Figure,type)
%% ����������ʵ�ֶ�ͼƬ�ĻҶ�ֵ���д���
% Inpute:
%   path: ͼƬ�洢·��
%   type: ���ûҶ�ֵ�仯���ͣ��������ṩ��һ�¼������ͣ�
%       ��Linear��:�Ҷ�ֵ���Ա仯
%       ��Log��:�Ҷ�ֵ�����Զ����仯
%       ��Index��:�Ҷ�ֵ������ָ���仯
%       ��Histogram_Equalization��:ֱ��ͼ���⻯
%#################################################################################
    % ͼƬ������
%     Figure=imread(path);
%     Figure=rgb2gray(Figure);
%     figure(1);
%     subplot(1,2,1);imshow(Figure);title('Original Figure');
    
    [M,N]=size(Figure);
    Figure=double(Figure);
    
    % �������ԻҶȱ任
    if strcmp(type,'Linear')
        for i=1:M
            for j=1:N
                % ���Ժ��������Լ�����
                if Figure(i,j)<=20
                    Figure(i,j)=Figure(i,j);
                elseif Figure(i,j)<=150
                    Figure(i,j)=(200-20)/(150-20)*(Figure(i,j)-20)+20;
                else
                    Figure(i,j)=(250-200)/(300-150)*(Figure(i,j)-150)+200;
                end
            end
        end
        
        % ������
        Figure=uint8(Figure);
%         subplot(1,2,2);imshow(Figure);title('Linear Gray Change');
 
    % ###################################################
    % �����Զ����Ҷȱ任
    elseif strcmp(type,'Log')
        % ��ͼ���ֵ���лҶȱ仯
        Figure=41*log(Figure+1);
        
        % ������
        Figure=uint8(Figure);
%         subplot(1,2,2);imshow(Figure);title('Log Gray Change');
        
    % ###################################################
    % ������ָ���Ҷȱ任
    elseif strcmp(type,'Index')
        % ��ͼ���ֵ���лҶȱ仯
%         Figure=Figure.*Figure/255;
        Figure=(Figure.^0.9);
        
        % ������
        Figure=uint8(Figure);
%         subplot(1,2,2);imshow(Figure);title('Index Gray Change');  
     
    % ################################################### 
    % ֱ��ͼ���⻯
    elseif strcmp(type,'Histogram_Equalization')
        freq = reshape(Figure, [1,M*N]);
        tab = tabulate(freq);
        tab(:, 3) = cumsum(tab(:, 3));

        % ��ԭ���ظ���Ƶ��ת��
        for i = 1 : M
            for j = 1:N
                k = find(tab(:,1)==Figure(i,j));
                Figure(i,j) = fix(tab(k(1),3)/100.0 * 255);
            end
        end
        Figure = uint8(Figure);
    % ################################################### 
    % �쳣����
    else
        disp('Please Input the right type,this function only support the Linear\NonLinear\Histogram_Equalization');
    end
end