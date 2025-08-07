-- coroutine examples

local routine1 = coroutine.create(function()
  for i = 1, 10, 1 do
    print("Routine 1: ", i)
    if i == 5 then
      coroutine.yield()
    end
  end
end)

local routine_func = function()
  for i = 11, 20, 1 do
    print("Routine 2: ", i)
  end
end

local routine2 = coroutine.create(routine_func)

coroutine.resume(routine1)
print("Routine 1 Status: ", coroutine.status(routine1))
-- > Routine 1: 1..5 then "suspended"

coroutine.resume(routine2)
print("Routine 2 Status: ", coroutine.status(routine2))
-- > Routine 2: 11..20 then "dead"

if coroutine.status(routine1) == "suspended" then
  coroutine.resume(routine1)
  print("Routine 1 Status: ", coroutine.status(routine1))
  -- > Routine 1: 6..10 then "dead" (it completed)
end

-- Try to run a "dead" routine
coroutine.resume(routine1)
print("Routine 1 Status: ", coroutine.status(routine1))
-- > Calling it again gives nothing, status is still "dead"
