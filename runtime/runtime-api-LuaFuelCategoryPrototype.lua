---@meta
---@diagnostic disable

--$Factorio cd97ca0b9a
--$Overlay 5
--$Section LuaFuelCategoryPrototype
-- This file is automatically generated. Edits will be overwritten.

---Prototype of a fuel category.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaFuelCategoryPrototype.html)
---@class LuaFuelCategoryPrototype:LuaObject
---[R]
---
---[View documentation](https://lua-api.factorio.com/latest/LuaFuelCategoryPrototype.html#LuaFuelCategoryPrototype.localised_description)
---@field localised_description LocalisedString 
---[R]
---
---[View documentation](https://lua-api.factorio.com/latest/LuaFuelCategoryPrototype.html#LuaFuelCategoryPrototype.localised_name)
---@field localised_name LocalisedString 
---[R]  
---Name of this prototype.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaFuelCategoryPrototype.html#LuaFuelCategoryPrototype.name)
---@field name string 
---[R]  
---The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaFuelCategoryPrototype.html#LuaFuelCategoryPrototype.object_name)
---@field object_name string 
---[R]  
---The string used to alphabetically sort these prototypes. It is a simple string that has no additional semantic meaning.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaFuelCategoryPrototype.html#LuaFuelCategoryPrototype.order)
---@field order string 
---[R]  
---Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaFuelCategoryPrototype.html#LuaFuelCategoryPrototype.valid)
---@field valid boolean 
local LuaFuelCategoryPrototype={
---All methods and properties that this object supports.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaFuelCategoryPrototype.html#LuaFuelCategoryPrototype.help)
---@return string
help=function()end,
}


