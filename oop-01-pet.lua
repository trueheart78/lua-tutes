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

local dog1 = Pet()
dog1:print()
if dog1:is_hungry() then
  -- instance means it needs a colon cuz it's an instance method
  -- so if you see "(self)", it means it's an instance call (one sign)
  dog1:feed()
  dog1:print()
end
dog1:feed()

local function Doggo(name, breed)
  local dog = Pet(name)

  dog.breed = breed or "Mutt" -- nil check/default value
  dog.loyalty = 0

  dog.is_loyal = function(self)
    return self.loyalty >= 10
  end
  -- redefining the function from the parent class
  dog.feed = function(self)
    print("*" .. self.name .. " is being fed*")
    -- reference anoth instance-based method using that there colon(:) and not a dot(.)
    if self:is_hungry() then
      print(self.name .. ": *munch* *munch* *munch*")
      self.status = "happy"
      self.loyalty = self.loyalty + 5
    else
      print(self.name .. ": *curious look*")
    end
  end
  dog.bark = function(self)
    print(self.name .. ": *woof* *woof*")
  end
  -- don't forget to return the dog, sir!
  return dog
end

local benson = Doggo("Benson", "Morkie")
benson:print()
benson:bark()
benson:feed()
benson.status = "hungry"
benson:feed()

if benson:is_loyal() then
  print(benson.name .. " is loyal 󰏩")
end
