clc;

% Generate 100 random 4-dimensional random data points such that
% each attribute can take values between 0 and 100. With this 
% dataset form the same number of clusters as selected by you 
% in (d) above. Report the centroids and populations of the clusters.
% Compare the total SSE for this random dataset with the SSE for 
% the clustering of the provided dataset. Compare and comment
% on the differences between the two total SSE values.

rd = zeros(100, 4);

x = randi([0,100]);
for row = 1:100
    for col = 1:4
        rd(row,col) = randi([1,100]);
    end
end
format shortG;
[cls, centroid, sse] = kmeans(rd,8);

totalSse = sum(sse);

centroid
totalSse
sse
