clear; close all; clc;
data = load('preprocessed_wdbc.dat');

Y = data(:,2);
X = data(:, 3:32);

Y_train = Y(1:500,:);
Y_test = Y(501:569,:);
X_train = X(1:500,:);
X_test = X(501:569,:);

C = 1000;

n = size(X_train, 1);
for i = 1:n
    for j = 1:n
        H(i, j) = Y_train(i) * Y_train(j) * (X_train(i, :) * X_train(j, :)');
    end
end
f = -ones(n, 1);
A = [];
b = [];
Aeq = Y_train';
beq = 0;
lb = zeros(n, 1);
ub = C * ones(n, 1);

alpha = quadprog(H, f, A, b, Aeq, beq, lb, ub);

w = sum((alpha .* Y_train) .* X_train);
b = mean(Y_train - (X_train * w'));

% predict on the test dataset
y_pred = sign(w * X_test' + b)';

% Calculate accuracy
accuracy = sum(y_pred == Y_test) / numel(Y_test);

% Calculate sensitivity (true positive rate)
true_positive = sum((y_pred == 1) & (Y_test == 1));
sensitivity = true_positive / sum(Y_test == 1);

% Calculate specificity (true negative rate)
true_negative = sum((y_pred == -1) & (Y_test == -1));
specificity = true_negative / sum(Y_test == -1);

fprintf('Accuracy: %f\n', accuracy);
fprintf('Sensitivity: %f\n', sensitivity);
fprintf('Specificity: %f\n', specificity);

