-- write/replace a file (like a save file)
local name = "file_test.txt"
io.output(name)
io.write "yo dawg\n"
io.close()

-- read characters from a file
io.input(name)
local chars = io.read(100)
print("chars w/ newlines: [" .. chars .. "]")

-- write/read numbers
io.output(name)
io.write "13x" -- write a mixed string that includes a number
io.close()
io.input(name)
local number = io.read "*n" -- read leading number stuff and discard the rest
print("number(" .. number .. ") squared: " .. number * number) -- only retrieves the number and can do things with it

-- line work
io.output(name)
io.write "this is the first line\nthis is the second line\n"
io.close()
io.input(name)
local line1 = io.read "*L" -- read the line with trailing characters
local line2 = io.read "*l" -- read the line without trailing characters
print("line1: [" .. line1 .. "]\nline 2: [" .. line2 .. "]")

io.input(name)
local all = io.read "*a" -- read everything
print("all: [" .. all .. "]")

-- now with object handlers
local file = io.open(name, "a+")
if file then
  -- file stuffs
  file:write "Call me mr third"
  file:close()
else
  print("Error: unable to open file for appending [" .. name .. "]")
end

file = io.open(name, "r")
if file then
  local obj_all = file:read "*a"
  file:close()
  print("Object All: [" .. obj_all .. "]")
else
  print("Error: unable to open file for reading [" .. name .. "]")
end
