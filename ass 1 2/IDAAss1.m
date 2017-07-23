clc;
x=10;
data = xlsread('DataHW1.xlsx');
[rows,column] = size(data);
data(:,5)=0;
%summing all the scores and putting them in new column
for i=1:rows
    for j=2:column
        data(i,5)=data(i,5)+data(i,j);
    end
end 


scores= sortrows(data,5);

minimum = min(data(:,5));
maximum = max(data(:,5));

gradesNormal=zeros(rows,2);
%Equal width binning and grading accordingly
for i=1:rows
    gradesNormal(i,1)=data(i,1);
    gradesNormal(i,2)=discretize(data(i,5),minimum,maximum);
end
disp('Student IDs with their respective Grades');
gradesNormal
disp('Count of Each grade in Equal Width Binning');
cntOfNormal=zeros(5,2);

for i=1:5
cntOfNormal(i,1) = i;
cntOfNormal(i,2) = sum(gradesNormal(:,2)==i);
end

cntOfNormal
%Equal frequency binning
for i=1:rows
    gradesEFP(i,1) = scores(i,1);
    if(i<=8)
        gradesEFP(i,2) = 1;
    end
    if(i>=9 && i<=16)
            gradesEFP(i,2) = 2;
    end
    if(i>=17 && i<=24)
        gradesEFP(i,2) = 3;
    end
    if(i>=25 && i<=32)
        gradesEFP(i,2)= 4;
    end
    if(i>=33 && i<=40)
        gradesEFP(i,2) = 5;
    end
end

%Counting each grade in Equal frequency binning
cntOfEFP=zeros(5,2);
for i=1:5
cntOfEFP(i,1) = i;
cntOfEFP(i,2) = sum(gradesEFP(:,2)==i);
end
disp('Count of Each grade in Equal Frequency Partitioning');
cntOfEFP
NA = sum(gradesNormal(:,2)==5);% #Student happy with Normal
NEFPA = sum(gradesEFP(:,2) == 5);% #Student happy with EFP
index=1;
happyNormal=zeros(NA,2);
happyEFP=zeros(NEFPA,2);

for i=1:rows
    if(gradesNormal(i,2)==5)
        happyNormal(index,1)= gradesNormal(i,1);
        happyNormal(index,2)= gradesNormal(i,2);
        index=index+1;
    end
end

index=1;
for i=1:rows
    if(gradesEFP(i,2)==5)
        happyEFP(index,1)= gradesEFP(i,1);
        happyEFP(index,2)= gradesEFP(i,2);
        index=index+1;
    end
end
%Assumption: A happy student is one with top grade i.e. 5
disp('Student happy with Normal Partioning');
happyNormal
disp('Student happy with Equal Frequency Partioning');
happyEFP

gradesEFP = sortrows(gradesEFP,1);
index=1;
disp('Student IDs whose grades changed when converting from equal width to Equal Freq. Part.');
for i=1:rows
    if(gradesNormal(i,2) ~= gradesEFP(i,2))
        changeGrade(index,1)=gradesNormal(i,1);
        index=index+1;
    end
end
changeGrade

zS= zscore(data(:,2:4));
zData = [data(:,1),zS];
zData(:,5)=0;
for i=1:rows
    for j=2:column
        zData(i,5)=zData(i,5)+zData(i,j);
    end
end
zDataSorted = sortrows(zData,5);

zEFP= zeros(rows,2);
for i=1:rows
    zEFP(i,1) = zDataSorted(i,1);
    if(i<=8)
        zEFP(i,2) = 1;
    end
    if(i>=9 && i<=16)
            zEFP(i,2) = 2;
    end
    if(i>=17 && i<=24)
        zEFP(i,2) = 3;
    end
    if(i>=25 && i<=32)
        zEFP(i,2)= 4;
    end
    if(i>=33 && i<=40)
        zEFP(i,2) = 5;
    end
end

zEFPSorted = sortrows(zEFP,1);
disp('Grades according to Equal Frequency Partioning of Z-Score');
zEFPSorted
%Student happy with ZEFP
nHZ=sum(zEFP(i,20==5));
zEFPHappy=zeros(nHZ,1);
index=1;
for i=1:rows
    if(zEFP(i,2)== 5)
        zEFPHappy(index,1)=zEFP(i,1);
        index=index+1;
    end
end
disp('Student happy with z-Score EFP');
zEFPHappy
ED = zeros(11,11);
count=0;
%manually taking the ids and marks
studentIds=[4;9;1;2;6;7;3;5;35;40];
marks= [75, 87, 90;95, 65, 100; 65,82,80;78,48,90;54,60,80;55,19,100;37,45,90;55,15,90;13,4,80;24,0,90];
ED= pdist2(marks,marks,'euclidean');
ED(eye(size(ED))~=0)=inf;
EDwSid(2:11,2:11) = ED;

for i=1:10
    MinCol(i+1)= min(ED(:,i));
end
MinCol(1)=Inf;

EDwSid(2:11,1)=studentIds;
EDwSid(1,2:11)=studentIds;
disp('10X10 table of all pairwise Euclidean distance');
EDwSid
StdPair=[1,4;2,9; 7,5; 40,35]