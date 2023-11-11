load('problem2.mat')
crossValidation_errorset_training =[];
crossValidation_errorset_testing =[];
 
ind = crossvalind('Kfold', 400, 2);
 
xtrain = x(ind == 1 ,:);
ytrain = y(ind == 1);
xtest = x(ind == 2 ,:); 
ytest = y(ind == 2); 
d=1;

 
lamba_set = []


for lambda = 1:1000 
    
    
    [err , model, errT] = newregression(xtrain , ytrain , lambda, xtest , ytest); 
    crossValidation_errorset_training(lambda) = err;
    crossValidation_errorset_testing(lambda) = errT;
    
    lamba_set(lambda) = lambda;
 
    
end



hold on;
plot(lamba_set, crossValidation_errorset_training)
plot(lamba_set, crossValidation_errorset_testing)


legend({'cross_validation_train_sets','cross_validation_testing_sets'})
saveas(gcf, 'crossvalidation_problem2.jpg')



