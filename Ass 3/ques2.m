%Function to Group data points in 4 clusters, calculating and printing
    %Centroids respectively
        function ques2(clusters)
            c1 = zeros(length(clusters(clusters==1)),5);
            c2 = zeros(length(clusters(clusters==2)),5);
            c3 = zeros(length(clusters(clusters==3)),5);
            c4 = zeros(length(clusters(clusters==4)),5);
            i1=1; i2=1;
            i3=1; i4=1;
            for i=1:length(clusters)
                if((clusters(i) == 1))
                    c1(i1,:) = data(i,:); 
                    i1 = i1+1;
                elseif((clusters(i) == 2))
                    c2(i2,:) = data(i,:); 
                    i2 = i2+1;
                elseif((clusters(i) == 3))
                    c3(i3,:) = data(i,:); 
                    i3 = i3+1;
                elseif((clusters(i) == 4))
                    c4(i4,:) = data(i,:); 
                    i4 = i4+1;
                end
            end
            centroid1 = Centroid(c1); centroid2 = Centroid(c2); centroid3 = Centroid(c3); centroid4 = Centroid(c4);
            display(1,c1,centroid1); display(2,c2,centroid2); display(3,c3,centroid3); display(4,c4,centroid4);
            %Function to calculate Centroids
            function temp = Centroid(C)
                temp(1) = sum(C(:,2))/length(C(:,1));
                temp(2) = sum(C(:,3))/length(C(:,1));
                temp(3) = sum(C(:,4))/length(C(:,1));
                temp(4) = sum(C(:,5))/length(C(:,1));
            end
            %Function to display Results
            function display(num,clust,cent)
                fprintf('\nPoints in Cluster-%d: \n',num);
                fprintf('    S.No  Phy  Maths  Eng  Music\n');
                disp(clust);
                fprintf('\nCentroid of Cluster-%d: \n',num);
                fprintf('   Phy      Maths      Eng       Music\n');
                disp(cent); 
            end
        end

