
%% ex6.7-2 聚类分析
%***************************读取数据，并进行标准化***************************
[X,textdata] = xlsread('分地区居民人均消费支出.xls');
obslabel = textdata(4:end,1);
X = zscore(X);

%******************************* K均值聚类 **********************************
startdata = X(1:3,:);
id2 = kmeans(X,3,'Start',startdata);
obslabel(id2 == 1)
obslabel(id2 == 2)
obslabel(id2 == 3)
