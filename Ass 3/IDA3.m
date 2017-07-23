clc;
data = xlsread('StudentData2.xlsx');
X = data(:,2:5);
kms = zeros(57,6);
K = [5, 6, 7, 8, 9, 10];
SSEs = zeros(1,6);
totalSseMin = 111111111;
col = 1;

for k = K
    
    for run = 1:3%Running three time for minimum SSE
        [cls, center, sse] = kmeans(X,k);
        temp = sum(sse);
        if(totalSseMin > temp)
            totalSseMin = temp;  
            centerMin = center;
            sseMin = sse;
            clusterMin = cls;
        end       
    end
    
%     disp("Centers");
%     disp(centerMin);
%     disp("SSE");
%     disp(sseMin);
%     disp("Total SSE");
%     disp(totalSseMin);
%     
    SSEs(1,col) = totalSseMin;   
    kms(:,col) = clusterMin;
    col = col + 1;
end

%plot(SSEs, K);

% for k = 1:6%The Silhouette
%     subplot(2,3,k);
%     silhouette(X, kms(:,k) ) %SILHOUETTE FOR CLUSTERTING K = i
%     
% end
%     
% Reporting the Centroids for choice of K (I chose 8)
[clustering_1, center_1, sse_1] = kmeans(X,8);



sLC = linkage(X,'single','euclidean');
C = cluster(sLC,'maxclust',4);% 4 clusters 
cLC = linkage(X,'complete','euclidean');
clustering_3 = cluster(cLC,'maxclust',4);
%dendrogram(sLC);
%dendrogram(cLC)

Y =[X, clustering_2, clustering_3];

                temp(1) = sum(C(:,1))/length(C(:,1));
                
                
 temp
% 
% RAND INDEX BETWEEN 2 AND 3
% randI(clustering_2, clustering_3)
% % 
% % RAND INDEX BETWEEN 1 AND 2
% randI(clustering_1, clustering_2)






