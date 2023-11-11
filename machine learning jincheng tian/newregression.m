function [err,model,errT] = newregression(x,y,lmda,xT,yT)



% use the function  Regularized Risk with Least Squares Loss
%θ*= XT( X + λI)−1XTy
% using left devision here 
model = ( x'* x + lmda * eye(size(x'*x))) \(x'*y );

err = (1/(2 * size(x,1))) * sum((y-x*model).^2);


if (nargin ==5)
    errT = (1/(2*size(xT,1)))*sum((yT-xT*model).^2);
end

