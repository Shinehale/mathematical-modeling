
%% ex6.7-2 �������
%***************************��ȡ���ݣ������б�׼��***************************
[X,textdata] = xlsread('�ֵ��������˾�����֧��.xls');
obslabel = textdata(4:end,1);
X = zscore(X);

%******************************* K��ֵ���� **********************************
startdata = X(1:3,:);
id2 = kmeans(X,3,'Start',startdata);
obslabel(id2 == 1)
obslabel(id2 == 2)
obslabel(id2 == 3)
