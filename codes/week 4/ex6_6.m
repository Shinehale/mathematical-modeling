

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



