<a href="http://tarantool.org">
   <img src="https://upload.wikimedia.org/wikipedia/commons/c/cf/Lua-Logo.svg"
    width="250" align="right">
</a>

# lua-object
## Table of contents
* [General information](#general-information)
* [Installation](#installation)
* [API](#api)
* [An example of using the module](#an-example-of-using-the-module)

## General information
Base class implementation for Lua

## Installation
You can:
* clone the repository:
``` shell
git clone https://github.com/a1div0/lua-object.git
```
* install the `lua-object` module using `tarantoolctl`:
```shell
tarantoolctl rocks install https://raw.githubusercontent.com/a1div0/lua-object/main/lua-object-1.0.3-1.rockspec
```

## API
* `local newClass = require('lua-object'):extend()` - create a child class
* `local obj = newClass:new()` - creates an instance of the class
* `obj.myInstance(class)` - checks if an instance of an object belongs to this
class or to one of the parents of this class

## An example of using the module
```lua
local Object = require('lua-object')

local BaseTable = Object:extend()
function BaseTable:myFunction1(arg1, arg2, arg3)
    --
    -- ...
    --
end

local tableA = BaseTable:new()

if tableA:isInstance(Object) then
    tableA:myFunction1(1, 2, 3)
end
```