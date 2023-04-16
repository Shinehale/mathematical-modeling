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
