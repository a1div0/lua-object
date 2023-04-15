<a href="http://tarantool.org">
   <img src="https://upload.wikimedia.org/wikipedia/commons/c/cf/Lua-Logo.svg"
    width="250" align="right">
</a>

# lua-object
## Table of contents
* [General information](#general-information)
* [Installation](#installation)
* [Usage](#usage)
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

## Usage
### Create a child class
```lua
local Object = require('lua-object')
local NewClass = Object:extend()
local NewClassChild = NewClass:extend()
```

### Creates an instance of the class
```lua
local obj = NewClass:new(a, b, c...)
```

### Declare constructor
```lua
function NewClass:initialize(a, b, c...)
    ---
end
```
`initialize` - is key word

### Declare method
```lua
function NewClass:method1(a, b, c...)
    ---
end
```

### Call parent method
```lua
function NewClassChild:method1(a, b, c...)
    ---
    NewClass.method1(self, a, b, c...)
    ---
end

```

### Checks if an instance of an object belongs to this class or to one of the parents of this class
```lua
if obj.myInstance(NewClass) then
    ---
end 
```

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