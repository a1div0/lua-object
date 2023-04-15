---@class Object Базовый класс
local Object = {}
Object.meta = {__index = Object}

---@comment Внутренняя функция инициализации нового класса, см. https://github.com/luvit/luvit/blob/master/deps/core.lua
---@return table Новый класс
function Object:_create()
    local meta = rawget(self, "meta")
    if not meta then
        error("Cannot inherit from instance lua-object")
    end
    return setmetatable({}, meta)
end

---@comment Создаёт экземпляр класса. Если класс содержит функцию инициализации
---     initialize - то в процессе вызывается она и в неё передаются все
---     аргументы, поданные в эту функцию
---@return table Экземпляр класса
function Object:new(...)
    local obj = self:_create()
    if type(obj.initialize) == "function" then
        obj:initialize(...)
    end
    return obj
end

---@comment Порождает дочерний класс
---@return table Новый дочерний класс, наследованный от текущего
function Object:extend()
    local obj = self:_create()
    local meta = {}
    -- move the meta methods defined in our ancestors meta into our own
    --to preserve expected behavior in children (like __tostring, __add, etc)
    for k, v in pairs(self.meta) do
        meta[k] = v
    end
    meta.__index = obj
    meta.super = self
    obj.meta = meta
    return obj
end

---@comment Проверяет принадлежность экземпляра объекта к этому классу или к одному из родителей этого класса
---@param obj table Проверяемый экземпляр класса
-----@return boolean
function Object:isInstance(obj)
    if type(obj) ~= 'table' or obj.meta == nil then
        return false
    end
    local meta = self.meta
    while meta do
        if meta.__index == obj then
            return true
        elseif meta.super == nil then
            return false
        end
        meta = meta.super.meta
    end
    return false
end

return Object