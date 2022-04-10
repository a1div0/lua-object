--local ide_debug = require('ide-debug')
--ide_debug.enable_debugger(9999)

local test = require('luatest')
local group = test.group('unit')

group.prototype_and_inheritance = function()

    local Object = require('object')
    function Object.symbol()
        return '!'
    end

    local Cat = Object:extend()
    function Cat:voice()
        return 'Miaoww'..self.symbol()
    end

    local Dog = Object:extend()
    function Dog:voice()
        return 'Woff'..self.symbol()
    end

    local DogBob = Dog:extend()
    function DogBob:voice()
        return 'Aghh! Aghh!'..self.symbol()
    end

    local DogRichard = Dog:extend()

    local dogBob = DogBob:new()
    test.assert_equals(dogBob:voice(), 'Aghh! Aghh!!', 'Class DogBob has its own method')

    local dogRichard = DogRichard:new()
    test.assert_equals(dogRichard:voice(), 'Woff!', 'Class DogRichard has an inherited method')

    local cat = Cat:new()
    test.assert_equals(cat:voice(), 'Miaoww!', 'Class Cat has its own method')
end

group.is_instance = function()
    local Object = require('object')
    local Cat = Object:extend()
    local Dog = Object:extend()
    local dog = Dog:new()
    local cat = Cat:new()

    test.assert(dog:isInstance(Dog), 'dog is instance class Dog')
    test.assert(dog:isInstance(Object), 'dog is instance class Object')
    test.assert(dog:isInstance(require('object')), 'dog is instance class Object over require()')

    test.assert(cat:isInstance(Cat), 'cat is instance class Cat')
    test.assert(cat:isInstance(Object), 'cat is instance class Object')

    test.assert_not(dog:isInstance(Cat), 'dog is not a Сat')
    test.assert_not(cat:isInstance(Dog), 'cat is not a Dog')
end
