%--------------------------------------------------------------------------
%  L6  ����ͳ�ƽ�ģ����MATLAB���
%--------------------------------------------------------------------------


%% ex6.1-1
T = readtable('���ɼ�.xls','ReadRowNames',false);
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

% ͳ��ͼ
% ����ͼ
VC = T.VC;                            % ��ȡ�λ�������
group = T.Class;                      % ��ȡ�༶����
figure;                               % �½�ͼ�δ���
boxplot(VC,group)                     % ��������ͼ
ylabel('�λ���')                       % y���ǩ

% Ƶ��ֱ��ͼ����ܶ�����
figure;                     % �½�ͼ�δ���
[f, xc] = ecdf(VC);         % ����ecdf��������xc���ľ���ֲ�����ֵf
ecdfhist(f, xc);            % ����Ƶ��ֱ��ͼ
xlabel('�λ���');           % ΪX��ӱ�ǩ
ylabel('f(x)');             % ΪY��ӱ�ǩ
hold on
[f2,xc2] = ksdensity(VC);   % ���ܶȹ���
plot(xc2,f2,'r')            % ���ƺ��ܶ�����
legend('Ƶ��ֱ��ͼ','���ܶ�����','Location','NorthEast');  % ���ͼ��

% ��̬����ͼ
figure;          % �½�ͼ�δ���
normplot(VC);    % ������̬����ͼ

% ����ɢ��ͼ
figure;
gscatter(T.Height,T.Weight,T.Class,'br','o*');  % ���Ʒ���ɢ��ͼ
xlabel('���'); 
ylabel('����')

% ����ɢ��ͼ����
figure;
data = [T.Height,T.Weight,T.VC];            % ��ȡ��ߡ����غͷλ�������
varname = {'���','����','�λ���'};           % ������Ԫ������
gplotmatrix (data,[],T.Class,'br','o*');    % ���Ʒ���ɢ��ͼ����
text([0.14,0.48,0.8], repmat(-0.1,1,3),...  % x���·���ע������
     varname, 'FontSize',8);
text(repmat(-0.1,1,3), [.8,.48,0.12],...    % y����߱�ע������
     varname, 'FontSize',8, 'Rotation',90);

% ��ά��ͼ
RankStr = T.Rank;
tab = tabulate(RankStr);
x = cell2mat(tab(:,3));
explode = [0,0,1,0,0];
labels = tab(:,1);
figure;
pie3(x,explode,labels);

%% ex6.2-1 ���÷ֲ���������
%+++++++++++++++++++++++++����normfit�������+++++++++++++++++++++++++++++++
x = [15.14  14.81  15.11  15.26  15.08  15.17  15.12  14.95  15.05  14.87];
[muhat,sigmahat,muci,sigmaci] = normfit(x,0.1)

%++++++++++++++++++++++++++++����mle�������++++++++++++++++++++++++++++++++
x = [15.14  14.81  15.11  15.26  15.08  15.17  15.12  14.95  15.05  14.87];
[mu_sigma,mu_sigma_ci] = mle(x,'distribution','norm','alpha',0.1)

%% ex6.2-2 �Զ���ֲ���������
x = [0.7917,0.8448,0.9802,0.8481,0.7627
        0.9013,0.9037,0.7399,0.7843,0.8424
        0.9842,0.7134,0.9959,0.6444,0.8362
        0.7651,0.9341,0.6515,0.7956,0.8733];
x = x(:);
PdfFun = @(x,theta) theta*x.^(theta-1).*(x>0 & x<1);
[phat,pci] = mle(x,'pdf',PdfFun,'start',1)

%% ex6.2-3 ���������
rand('seed',1);
randn('seed',1);
x = normrnd(35,5,600,1);
y = evrnd(20,2,400,1);
data = [x;y];
pdffun = @(t,mu1,sig1,mu2,sig2)0.6*normpdf(t,mu1,sig1)+0.4*evpdf(t,mu2,sig2);
[phat,pci] = mle(data,'pdf',pdffun,'start',[10,10,10,10],...
    'lowerbound',[-inf,0,-inf,0],'upperbound',[inf,inf,inf,inf])


%% ex6.3-1 �����׼����֪ʱ�ĵ�����̬�����ֵ�ļ���
%++++++++++++++++++++++++++++++++˫�����++++++++++++++++++++++++++++++++++
x = [97  102  105  112  99  103  102  94  100  95  105  98  102  100  103];
mu0 = 100;
Sigma = 2;
Alpha = 0.05;
[h,p,muci,zval] = ztest(x,mu0,Sigma,Alpha)

%%
%++++++++++++++++++++++++++++++++�������++++++++++++++++++++++++++++++++++
x = [97  102  105  112  99  103  102  94  100  95  105  98  102  100  103];
mu0 = 100;
Sigma = 2;
Alpha = 0.05;
tail = 'right';
[h,p,muci,zval] = ztest(x,mu0,Sigma,Alpha,tail)

%% ex6.3-2 �����׼��δ֪ʱ�ĵ�����̬�����ֵ�ļ���
x = [49.4  50.5  50.7  51.7  49.8  47.9  49.2  51.4  48.9];
mu0 = 50;
Alpha = 0.05;
[h,p,muci,stats] = ttest(x,mu0,Alpha)

%% ex6.3-3 �����ֵδ֪ʱ�ĵ�����̬���巽��ļ���
x = [49.4  50.5  50.7  51.7  49.8  47.9  49.2  51.4  48.9];
var0 = 1.5;
alpha = 0.05;
tail = 'both';
[h,p,varci,stats] = vartest(x,var0,alpha,tail)

%% ex6.3-4 �����׼��δ֪ʱ��������̬�����ֵ�ıȽϼ��飨����������
x = [20.1,  20.0,  19.3,  20.6,  20.2,  19.9,  20.0,  19.9,  19.1,  19.9];
y = [18.6,  19.1,  20.0,  20.0,  20.0,  19.7,  19.9,  19.6,  20.2];
alpha = 0.05;
tail = 'both';
vartype = 'equal';
[h,p,muci,stats] = ttest2(x,y,alpha,tail,vartype)

%% ex6.3-4x �����׼��δ֪ʱ��������̬�����ֵ�ıȽϼ��飨���������
% x = [80.3,68.6,72.2,71.5,72.3,70.1,74.6,73.0,58.7,78.6,85.6,78.0];
% y = [74.0,71.2,66.3,65.3,66.0,61.6,68.8,72.6,65.7,72.6,77.1,71.5];
% Alpha = 0.05;
% tail = 'both';
% [h,p,muci,stats] = ttest(x,y,Alpha,tail)

%% ex6.3-5 �����ֵδ֪ʱ��������̬���巽��ıȽϼ���
x = [20.1,  20.0,  19.3,  20.6,  20.2,  19.9,  20.0,  19.9,  19.1,  19.9];
y = [18.6,  19.1,  20.0,  20.0,  20.0,  19.7,  19.9,  19.6,  20.2];
alpha = 0.05;
tail = 'both';
[h,p,varci,stats] = vartest2(x,y,alpha,tail)

%% ex6.6-1  һԪ���Իع�
data = xlsread('�������������.xls');
x = data(:,5);
y = data(:,10);
plot(x, y, 'k.', 'Markersize', 15);
xlabel('����������(x)');
ylabel('����������(y)');
%����x��y���������ϵ������R
R = corrcoef(x, y)
%[b,bint,r,rint,stats]=regress(y,x,0.05) 

%mdl1 = LinearModel.fit(x,y)    % ģ�����
mdl1 = fitlm(x,y)


figure;
mdl1.plot;
xlabel('����������(x)');
ylabel('����������(y)');
title('');
legend('ԭʼɢ��','�ع�ֱ��','��������');

xnew = [0.035,0.04]';
ynew = mdl1.predict(xnew)

Res = mdl1.Residuals;
Res_Stu = Res.Studentized;
id = find(abs(Res_Stu)>2);  
%mdl2 = LinearModel.fit(x,y, 'Exclude',id)
mdl2=fitlm(x,y, 'Exclude',id)

figure;
mdl2.plot;
xlabel('����������(x)');
ylabel('����������(y)');
title('');
legend('�޳��쳣���ݺ�ɢ��','�ع�ֱ��','��������');


%% ex6.6-3 ��Ԫ���Ժ͹������Իع�
% data = xlsread('���������������.xls');
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
% title('(a) �в�ֱ��ͼ');
% xlabel('�в�r');ylabel('f(r)');
% subplot(1,2,2);
% mmdl1.plotResiduals('probability');
% title('(b) �в���̬����ͼ');
% xlabel('�в�');ylabel('����');
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
% legend('y��ԭʼɢ��','5Ԫ���Իع����',...
%     '3Ԫ���Իع����','��ȫ���λع����');
% xlabel('y�Ĺ۲����'); 
% ylabel('y'); 
% 
% mmdl4 = LinearModel.stepwise(X,y, 'poly22222')
% yfitted = mmdl4.Fitted;
% figure;
% plot(y,'ko');
% hold on
% plot(yfitted,':','linewidth',2);
% legend('y��ԭʼɢ��','�𲽻ع����');
% xlabel('y�Ĺ۲����');
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


