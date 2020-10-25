%%
clear all;
clc
%%
%load hospital
load("satellite.mat");
%%
InData = double(hospital(:,2:5));
[ m, n]= size( InData);
for i = 1: m
    h(i)= InData( i, :)* inv( InData'* InData)* InData( i, :)';
end
p = sum(h);
threshold = 2*p/n;
plot(1:m,h,'rx')
hold on
plot(1:size(x,1),repmat(threshold,size(x,1)),'b')

xlabel('Row number')
ylabel('Leverage')
title('Leverage plot')
saveas(gcf,'Leverage.png')
