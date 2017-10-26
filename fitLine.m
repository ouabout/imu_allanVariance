 %ClimateData = xlsread('examp01_01.xls'); % 从Excel文件读取数据

 x = A(:, 1)*100000000; % 提取ClimateData的第1列，即年平均气温数据

 y = A(:, 2)*100000000; % 提取ClimateData的第5列，即全年日照时数数据

 xdata = [ones(size(x, 1), 1), x]; % 在原始数据x的左边加一列1，即模型包含常数项

 [b, bint, r, rint, s] = regress(y, xdata); % 调用regress函数作一元线性回归

 yhat = xdata*b; % 计算y的估计值
 
 % b的第一个数：常数项 第二个数：斜率
 head1 = {'系数的估计值','估计值的95%置信下限','估计值的95%置信上限'};
[head1; num2cell([b, bint])]

 head2 = {'y的真实值','y的估计值','残差','残差的95%置信下限','残差的95%置信上限'};
[head2; num2cell([y, yhat, r, rint])]

 head3 = {'判定系数','F统计量的观测值','检验的p值','误差方差的估计值'};
[head3; num2cell(s)]

plot(x, y, 'k.', 'Markersize', 15) % 画原始数据散点

hold on

plot(x, yhat, 'linewidth', 3) % 画回归直线

xlabel('imu采样间隔ms(x)') % 给X轴加标签

ylabel('timeoffset(y)') % 给Y轴加标签

legend('原始散点','回归直线'); % 加标注框