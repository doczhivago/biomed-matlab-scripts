% Path for Robot Leg
% Script generates joint angle plots of a two link leg using inverse dynamic equations as a function of a given path. 
% This has given me some insight into joint angles needed to control the legs. 
% Matlab Code for Inverse Dynamics

disp('Joint angles from (0,2) to (2,0) at Constant velocity')
xx=0:.1:2;
yy=-xx+2;
tt1=zeros(1,length(xx));
tt2=zeros(1,length(yy));
for i=1:length(xx)
	[tt1(i),tt2(i),xx1(i),yy1(i)]=theta12(xx(i),yy(i));
end

figure(3)
plot(tt1,'r');hold on;plot(tt2,'b');
legend('Theta1','Theta2')
xlabel('Time (s)')
ylabel('Radians')
title('Joint Angles as f(time)')
plotToolPath(xx,yy,xx1,yy1,13)

function [theta1, theta2, x1, x2]=theta12(x,y)
    a1=1;a2=1;
    D=(x^2+y^2-a1^2-a2^2)/(2*a1*a2);
    theta2=atan2(sqrt(1-D^2),(D)); 
    theta1=atan2(y,x)-atan2((a2*sin(theta2)),(a1+a2*cos(theta2)));
    x1=a1*cos(theta1);
    x2=a1*sin(theta1);
end

function plotToolPath(x,y,x1,y1,figNum)
    figure(figNum)
    hold on
    title('Tool Path')
    xlabel('X Position')
    ylabel('Y Position')
    if length(x)>50; index=20;else index=1;end
    for i=1:index:length(x)
        plot([x(i) x1(i)],[y(i) y1(i)],'b')
        plot([0 x1(i)],[0 y1(i)],'r')
        plot(x,y,'ob')
    end
end