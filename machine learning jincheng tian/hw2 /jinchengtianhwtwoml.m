
% here is the code to program and set the data and run the code

% setp sized:Step size decides how much you 
% move while trying to go downhill

step = 4.5;
tol = 0.0001;

% load the data
load ('./data3.mat');


x(:,1:2) = data(:,1:2);
x(:,3) = 1;
y = data(:,3);
theta_t = rand(3,1);
theta = theta_t - step * gradient(x,y,theta_t);
iterat = 1;




while norm(theta-theta_t) > tol
    theta_t = theta;
    theta = theta - step * gradient(x,y,theta);
    classfi_loss_funcassifiction_loss(iterat) = classfi_loss_func(x,y,theta);
    Perceptron_loss(iterat) = percep_loss(x,y,theta);
    iterat = iterat + 1;
end


% flip the matrix 
classfi_loss_funcassifiction_loss = classfi_loss_funcassifiction_loss';
Perceptron_loss = Perceptron_loss';

for i = 1:200
    if data(i,3)==1
        plot(data(i,1),data(i,2),'x');
        hold on;
    end
    if data(i,3)==-1
        plot(data(i,1),data(i,2),'*');
        hold on;
    end
end


% this is function to plot the line in the middle
for i = 1:1000
    j(i) = -(theta(1)./theta(2)*i/1000 + theta(3)./theta(2) );
end

plot(0.001:0.001:1, j,'r');


figure(2);
plot(1:iterat-1, classfi_loss_funcassifiction_loss, 'b');
hold on;
plot(1:iterat-1, Perceptron_loss, 'g');


legend('classfi_loss_funcassification Loss','Perceptron Loss');




function s = percep_loss(x,y,theta)
sum = 0;
for i = 1:200
    if y(i)*x(i,:)*theta < 0
        sum = sum + y(i)*x(i,:)*theta;
    end
end
s = -sum ./ 200;

end



function gradient = gradient(x,y,theta)
sum = 0;
data_num = 200;
for i = 1:data_num
    
    state = y(i)*x(i,:)*theta;
    if state < 0
        sum = sum + y(i)*x(i,:)';
    end
end
gradient = -1.* sum ./ data_num;
end




function s = classfi_loss_func(x,y,theta)
sum = 0;
for i = 1 : 200
    k = -y(i)*x(i,:)*theta; 
    if k < 0
        sum = sum + 0;
    end
    if k >= 0
        sum = sum + 1;
    end
    
end
s = sum ./ 200;
end










