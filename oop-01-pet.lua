-- from https://www.youtube.com/watch?v=xdJZdEAQOEo

-- Objects are capilatized
local function Pet(name)
  name = name or "Luis" -- nil check/default argument
  return {
    name = name,
    status = "hungry",

    -- since we're referencing self, this is an instance method and gets called via colon(:)
    feed = function(self)
      print("*" .. self.name .. " is being fed*")
      -- reference anoth instance-based method using that there colon(:) and not a dot(.)
      if self:is_hungry() then
        print(self.name .. ": *munch* *munch* *munch*")
        self.status = "happy"
      else
        print(self.name .. ": *curious look*")
      end
    end,
    print = function(self)
      print("*" .. self.name .. " is " .. self.status .. "*")
    end,
    is_hungry = function(self)
      return (self.status == "hungry")
    end,
  }
end

local dog = Pet()
dog:print()
if dog:is_hungry() then
  -- instance means it needs a colon cuz it's an instance method
  -- so if you see "(self)", it means it's an instance call (one sign)
  dog:feed()
  dog:print()
end
dog:feed()
