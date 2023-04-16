
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



