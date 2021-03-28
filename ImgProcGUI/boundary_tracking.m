function[g]=boundary_tracking(f)

    offsetr=[-1,0,1,0];         % ��������������
    offsetc=[0,1,0,-1];
    next_search_dir_table=[4,1,2,3];    % ������һ����������

    next_dir_table=[2,3,4,1];
    start=-1;       
    boundary=-2;
    [rv,cv]=find((f(2:end-1,:)>0)&(f(1:end-2,:)==0));  % Ѱ�ҷ��������������������ҵ���ʼ��
    rv=rv+1;       
    startr=rv(1);   % ����������ʼ����������
    startc=cv(1);
    
    f=im2double(f);     % ͼƬ��ʽת�ɿɴ���ģʽ
    f(startr,startc)=start;
    cur_p=[startr,startc];
    init_departure_dir=-1;
    done=0;
    next_dir=2; % ��ʼ��������
    
    while ~done
        dir=next_dir;
        for i=1:length(offsetr)         % ������Ѱ����һ����Ե��
            offset=[offsetr(dir),offsetc(dir)];
            neighbor=cur_p+offset;
            if(f(neighbor(1),neighbor(2))~=0)   % �ھ����ڱ�Ե��
                if((f(cur_p(1),cur_p(2))==start) & (init_departure_dir==-1))
                    init_departure_dir=dir;
                elseif((f(cur_p(1),cur_p(2))==start) & (init_departure_dir==dir)) % ��������
                    done=1;
                    break;
                end
                next_dir=next_search_dir_table(dir);
                if(f(neighbor(1),neighbor(2))~=start)
                    f(neighbor(1),neighbor(2))=boundary;
                end
                cur_p=neighbor;     % ���µ�ǰ�ڵ�
                break;
            end
            dir=next_dir_table(dir);   % ����ޱ�Ե�����
        end
    end
    
    bi=find(f==boundary);
    f(:)=0;
    f(bi)=255;
    f(startr,startc)=255;
    g=im2bw(f);
end