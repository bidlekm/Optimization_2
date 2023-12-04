clear; close all; clc;
data = load('Assignment2\preprocessed_wdbc.dat');

Y = data(:,2);
X = data(:, 3:32);

Y_train = Y(1:500,:);
Y_test = Y(501:569,:);
X_train = X(1:500,:);
X_test = X(501:569,:);

C = 1000;


[m, n] = size(X_train);

H = zeros(n,n);
for i=1:n
    for j=i:n
        H(i,j) = Y_train(i)*Y_train(j)*X_train(:,i)'*X_train(:,j);
        H(j,i) = H(i,j);
    end
end
f = -ones(n,1);

