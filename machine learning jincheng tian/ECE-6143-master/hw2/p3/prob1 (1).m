
% stepsize
step = 4.5;
%tolerance
t = 0.001;
%%iteration
iterat = 1;
%load data
load ('data3.mat');



%separat dataset to get x and y
X = data(:,1:2);
X(:,3) = 1;
Y = data(:,3); 

%initialize thetas and variables
thetaT = rand(size(data,2),1);
theta = thetaT - step * gradient(X,Y,thetaT);
CLoss=zeros(1,200);  
PLoss=zeros(1,200);

%iterates
while norm( theta - thetaT ) > t
    
    thetaT = theta;
    theta = theta - step * gradient(X,Y,theta);
    CLoss(iterat) = ClassLoss(X,Y,theta);
    PLoss(iterat) = PerLoss(X,Y,theta);
    iterat = iterat + 1;
    
end

% flip the matrix
CLoss = CLoss';
PLoss = PLoss';

clf

for i = 1:200
    if Y(i)==1
        plot(X(i,1),X(i,2),'r.');
        hold on;
    end
    if Y(i)==-1
        plot(X(i,1),X(i,2),'b.');
        hold on;
    end
end
xlabel ( 'X' );
ylabel ( 'Y' );
filenameData = sprintf('Data%d.jpg', step);
saveas(gcf, filenameData);

clf
itertLst = (1:iterat-1)';
plot(itertLst, CLoss(1:iterat-1), 'b');
hold on;
plot(itertLst, PLoss(1: iterat-1), 'r');
xlabel ( 'iteration' );
ylabel ( 'Loss' );
legend('Classification Loss' , 'Percptron Loss');
filenameLoss = sprintf('Loss%d.jpg', step);
saveas(gcf, filenameLoss);



function grad = gradient(x,y,theta)
sum = 0;
for i = 1:200
    if y(i)*x(i,:)*theta < 0
        sum = sum + y(i)*x(i,:)';
    end
end
grad = - sum ./ 200;
end



function ploss = PerLoss(x,y,theta)
sum = 0;
for i = 1:200
    tmp = y(i)*x(i,:)*theta;
    
    if tmp < 0
        sum = sum + tmp;
    end
end

ploss = -sum ./ 200;

end

function closs = ClassLoss(x,y,theta)
sum = 0;
for i = 1:200
    tmp = -y(i)*x(i,:)*theta;
    if tmp >= 0
        g = 1;
    else
        g = 0;
    end
    
    sum = sum + g;
end

closs = sum ./ 200;

end

