%% 符号行列式
clear all
clc
syms x y
A=[x-y 1 1 1;1 x-y 1 1;1 1 x+y 1;1 1 1 x+y];
det(A)

%% 解方程
clear all
clc
syms x
A=[3 2 1 1;3 2 2-x^2 1;5 1 3 2;7-x^2 1 3 2];
D=det(A)
f=factor(D)
X=solve(D)

%% 线性方程组求解
clear all
clc
A=[2 1 -1 3 1; 4 2 -5 1 2 ;2 1 -1 -1 1];
rref(A)  %给出A的最简行阶梯形矩阵
% linesolve(A,y, options) %求解Ax=y 
% null(A,'r') %求齐次方程组Ax=0的基础解系

%% 特征值计算
clear all
clc
A=[-1 -2 0;2 3 0;2 1 3];
P=poly(A) %求A的特征多项式
syms x
P1 = det(x*eye(3)-A)
roots(P)%求多项式P的零点
orth(A)%求出矩阵A的列向量构成空间的一个规范正交基
[V,U]=eig(A)
%返回方阵A的特征值和特征向量，其中U的对角元素为A的特征值，v的列向量为特征值对应的特征向量

%% 投入产出模型
A=[0 0.65 0.6;0.3 0.15 0.15;0.25 0.1 0];
Y=[80000 65000 0]';
E=eye(3);
X=(E-A)\Y
B=inv(E-A)-E
C=A*diag (X) %计算投入产出矩阵
D=ones(1,3)*C %计算总投入向量
F=X-D'%计算新创造价值向量



%% PCA计算
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


%% SVD分解
clear all
clc
X = [1 0 1; -1 -2 0; 0 1 -1];
s = svd(X);%满秩矩阵的奇异值。
X = [1 2; 3 4; 5 6; 7 8];
%[U,S,V] = svd(X) % X 的奇异值分解。
[U,S,V] = svd(X,'econ')
C = X'*X/3
[v,d] = eig(C)

%% SVD数据压缩
clear all
clc
M=[ones(5,15);ones(3,2) zeros(3,11) ones(3,2);
    ones(9,2) zeros(9,3) ones(9,5) zeros(9,3) ones(9,2);...
    ones(3,2) zeros(3,11) ones(3,2);ones(5,15)];
image(256*M);colormap(gray(256));
[U,S,V] = svd(M,'econ');
s = svd(M,'econ')
