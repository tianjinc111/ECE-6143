load('problem1.mat');


error_sets = [];

error_sets_training = [];

models_sets = {};

d_sets = [];

xT = x(350:500);

yT = y(350:500);

% get the d with the lowest risk

for d = 1: 100
    
    %call the function
    [err, model,errT] = polyreg(x(1:350),y(1:350),d, xT, yT);
    
    
    
    d_sets(d) = d;
    error_sets(d) = err;
    
    models_sets{d} = model;
    
    error_sets_training(d) = errT;
    
    
end

clf
hold on;
plot(d_sets, error_sets,'r')

plot(d_sets, error_sets_training,'g')


xlabel ( 'D as the x axis' );
ylabel ( 'Err' );

legend({'label 1','label 2'})
saveas(gcf, 'D and Errors with test and training sets.jpg')




%here are the functino to deal with the cross validation





% corss validation

cross_validation_train_sets = [];
cross_validation_testing_sets = [];


indice = crossvalind('Kfold', 500,2);


xTraining = x(indice == 1);
yTraining = x(indice == 1);
xTesting = x(indice == 2);
yTesting = x(indice == 2);




for d = 1:100
    [err,model,errT] = polyreg(xTraining,yTraining,d,xTesting,yTesting);
    cross_validation_train_sets(d) = err;
    cross_validation_testing_sets(d) = errT;
end

clf

hold on


plot(d_sets,cross_validation_train_sets,'r');
plot(d_sets,cross_validation_testing_sets,'g');

legend({'cross_validation_train_sets','cross_validation_testing_sets'})
saveas(gcf, 'crossvalidation_problem1.jpg')








    


