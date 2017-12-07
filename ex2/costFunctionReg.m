function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));
x_size = size(X, 2)

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


J = (-y' * log(sigmoid(X * theta)) - (1-y)' * log(1 - sigmoid(X * theta)))  / m + (lambda / (2 * m)) .* sum(theta(2:x_size).^2);

grad(1) = ( X(:,1)' * ( sigmoid( X(:,1) * theta(1) ) - y ) )  / m;

s_function = ( sigmoid( X(:, 2:x_size) * theta(2:x_size) ) - y );

sum_x = X(:, 2:x_size)' * s_function;

reg_item = ((lambda / m) * theta(2:x_size));

s_m = sum_x  / m;

grad(2:x_size) =  s_m + reg_item;

% =============================================================

end
