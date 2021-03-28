function[Processed_Figure_Value]=Sharpen_filter(Figure, type)
%% ����������ʵ�ֶ�ͼ����񻯲�����
% Inpute:
%   path: ͼƬ�洢·��
%   type: �����˲������ͣ��������ṩRobert, Sobel, Prewitt, Laplacian4��Laplacian8�����˲���
%#################################################################################
    % ͼƬ����
    Figure=rgb2gray(Figure);
    Figure_Shape=size(Figure);
    
    
    % ����type������ȷ������
    if strcmp(type,'Laplacian4') || strcmp(type,'Laplacian8')
        %ѡ��4����Laplacian����
        if strcmp(type,'Laplacian4')
            Kernel=[0,1,0;1,-4,1;0,1,0];
        end
        
        % ѡ��8����Laplacian����
        if strcmp(type,'Laplacian8')
            Kernel=[1,1,1;1,-8,1;1,1,1];
        end
        
        % �����ʼͼ��
        figure(1);
        subplot(1,2,1);imshow(Figure);title('Orginal Figure');
        Kernel_Shape=size(Kernel);
        Figure=double(Figure);
        
        % ��ʼ�洢����
        Fix_Figure=zeros(Figure_Shape(1)-Kernel_Shape(1)+1,...
            Figure_Shape(2)-Kernel_Shape(2)+1,3);
        
        % �˲�����
        for channel=1:3
            for x=1:Figure_Shape(1)-Kernel_Shape(1)+1
                for y=1:Figure_Shape(2)-Kernel_Shape(2)+1
                    Fix_Figure(x,y,channel)=sum(sum(Figure(x:x+Kernel_Shape-1,y:y+Kernel_Shape-1,channel).*Kernel));
                end
            end
        end
        
        % ������
        Fix_Figure=uint8(Fix_Figure);
%         subplot(1,2,2);imshow(Fix_Figure);title('Gradient Figure');
        
    elseif strcmp(type,'Robert') || strcmp(type,'Sobel') || strcmp(type,'Prewitt')
        % ѡ��Robert����
        if strcmp(type,'Robert')
            Kernel_X=[1,0;0,-1];
            Kernel_Y=[0,1;-1,0];
        end
        
        % ѡ��Prewitt����
        if strcmp(type,'Prewitt')
            Kernel_X=[1,1,1;0,0,0;-1,-1,-1];
            Kernel_Y=[-1,0,1;-1,0,1;-1,0,1];
        end
        
        % ѡ��Robert����
        if strcmp(type,'Sobel')
            Kernel_X=[1,2,1;0,0,0;-1,-2,-1];
            Kernel_Y=[1,0,-1;2,0,-2;-1,0,-1];
        end
        
        % ԭʼͼ�����ʾ
%         figure(1);
%         subplot(2,2,1);imshow(Figure);title('Original Figure');
        Kernel_Shape=size(Kernel_X);
        Figure=double(Figure);
        
        % �洢�����ʼ��
        Processed_Figure_X=zeros(Figure_Shape(1)-Kernel_Shape(1)+1,...
            Figure_Shape(2)-Kernel_Shape(2)+1);
        Processed_Figure_Y=zeros(Figure_Shape(1)-Kernel_Shape(1)+1,...
            Figure_Shape(2)-Kernel_Shape(2)+1);
        Processed_Figure_Value=zeros(Figure_Shape(1)-Kernel_Shape(1)+1,...
            Figure_Shape(2)-Kernel_Shape(2)+1);
        
        % �˲�����
%         for channel=1:3
            for x=1:Figure_Shape(1)-Kernel_Shape(1)+1
                for y=1:Figure_Shape(2)-Kernel_Shape(2)+1
                    Processed_Figure_X(x,y)=sum(sum(Figure(x:x+Kernel_Shape-1,y:y+Kernel_Shape-1).*Kernel_X));
                    Processed_Figure_Y(x,y)=sum(sum(Figure(x:x+Kernel_Shape-1,y:y+Kernel_Shape-1).*Kernel_Y));
                    Processed_Figure_Value(x,y)=Processed_Figure_X(x,y)+Processed_Figure_Y(x,y);
                end
            end
%         end 
        
        % �����ͼƬ��ʾ
        Processed_Figure_X=uint8(Processed_Figure_X);
%         subplot(2,2,2);imshow(Processed_Figure_X);title('Gradient-X Figure');
        Processed_Figure_Y=uint8(Processed_Figure_Y);
%         subplot(2,2,3);imshow(Processed_Figure_Y);title('Gradient-Y Figure');
        Processed_Figure_Value=uint8(Processed_Figure_Value);
%         subplot(2,2,4);imshow(Processed_Figure_Value);title('Gradient-Value Figure');
    else
         % ����������ʾ
         disp(['Please Input the right type,this function only support the Robert\Sobel\Laplacian8\Laplacian4']);
     end
end