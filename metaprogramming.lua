-- https://www.youtube.com/watch?v=viDCpKoduC0

local function addTableValues(t1, t2)
  return t1.num + t2.num
end

-- assign methods to be called when a table is asked to perform said function
-- __mult, __div, __mod(ulo), __pow ^, __concat .., len #, __eq == __lt <, __le <=, __gt >, __ge >+
local metadatable = {
  __add = addTableValues, -- sets the "+" method
  __sub = function(t1, t2) -- sets the "-" method
    return t1.num - t2.num
  end,
}

local tbl1 = { num = 13 }
local tbl2 = { num = 23 }

setmetatable(tbl1, metadatable)

local answer = tbl1 + tbl2

print("The answer is: " .. answer)
