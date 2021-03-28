function[g]=boundary_tracking(f)

    offsetr=[-1,0,1,0];         % 行列四领域索引
    offsetc=[0,1,0,-1];
    next_search_dir_table=[4,1,2,3];    % 设置下一个搜索方向

    next_dir_table=[2,3,4,1];
    start=-1;       
    boundary=-2;
    [rv,cv]=find((f(2:end-1,:)>0)&(f(1:end-2,:)==0));  % 寻找符合条件的行列索引，找到起始点
    rv=rv+1;       
    startr=rv(1);   % 设置行列起始的行列索引
    startc=cv(1);
    
    f=im2double(f);     % 图片格式转成可处理模式
    f(startr,startc)=start;
    cur_p=[startr,startc];
    init_departure_dir=-1;
    done=0;
    next_dir=2; % 初始搜索方向
    
    while ~done
        dir=next_dir;
        for i=1:length(offsetr)         % 四领域寻找下一个边缘点
            offset=[offsetr(dir),offsetc(dir)];
            neighbor=cur_p+offset;
            if(f(neighbor(1),neighbor(2))~=0)   % 邻居属于边缘点
                if((f(cur_p(1),cur_p(2))==start) & (init_departure_dir==-1))
                    init_departure_dir=dir;
                elseif((f(cur_p(1),cur_p(2))==start) & (init_departure_dir==dir)) % 结束条件
                    done=1;
                    break;
                end
                next_dir=next_search_dir_table(dir);
                if(f(neighbor(1),neighbor(2))~=start)
                    f(neighbor(1),neighbor(2))=boundary;
                end
                cur_p=neighbor;     % 跟新当前节点
                break;
            end
            dir=next_dir_table(dir);   % 如果无边缘点继续
        end
    end
    
    bi=find(f==boundary);
    f(:)=0;
    f(bi)=255;
    f(startr,startc)=255;
    g=im2bw(f);
end