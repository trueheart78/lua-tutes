-- load the external module, module_sample
local mymath = require "module_sample"

-- can call it like a module is usually called
print("mymath.name: ", mymath.name)
print("mymath.add: ", mymath.add(1, 2))
print("mymath.subtract: ", mymath.subtract(20, 7))

-- can also call the method on the return value of the require, since it returns a table that can support a method
print("require.square: ", require("module_sample").square(5))

-- call the method that has internal calls
local added_square = mymath.add_squares(5, 5)
print("mymath.add_squares:", added_square)

-- call the inline with internal calls
local squared_twice = mymath.square_twice(5)
print("mymath.square_twice:", squared_twice)
