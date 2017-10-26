 %ClimateData = xlsread('examp01_01.xls'); % ��Excel�ļ���ȡ����

 x = A(:, 1)*100000000; % ��ȡClimateData�ĵ�1�У�����ƽ����������

 y = A(:, 2)*100000000; % ��ȡClimateData�ĵ�5�У���ȫ������ʱ������

 xdata = [ones(size(x, 1), 1), x]; % ��ԭʼ����x����߼�һ��1����ģ�Ͱ���������

 [b, bint, r, rint, s] = regress(y, xdata); % ����regress������һԪ���Իع�

 yhat = xdata*b; % ����y�Ĺ���ֵ
 
 % b�ĵ�һ������������ �ڶ�������б��
 head1 = {'ϵ���Ĺ���ֵ','����ֵ��95%��������','����ֵ��95%��������'};
[head1; num2cell([b, bint])]

 head2 = {'y����ʵֵ','y�Ĺ���ֵ','�в�','�в��95%��������','�в��95%��������'};
[head2; num2cell([y, yhat, r, rint])]

 head3 = {'�ж�ϵ��','Fͳ�����Ĺ۲�ֵ','�����pֵ','����Ĺ���ֵ'};
[head3; num2cell(s)]

plot(x, y, 'k.', 'Markersize', 15) % ��ԭʼ����ɢ��

hold on

plot(x, yhat, 'linewidth', 3) % ���ع�ֱ��

xlabel('imu�������ms(x)') % ��X��ӱ�ǩ

ylabel('timeoffset(y)') % ��Y��ӱ�ǩ

legend('ԭʼɢ��','�ع�ֱ��'); % �ӱ�ע��