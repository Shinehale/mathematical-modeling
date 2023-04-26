%% ��������ʽ
clear all
clc
syms x y
A=[x-y 1 1 1;1 x-y 1 1;1 1 x+y 1;1 1 1 x+y];
det(A)

%% �ⷽ��
clear all
clc
syms x
A=[3 2 1 1;3 2 2-x^2 1;5 1 3 2;7-x^2 1 3 2];
D=det(A)
f=factor(D)
X=solve(D)

%% ���Է��������
clear all
clc
A=[2 1 -1 3 1; 4 2 -5 1 2 ;2 1 -1 -1 1];
rref(A)  %����A������н����ξ���
% linesolve(A,y, options) %���Ax=y 
% null(A,'r') %����η�����Ax=0�Ļ�����ϵ

%% ����ֵ����
clear all
clc
A=[-1 -2 0;2 3 0;2 1 3];
P=poly(A) %��A����������ʽ
syms x
P1 = det(x*eye(3)-A)
roots(P)%�����ʽP�����
orth(A)%�������A�����������ɿռ��һ���淶������
[V,U]=eig(A)
%���ط���A������ֵ����������������U�ĶԽ�Ԫ��ΪA������ֵ��v��������Ϊ����ֵ��Ӧ����������

%% Ͷ�����ģ��
A=[0 0.65 0.6;0.3 0.15 0.15;0.25 0.1 0];
Y=[80000 65000 0]';
E=eye(3);
X=(E-A)\Y
B=inv(E-A)-E
C=A*diag (X) %����Ͷ���������
D=ones(1,3)*C %������Ͷ������
F=X-D'%�����´����ֵ����



%% PCA����
clear all
clc
data =[2.5000    9.4000    6.5000
    0.2000    5.6000    4.2000
    6.0000    3.2000    0.3000
    4.2000    3.9000    6.1000
    2.3000    5.0000    5.2000
   11.0000    7.0000    0.5600
    2.6000    0.3000    0.9000
    3.4000    0.0200    1.8100
    3.3000    6.5000    2.1300
    8.0000    2.0000    4.2000];
[coeff,score,latent] = pca(data);
tdata = bsxfun(@minus,data,mean(data,1));
%C=cov(data)
C=cov(tdata)
[V,D] = eig(C);
VM=V(:,2:3);
fdata = tdata*VM;


%% SVD�ֽ�
clear all
clc
X = [1 0 1; -1 -2 0; 0 1 -1];
s = svd(X);%���Ⱦ��������ֵ��
X = [1 2; 3 4; 5 6; 7 8];
%[U,S,V] = svd(X) % X ������ֵ�ֽ⡣
[U,S,V] = svd(X,'econ')
C = X'*X/3
[v,d] = eig(C)

%% SVD����ѹ��
clear all
clc
M=[ones(5,15);ones(3,2) zeros(3,11) ones(3,2);
    ones(9,2) zeros(9,3) ones(9,5) zeros(9,3) ones(9,2);...
    ones(3,2) zeros(3,11) ones(3,2);ones(5,15)];
image(256*M);colormap(gray(256));
[U,S,V] = svd(M,'econ');
s = svd(M,'econ')
