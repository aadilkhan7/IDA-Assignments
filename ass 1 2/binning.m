function [ edges ] = binning( x,n )
%BINNING Summary of this function goes here
% Detailed explanation goes here
x=sort(x);
m=length(x)/n;
edges=unique(x(1:m:length(x)));

end