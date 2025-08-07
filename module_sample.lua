-- modules must return a table, and can be defined inline or separately, like below
local sample = {
  name = "mathy",
  add = function(x, y)
    return x + y
  end,
  square = function(x)
    return x * x
  end,
}

function sample.subtract(x, y)
  return x - y
end
function sample.add_squares(x, y)
  return sample.add(sample.square(x), sample.square(y))
end
function sample.square_twice(x)
  return sample.square(sample.square(x))
end

return sample
