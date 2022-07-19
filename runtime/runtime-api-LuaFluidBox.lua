---@meta
---@diagnostic disable

--$Factorio cd97ca0b9a
--$Overlay 5
--$Section LuaFluidBox
-- This file is automatically generated. Edits will be overwritten.

---An array of fluid boxes of an entity. Entities may contain more than one fluid box, and some can change the number of fluid boxes -- for instance, an assembling machine will change its number of fluid boxes depending on its active recipe. See [Fluid](https://lua-api.factorio.com/latest/Concepts.html#Fluid).
---
---Do note that reading from a [LuaFluidBox](https://lua-api.factorio.com/latest/LuaFluidBox.html) creates a new table and writing will copy the given fields from the table into the engine's own fluid box structure. Therefore, the correct way to update a fluidbox of an entity is to read it first, modify the table, then write the modified table back. Directly accessing the returned table's attributes won't have the desired effect.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaFluidBox.html)
---
---### Example  
---Double the temperature of the fluid in `entity`'s first fluid box. 
---```
---fluid = entity.fluidbox[1]
---fluid.temperature = fluid.temperature * 2
---entity.fluidbox[1] = fluid
---```
---@class LuaFluidBox:LuaObject
---[R]  
---The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaFluidBox.html#LuaFluidBox.object_name)
---@field object_name string 
---[R]  
---The entity that owns this fluidbox.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaFluidBox.html#LuaFluidBox.owner)
---@field owner LuaEntity 
---[R]  
---Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaFluidBox.html#LuaFluidBox.valid)
---@field valid boolean 
---[R]  
---Number of fluid boxes.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaFluidBox.html#LuaFluidBox.length)
---@field __len uint 
---[R]  
---Access, set or clear a fluid box. The index must always be in bounds (see [LuaFluidBox::index](https://lua-api.factorio.com/latest/LuaFluidBox.html#LuaFluidBox.index)). New fluidboxes may not be added or removed using this operator.
---
---Is `nil` if the given fluid box does not contain any fluid. Writing `nil` removes all fluid from the fluid box.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaFluidBox.html#LuaFluidBox.index)
---@field [uint]? Fluid 
local LuaFluidBox={
---Flushes all fluid from this fluidbox and its fluid system.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaFluidBox.html#LuaFluidBox.flush)
---@param index uint
---@param fluid?FluidIdentification@If provided, only this fluid is flushed.
---@return {[string]: float}@The removed fluid.
flush=function(index,fluid)end,
---The capacity of the given fluidbox index.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaFluidBox.html#LuaFluidBox.get_capacity)
---@param index uint
---@return double
get_capacity=function(index)end,
---The fluidboxes to which the fluidbox at the given index is connected.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaFluidBox.html#LuaFluidBox.get_connections)
---@param index uint
---@return LuaFluidBox[]
get_connections=function(index)end,
---Get a fluid box filter
---
---[View documentation](https://lua-api.factorio.com/latest/LuaFluidBox.html#LuaFluidBox.get_filter)
---@param index uint@The index of the filter to get.
---@return FluidBoxFilter@The filter at the requested index, or `nil` if there isn't one.
get_filter=function(index)end,
---Flow through the fluidbox in the last tick. It is the larger of in-flow and out-flow.
---
---**Note:** Fluid wagons do not track it and will return 0.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaFluidBox.html#LuaFluidBox.get_flow)
---@param index uint
---@return double
get_flow=function(index)end,
---Gets unique fluid system identifier of selected fluid box. May return nil for fluid wagon, fluid turret's internal buffer or a fluidbox which does not belong to a fluid system
---
---[View documentation](https://lua-api.factorio.com/latest/LuaFluidBox.html#LuaFluidBox.get_fluid_system_id)
---@param index uint
---@return uint
get_fluid_system_id=function(index)end,
---Returns the fluid the fluidbox is locked onto
---
---[View documentation](https://lua-api.factorio.com/latest/LuaFluidBox.html#LuaFluidBox.get_locked_fluid)
---@param index uint
---@return string@`nil` if the fluidbox is not locked to any fluid.
get_locked_fluid=function(index)end,
---The prototype of this fluidbox index.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaFluidBox.html#LuaFluidBox.get_prototype)
---@param index uint
---@return LuaFluidBoxPrototype
get_prototype=function(index)end,
---All methods and properties that this object supports.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaFluidBox.html#LuaFluidBox.help)
---@return string
help=function()end,
---Set a fluid box filter.
---
---**Note:** Some entities cannot have their fluidbox filter set, notably fluid wagons and crafting machines.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaFluidBox.html#LuaFluidBox.set_filter)
---@param index uint@The index of the filter to set.
---@param filter?FluidBoxFilterSpec@The filter to set. Setting `nil` clears the filter.
---@return boolean@Whether the filter was set successfully.
set_filter=function(index,filter)end,
}


