%==========================================================================
%
% CountedFunction  Class defining a counted function.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-12-20
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
%==========================================================================

classdef CountedFunction < handle
    
    % -----------
    % Properties.
    % -----------
    
    properties
        f       % (1×1 function_handle) function with one input
        count   % (1×1 double) number of function calls
    end
    
    % ---------------
    % Public methods.
    % ---------------
    
    methods (Access = public)
        
        function obj = CountedFunction(f)
            % obj = CountedFunction(f)
            %
            % Constructor.
            %--------------------------------------------------------------
            %
            % ------
            % INPUT:
            % ------
            %   f       - (1×1 function_handle) function handle
            %
            % -------
            % OUTPUT:
            % -------
            %   obj     - (1×1 CountedFunction) CountedFunction object
            %
            %--------------------------------------------------------------
            obj.f = f;
            obj.count = 0;
        end
        
        function f_eval = eval(obj,x)
            % CountedFunction.eval(x)
            %
            % Evaluates the function, incrementing the count of function
            % calls.
            %--------------------------------------------------------------
            %
            % ------
            % INPUT:
            % ------
            %   x       - (any) input argument
            %
            %--------------------------------------------------------------
            f_eval = obj.f(x);
            obj.count = obj.count+1;
        end
        
    end
    
    % ---------------
    % Static methods.
    % ---------------
    
    methods(Static)
        
        function [fc,count] = count_function_calls(f)
            % [fc,count] = CountedFunction.count_function_calls(f)
            %
            % Returns a function handle that evaluates a CountedFunction.
            %--------------------------------------------------------------
            %
            % ------
            % INPUT:
            % ------
            %   f       - (1×1 function_handle) original single-input 
            %             function
            %
            % -------
            % OUTPUT:
            % -------
            %   fc      - (1×1 function_handle) same function that now 
            %             calls a CountedFunction internally so that we can
            %             track the number of times it's evaluated
            %
            %--------------------------------------------------------------
            counted_function = CountedFunction(f);
            fc = @(x) counted_function.eval(x);
            count = @counted_function.count;
        end
        
    end
    
end