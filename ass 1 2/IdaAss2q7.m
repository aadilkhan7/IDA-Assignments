clc;
data = xlsread('data_banknote_authentication.xlsx');
d1= data(:,1:5);
randData = d1(randperm(1372),:);
training= randData(1:800,:);
validation = randData(801:1000,:);
testing = randData(1001:1372,:);

xtrain = d1(:,1:2);
xtrain = xtrain.';
xLabels = d1(:,5);%TARGET
xLabels = xLabels.';
 
%Training the perceptron
net = perceptron;
net = train(net,xtrain,xLabels);
w = net.iw{1,1}, b = net.b{1}
view(net)


x = testing(:,1:2);

f = zeros(size(testing,1));

for i=1: size(testing,1)
    if(sign(dot(w,x(i,:))+b) > 0)
        f(i) = 1;
    end
    if(sign(dot(w,x(i,:))+b) < 0)
        f(i) = 0;
    end
end

correct = 0;

for i=1: size(testing,1)
    if(f(i) == testing(i,5))
        correct= correct +1;
    end
end

misclassified = size(testing,1) - correct;
correct
misclassified 

acc= correct / size(testing,1)

% D10 = d1(d1(:,5)==0,:);
% D11 = d1(d1(:,5)==1,:);
% scatter(D10(:,1),D10(:,2),'g')
% hold
% scatter(D11(:,1),D11(:,2),'r')
% hold on
% plotpc(w,b)
