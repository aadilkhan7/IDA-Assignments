clc;
data = xlsread('data_banknote_authentication.xlsx');
d1= data(:,1:5);
cm= cov(d1);

D10=d1(d1(:,5)==0,:)
D11=d1(d1(:,5)==1,:)
scatter(D10(:,1),D10(:,2),'k')
hold
scatter(D11(:,1),D11(:,2),'r')

% for i=1:size(d1,1)
%     d1(i,6)=i;
% end
% randData = d1(randperm(1372),:);
% training= randData(1:800,:);
% validation = randData(801:1000,:);
% testing = randData(1001:1372,:);
% 
% 
% % testRowNum = testing(:,6);
% % testRowNum = sort(testRowNum);
% % for i=1:length(testRowNum)
% %     fprintf('%d, ',testRowNum(i));
% % end
% 
% 
% % testClass1 = testing(testing(:,5)== 1,:)
% % testClass0 = testing(testing(:,5)== 0,:)
% Q5DT  = fitctree(d1(:,1:2), d1(:,5), 'MinLeafSize',50);
% 
% view(Q5DT,'mode','graph');
% % 
% % %Plotting on Validation set:
% % 
% % minLeaf = [1,2,5,10,15,20,25,30,35,40,45,50];
% % 
% % 
% % index=1;
% % Acc= zeros(1,12);
% %  
% % 
% % 
Q5DT  = fitctree(training(:,1:4), training(:,5), 'MinLeafSize',20);  
view(Q5DT,'mode','graph');
% % 
% % Output = predict(Q5DT, testClass0(:,1:4));
% % 
% % accuracy= 0;
% % 
% % for j=1:size(Output,1)
% %     
% %     if(Output(j) == testClass0(j,5))
% %         accuracy = accuracy + 1;
% %     end
% % end
% % 
% % Acc = accuracy/size(Output,1)
% % confMat = confusionmat(testClass0(:,5) , Output);
% % confMat 
% 
