%--------------------------------------------------------------------------
%  L6  常用统计建模方法MATLAB求解
%--------------------------------------------------------------------------


%% ex6.1-1
T = readtable('体测成绩.xls','ReadRowNames',false);
T.Properties.VariableNames = {'Class','StudentId','Height',...
    'Weight','Rank','VC','Score1','Score2','Score3'};
whichstats = {'mean','std','min','max'};
T1 = T(:,{'Class','Height'});
statarray = grpstats(T1,'Class',whichstats)
T2 = T(:,{'Class','Weight'});
statarray = grpstats(T2,'Class',whichstats)
T3 = T(:,{'Class','VC'});
statarray = grpstats(T3,'Class',whichstats)

T4 = T(:,{'Height','Weight','VC','Score1','Score2','Score3'});
T4 = table2array(T4);
id = any(isnan(T4),2);
T4(id,:) = [];
corrcoef(T4)

T5 = T.Rank;
tabulate(T5);

% 统计图
% 箱线图
VC = T.VC;                            % 提取肺活量数据
group = T.Class;                      % 提取班级数据
figure;                               % 新建图形窗口
boxplot(VC,group)                     % 绘制箱线图
ylabel('肺活量')                       % y轴标签

% 频率直方图与核密度曲线
figure;                     % 新建图形窗口
[f, xc] = ecdf(VC);         % 调用ecdf函数计算xc处的经验分布函数值f
ecdfhist(f, xc);            % 绘制频率直方图
xlabel('肺活量');           % 为X轴加标签
ylabel('f(x)');             % 为Y轴加标签
hold on
[f2,xc2] = ksdensity(VC);   % 核密度估计
plot(xc2,f2,'r')            % 绘制核密度曲线
legend('频率直方图','核密度曲线','Location','NorthEast');  % 添加图例

% 正态概率图
figure;          % 新建图形窗口
normplot(VC);    % 绘制正态概率图

% 分组散点图
figure;
gscatter(T.Height,T.Weight,T.Class,'br','o*');  % 绘制分组散点图
xlabel('身高'); 
ylabel('体重')

% 分组散点图矩阵
figure;
data = [T.Height,T.Weight,T.VC];            % 提取身高、体重和肺活量数据
varname = {'身高','体重','肺活量'};           % 变量名元胞数组
gplotmatrix (data,[],T.Class,'br','o*');    % 绘制分组散点图矩阵
text([0.14,0.48,0.8], repmat(-0.1,1,3),...  % x轴下方标注变量名
     varname, 'FontSize',8);
text(repmat(-0.1,1,3), [.8,.48,0.12],...    % y轴左边标注变量名
     varname, 'FontSize',8, 'Rotation',90);

% 三维饼图
RankStr = T.Rank;
tab = tabulate(RankStr);
x = cell2mat(tab(:,3));
explode = [0,0,1,0,0];
labels = tab(:,1);
figure;
pie3(x,explode,labels);

%% ex6.2-1 常用分布参数估计
%+++++++++++++++++++++++++调用normfit函数求解+++++++++++++++++++++++++++++++
x = [15.14  14.81  15.11  15.26  15.08  15.17  15.12  14.95  15.05  14.87];
[muhat,sigmahat,muci,sigmaci] = normfit(x,0.1)

%++++++++++++++++++++++++++++调用mle函数求解++++++++++++++++++++++++++++++++
x = [15.14  14.81  15.11  15.26  15.08  15.17  15.12  14.95  15.05  14.87];
[mu_sigma,mu_sigma_ci] = mle(x,'distribution','norm','alpha',0.1)

%% ex6.2-2 自定义分布参数估计
x = [0.7917,0.8448,0.9802,0.8481,0.7627
        0.9013,0.9037,0.7399,0.7843,0.8424
        0.9842,0.7134,0.9959,0.6444,0.8362
        0.7651,0.9341,0.6515,0.7956,0.8733];
x = x(:);
PdfFun = @(x,theta) theta*x.^(theta-1).*(x>0 & x<1);
[phat,pci] = mle(x,'pdf',PdfFun,'start',1)

%% ex6.2-3 多参数估计
rand('seed',1);
randn('seed',1);
x = normrnd(35,5,600,1);
y = evrnd(20,2,400,1);
data = [x;y];
pdffun = @(t,mu1,sig1,mu2,sig2)0.6*normpdf(t,mu1,sig1)+0.4*evpdf(t,mu2,sig2);
[phat,pci] = mle(data,'pdf',pdffun,'start',[10,10,10,10],...
    'lowerbound',[-inf,0,-inf,0],'upperbound',[inf,inf,inf,inf])


%% ex6.3-1 总体标准差已知时的单个正态总体均值的检验
%++++++++++++++++++++++++++++++++双侧检验++++++++++++++++++++++++++++++++++
x = [97  102  105  112  99  103  102  94  100  95  105  98  102  100  103];
mu0 = 100;
Sigma = 2;
Alpha = 0.05;
[h,p,muci,zval] = ztest(x,mu0,Sigma,Alpha)

%%
%++++++++++++++++++++++++++++++++单侧检验++++++++++++++++++++++++++++++++++
x = [97  102  105  112  99  103  102  94  100  95  105  98  102  100  103];
mu0 = 100;
Sigma = 2;
Alpha = 0.05;
tail = 'right';
[h,p,muci,zval] = ztest(x,mu0,Sigma,Alpha,tail)

%% ex6.3-2 总体标准差未知时的单个正态总体均值的检验
x = [49.4  50.5  50.7  51.7  49.8  47.9  49.2  51.4  48.9];
mu0 = 50;
Alpha = 0.05;
[h,p,muci,stats] = ttest(x,mu0,Alpha)

%% ex6.3-3 总体均值未知时的单个正态总体方差的检验
x = [49.4  50.5  50.7  51.7  49.8  47.9  49.2  51.4  48.9];
var0 = 1.5;
alpha = 0.05;
tail = 'both';
[h,p,varci,stats] = vartest(x,var0,alpha,tail)

%% ex6.3-4 总体标准差未知时的两个正态总体均值的比较检验（独立样本）
x = [20.1,  20.0,  19.3,  20.6,  20.2,  19.9,  20.0,  19.9,  19.1,  19.9];
y = [18.6,  19.1,  20.0,  20.0,  20.0,  19.7,  19.9,  19.6,  20.2];
alpha = 0.05;
tail = 'both';
vartype = 'equal';
[h,p,muci,stats] = ttest2(x,y,alpha,tail,vartype)

%% ex6.3-4x 总体标准差未知时的两个正态总体均值的比较检验（配对样本）
% x = [80.3,68.6,72.2,71.5,72.3,70.1,74.6,73.0,58.7,78.6,85.6,78.0];
% y = [74.0,71.2,66.3,65.3,66.0,61.6,68.8,72.6,65.7,72.6,77.1,71.5];
% Alpha = 0.05;
% tail = 'both';
% [h,p,muci,stats] = ttest(x,y,Alpha,tail)

%% ex6.3-5 总体均值未知时的两个正态总体方差的比较检验
x = [20.1,  20.0,  19.3,  20.6,  20.2,  19.9,  20.0,  19.9,  19.1,  19.9];
y = [18.6,  19.1,  20.0,  20.0,  20.0,  19.7,  19.9,  19.6,  20.2];
alpha = 0.05;
tail = 'both';
[h,p,varci,stats] = vartest2(x,y,alpha,tail)

%% ex6.6-1  一元线性回归
data = xlsread('沪深股市收益率.xls');
x = data(:,5);
y = data(:,10);
plot(x, y, 'k.', 'Markersize', 15);
xlabel('深市收益率(x)');
ylabel('沪市收益率(y)');
%计算x和y的线性相关系数矩阵R
R = corrcoef(x, y)
%[b,bint,r,rint,stats]=regress(y,x,0.05) 

%mdl1 = LinearModel.fit(x,y)    % 模型求解
mdl1 = fitlm(x,y)


figure;
mdl1.plot;
xlabel('深市收益率(x)');
ylabel('沪市收益率(y)');
title('');
legend('原始散点','回归直线','置信区间');

xnew = [0.035,0.04]';
ynew = mdl1.predict(xnew)

Res = mdl1.Residuals;
Res_Stu = Res.Studentized;
id = find(abs(Res_Stu)>2);  
%mdl2 = LinearModel.fit(x,y, 'Exclude',id)
mdl2=fitlm(x,y, 'Exclude',id)

figure;
mdl2.plot;
xlabel('深市收益率(x)');
ylabel('沪市收益率(y)');
title('');
legend('剔除异常数据后散点','回归直线','置信区间');


%% ex6.6-3 多元线性和广义线性回归
% data = xlsread('人体耗氧能力测试.xls');
% X = data(:,3:7);
% y = data(:,2);
% [R,P] = corrcoef([y,X])
% VarNames = {'y','x1','x2','x3','x4','x5'};
% matrixplot(R,'FigShap','e','FigSize','Auto', ...
%     'ColorBar','on','XVar', VarNames,'YVar',VarNames);
% 
% %mmdl1 = LinearModel.fit(X,y)
% mmdl1 = fitlm(X,y)
% 
% figure;
% subplot(1,2,1);
% mmdl1.plotResiduals('histogram');
% title('(a) 残差直方图');
% xlabel('残差r');ylabel('f(r)');
% subplot(1,2,2);
% mmdl1.plotResiduals('probability');
% title('(b) 残差正态概率图');
% xlabel('残差');ylabel('概率');
% 
% Res3 = mmdl1.Residuals;
% Res_Stu3 = Res3.Studentized;
% id3 = find(abs(Res_Stu3)>2);
% 
% Model = 'poly10101';
% mmdl2 = LinearModel.fit(X,y,Model,'Exclude',id3)
% 
% Model = 'poly22222';
% mmdl3 = LinearModel.fit(X,y,Model)
% 
% figure;
% plot(y,'ko');
% hold on
% plot(mmdl1.predict(X),':');
% plot(mmdl2.predict(X),'r-.');
% plot(mmdl3.predict(X),'k');
% legend('y的原始散点','5元线性回归拟合',...
%     '3元线性回归拟合','完全二次回归拟合');
% xlabel('y的观测序号'); 
% ylabel('y'); 
% 
% mmdl4 = LinearModel.stepwise(X,y, 'poly22222')
% yfitted = mmdl4.Fitted;
% figure;
% plot(y,'ko');
% hold on
% plot(yfitted,':','linewidth',2);
% legend('y的原始散点','逐步回归拟合');
% xlabel('y的观测序号');
% ylabel('y');    
% 
% model = [0 0 0 0 0
%          1 0 0 0 0
%          0 1 0 0 0
%          0 0 0 0 1
%          2 0 0 0 0
%          1 1 0 0 0
%          0 1 1 0 0
%          1 0 0 1 0
%          0 0 0 2 0
%          1 0 0 0 1
%          0 1 0 0 1
%          0 0 1 0 1
%          0 0 0 0 2];
% mmdl5 = LinearModel.fit(X,y,model)


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


