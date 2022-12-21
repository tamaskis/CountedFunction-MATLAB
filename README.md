# `CountedFunction`

Class to define functions in a way that we can track the number of function evaluations.


## Syntax

`[fc,count] = CountedFunction.count_function_calls(f)`


## Description

`[fc,count] = CountedFunction.count_function_calls(f)` takes a function handle, `f`, and returns a function handle `fc` and a counter function `count`. `fc` performs the same function evaluation as `f` (it is just wrapped around a `CountedFunction` object which calls `f` directly). Calling the counter function (i.e. `count()`) will return the current number of function calls.


## Note

 - For simple functions, such as `f = @(x) x^2`, this can **severely** slow down function calls (by a factor of ~20).
 - For complicated functions that have a long evaluation time to begin with, this performance hit is negligible.


## Examples

 ```matlab
 test
 ```
