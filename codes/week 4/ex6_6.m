

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



