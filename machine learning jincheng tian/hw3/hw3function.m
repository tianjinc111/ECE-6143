load('dataset.mat')

for i= 50:100
    
    Y(i) = -1;
    
end 


% set traina nd test sets. 

n = randperm(size(X,1));
test_size = round(size(X,1)*0.5);       
X_train = X(n(1:test_size), :);
Y_train = Y(n(1:test_size), :);
X_test  = X(n(test_size:end), :);
Y_test  = Y(n(test_size:end), :);
%



global p1;


% the code for the linear 

for i = 1:50
    
    p1 = i;
   
   
   % train 
    [nsv, alpha, bias] = svc(X_train,Y_train,'linear',i); 

    % predict 
    predictedY = svcoutput(X_train,Y_train,X_test, 'linear',alpha,bias); 
    % compute test error 
    err_d(i) = svcerror(X_train,Y_train,X_test,Y_test,'linear',alpha,bias); 

end

f = figure(1);

plot(1:50, err_d);

title('linear kernel')
xlabel('x') 
ylabel('error') 
% 
for i = 1:50
    
    p1 = i;
   
   
   % train 
    [nsv, alpha, bias] = svc(X_train,Y_train,'poly',i); 

    % predict 
    predictedY = svcoutput(X_train,Y_train,X_test, 'poly',alpha,bias); 
    % compute test error 
    err_d(i) = svcerror(X_train,Y_train,X_test,Y_test,'poly',alpha,bias); 

end

f = figure(2);

clf(f);



plot(1:50, err_d);

title('poly kernel')
xlabel('x') 
ylabel('error') 



% rbfs






for sigma = 1:50
    
    
    p1 = sigma;
% train
    [nsv, alpha, bias] = svc(X_train,Y_train,'rbf',sigma);
% predict
    predictedY = svcoutput(X_train,Y_train,X_train, 'rbf',alpha,bias);
% compute test error
    err_sigma(sigma)= svcerror(X_train,Y_train,X_test,Y_test,'rbf',alpha,bias);
end



f = figure (3);
clf(f);

plot(1:50, err_sigma)

title('rbf kernel')
xlabel('x') 
ylabel('error') 
%print('−depsc', 'rbf.eps');







