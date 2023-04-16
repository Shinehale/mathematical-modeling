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
