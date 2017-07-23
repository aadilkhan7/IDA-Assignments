function randI = clusterCompare(clusterA,clusterB)
        a=0; b=0; c=0; d=0;
        for i=1:56
            x1 = clusterA(i);
            y1 = clusterB(i);
            for j=(i+1):57
                x2 = clusterA(j);
                y2 = clusterB(j);
                if(x1==x2 && y1==y2)
                    a=a+1;
                elseif(x1==x2 && y1~=y2)
                    c=c+1;
                elseif(x1~=x2 && y1==y2)
                    d=d+1;
                elseif(x1~=x2 && y1~=y2)
                    b=b+1;
                end
            end
        end
        randI = (a+b)/(a+b+c+d);
        a
        b
        c
        d
    end