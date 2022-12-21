

% clear; clc; close all;
% 
% f1 = @(x) x^2;
% 
% [f,count] = CountedFunction.count_function_calls(f1);
% 
% iters = 2000;
% 
% for i = 1:iters
%     y = test_function(f,i);
% end
% count()
% 
% function y = test_function(f,x)
%     y = f(x);
% end



clear; clc; close all;

f = @(x) long_function(x);
[fc,count] = CountedFunction.count_function_calls(f);

iters = 2000;

tic
for i = 1:iters
    y = fc(i);
end
toc


tic
for i = 1:iters
    y = f(i);
end
toc

count()

tic
for i = 1:iters
    y = fc(i);
end
toc

count()




function y = long_function(x)
    y = 0;
    for i = 1:100000
        y = y+sin(x);
    end
end