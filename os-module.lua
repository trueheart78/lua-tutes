local clock = os.clock()

-- seconds since the epoch
print("Since the epoc: ", os.time())

-- seconds to 10/31/2000 @ 13:24:12 since the epoch
local the_year_2000 = os.time { year = 2000, month = 10, day = 31, hour = 13, minutes = 24, seconds = 12 }

print("The year 2000: ", the_year_2000)
local time_since_2000 = os.time() - the_year_2000
print("Since 2000: ", time_since_2000)

local time_diff_to_2000 = os.difftime(os.time(), time_since_2000)
print("Diff 2000: ", time_diff_to_2000)

local today = os.date()
print("Today: ", today)

local today_in_2000 = os.date("%c", the_year_2000)
print("Today (2000): ", today_in_2000)

local user = os.getenv "USER"
print("$USER: ", user)

local home = os.getenv "HOME"
print("$HOME: ", home)

local temp_name = os.tmpname()
print("temp_name: ", temp_name)

-- create a file
local file_name = "os_file_test.txt"
io.output(file_name)
io.write "yo dawg\n"
io.close()

local new_file_name = "new_" .. file_name
if os.rename(file_name, new_file_name) then
  print("Renamed [" .. file_name .. "] to [" .. new_file_name .. "]")
else
  print "Error renaming file"
end

if os.remove(new_file_name) then
  print("Removed [" .. new_file_name .. "]")
else
  print "Error removing file"
end

-- now let's execute a terminal command!
print "Listing Lua files:"
local boop = os.execute "ls *.lua"
print("Success?: ", tostring(boop))

-- print out the time this took
local execution_time = os.clock() - clock
print("Execution Time: " .. execution_time .. " seconds")

-- exit the program
local exit_code = 0 -- 0, 1, 2, etc
os.exit(exit_code)
