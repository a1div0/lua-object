require('test.ide-debug')
local Object = require('object')

local flag1 = false

local Dog = Object:extend()
Dog.className = "Dog"
function Dog:myFunction1(arg1, arg2, arg3)
    flag1 = true
end

local Cat = Object:extend()
function Cat:myFunction1(arg1, arg2, arg3)
    flag1 = false
end

local dog1 = Dog:new()

if not dog1:isInstance(Dog) then
    error('problem in `isInstance`')
end

if not dog1:isInstance(Object) then
    error('problem in `isInstance`')
end

if dog1:isInstance(Cat) then
    error('problem in `isInstance`')
end