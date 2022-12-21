

clear; clc; close all;

f1 = @(x) x^2;

[f,count] = CountedFunction.count_function_calls(f1);

iters = 2000;

for i = 1:iters
    y = test_function(f,i);
end
count()

function y = test_function(f,x)
    y = f(x);
end