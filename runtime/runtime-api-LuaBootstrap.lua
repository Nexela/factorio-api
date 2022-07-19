---@meta
---@diagnostic disable

--$Factorio cd97ca0b9a
--$Overlay 5
--$Section LuaBootstrap
-- This file is automatically generated. Edits will be overwritten.

---**Global Description:**  
---Provides an interface for registering event handlers.
---
---**Class Description:**  
---Entry point for registering event handlers. It is accessible through the global object named `script`.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html)
---@class LuaBootstrap:LuaObject
---[R]  
---A dictionary listing the names of all currently active mods and mapping them to their version.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.active_mods)
---
---### Example  
---This will print the names and versions of all active mods to the console. 
---```
---for name, version in pairs(script.active_mods) do
---  game.print(name .. " version " .. version)
---end
---```
---@field active_mods {[string]: string} 
---[R]  
---Information about the currently running scenario/campaign/tutorial.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.level)
---@field level LuaBootstrap.level 
---[R]  
---The name of the mod from the environment this is used in.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.mod_name)
---@field mod_name string 
---[R]  
---This object's name.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.object_name)
---@field object_name string 
script={
---Generate a new, unique event ID that can be used to raise custom events with [LuaBootstrap::raise_event](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.raise_event).
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.generate_event_name)
---@return uint@The newly generated event ID.
generate_event_name=function()end,
---Gets the filters for the given event.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.get_event_filter)
---@param event uint@ID of the event to get.
---@return EventFilter@The filters or `nil` if none are defined.
get_event_filter=function(event)end,
---Find the event handler for an event.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.get_event_handler)
---@param event uint@The event identifier to get a handler for.
---@return fun(param1:EventData)@Reference to the function currently registered as the handler, if it was found.
get_event_handler=function(event)end,
---Gets the mod event order as a string.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.get_event_order)
---@return string
get_event_order=function()end,
---Register a function to be run when mod configuration changes. This is called when the major game version or any mod version changed, when any mod was added or removed, when a startup setting has changed, or when any prototypes have been added or removed. It allows the mod to make any changes it deems appropriate to both the data structures in its  table or to the game state through [LuaGameScript](https://lua-api.factorio.com/latest/LuaGameScript.html).
---
---**Note:** For more context, refer to the  page.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.on_configuration_changed)
---@param f fun(param1:ConfigurationChangedData)|nil@The handler for this event. Passing `nil` will unregister it.
on_configuration_changed=function(f)end,
---Register a handler to run on the specified event(s). Each mod can only register once for every event, as any additional registration will overwrite the previous one. This holds true even if different filters are used for subsequent registrations.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.on_event)
---
---### Example  
---Register for the [on_tick](https://lua-api.factorio.com/latest/events.html#on_tick) event to print the current tick to console each tick. 
---```
---script.on_event(defines.events.on_tick,
---function(event) game.print(event.tick) end)
---```
---
---### Example  
---Register for the [on_built_entity](https://lua-api.factorio.com/latest/events.html#on_built_entity) event, limiting it to only be received when a `"fast-inserter"` is built. 
---```
---script.on_event(defines.events.on_built_entity,
---function(event) game.print("Gotta go fast!") end,
---{{filter = "name", name = "fast-inserter"}})
---```
---@param event defines.events|defines.events[]|string@The event(s) or custom-input to invoke the handler on.
---@param f fun(param1:EventData)|nil@The handler for this event. Passing `nil` will unregister it.
---@param filters?EventFilter@The filters for this event. Can only be used when registering for individual events.
on_event=function(event,f,filters)end,
---Register a function to be run on mod initialization. This is only called when a new save game is created or when a save file is loaded that previously didn't contain the mod. During it, the mod gets the chance to set up initial values that it will use for its lifetime. It has full access to [LuaGameScript](https://lua-api.factorio.com/latest/LuaGameScript.html) and the  table and can change anything about them that it deems appropriate. No other events will be raised for the mod until it has finished this step.
---
---**Note:** For more context, refer to the  page.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.on_init)
---
---### Example  
---Initialize a `players` table in `global` for later use. 
---```
---script.on_init(function()
---  global.players = {}
---end)
---```
---@param f fun()|nil@The handler for this event. Passing `nil` will unregister it.
on_init=function(f)end,
---Register a function to be run on save load. This is only called for mods that have been part of the save previously, or for players connecting to a running multiplayer session. It gives the mod the opportunity to do some very specific actions, should it need to. Doing anything other than these three will lead to desyncs, which breaks multiplayer and replay functionality. Access to [LuaGameScript](https://lua-api.factorio.com/latest/LuaGameScript.html) is not available. The  table can be accessed and is safe to read from, but not write to, as doing so will lead to an error.
---
---The only legitimate uses of this event are the following:  
---- Re-setup [metatables](https://www.lua.org/pil/13.html) as they are not persisted through the save/load cycle.  
---- Re-setup conditional event handlers, meaning subscribing to an event only when some condition is met to save processing time.  
---- Create local references to data stored in the  table.
---
---For all other purposes, [LuaBootstrap::on_init](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.on_init), [LuaBootstrap::on_configuration_changed](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.on_configuration_changed) or  should be used instead.
---
---**Note:** For more context, refer to the  page.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.on_load)
---@param f fun()|nil@The handler for this event. Passing `nil` will unregister it.
on_load=function(f)end,
---Register a handler to run every nth-tick(s). When the game is on tick 0 it will trigger all registered handlers.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.on_nth_tick)
---@param tick uint|uint[]|nil@The nth-tick(s) to invoke the handler on. Passing `nil` as the only parameter will unregister all nth-tick handlers.
---@param f fun(param1:NthTickEventData)|nil@The handler to run. Passing `nil` will unregister it for the provided nth-tick(s).
on_nth_tick=function(tick,f)end,
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.raise_biter_base_built)
---@class LuaBootstrap.raise_biter_base_built_param
---The entity that was built.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.raise_biter_base_built)
---@field entity LuaEntity 


---**Events:**  
--- * Will raise [on_biter_base_built](https://lua-api.factorio.com/latest/events.html#on_biter_base_built) instantly.  
---Raised with the provided arguments.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.raise_biter_base_built)
---@param param LuaBootstrap.raise_biter_base_built_param
raise_biter_base_built=function(param)end,
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.raise_console_chat)
---@class LuaBootstrap.raise_console_chat_param
---The player doing the chatting.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.raise_console_chat)
---@field player_index uint 
---The chat message to send.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.raise_console_chat)
---@field message string 


---**Events:**  
--- * Will raise [on_console_chat](https://lua-api.factorio.com/latest/events.html#on_console_chat) instantly.  
---Raised with the provided arguments.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.raise_console_chat)
---@param param LuaBootstrap.raise_console_chat_param
raise_console_chat=function(param)end,
---Raise an event. Only events generated with [LuaBootstrap::generate_event_name](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.generate_event_name) and the following can be raised:
---
---- [on_console_chat](https://lua-api.factorio.com/latest/events.html#on_console_chat)  
---- [on_player_crafted_item](https://lua-api.factorio.com/latest/events.html#on_player_crafted_item)  
---- [on_player_fast_transferred](https://lua-api.factorio.com/latest/events.html#on_player_fast_transferred)  
---- [on_biter_base_built](https://lua-api.factorio.com/latest/events.html#on_biter_base_built)  
---- [on_market_item_purchased](https://lua-api.factorio.com/latest/events.html#on_market_item_purchased)  
---- [script_raised_built](https://lua-api.factorio.com/latest/events.html#script_raised_built)  
---- [script_raised_destroy](https://lua-api.factorio.com/latest/events.html#script_raised_destroy)  
---- [script_raised_revive](https://lua-api.factorio.com/latest/events.html#script_raised_revive)  
---- [script_raised_set_tiles](https://lua-api.factorio.com/latest/events.html#script_raised_set_tiles)
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.raise_event)
---
---### Example  
---Raise the [on_console_chat](https://lua-api.factorio.com/latest/events.html#on_console_chat) event with the desired message 'from' the first player. 
---```
---local data = {player_index = 1, message = "Hello friends!"}
---script.raise_event(defines.events.on_console_chat, data)
---```
---@param event uint@ID of the event to raise.
---@param data table@Table with extra data that will be passed to the event handler. Any invalid LuaObjects will silently stop the event from being raised.
raise_event=function(event,data)end,
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.raise_market_item_purchased)
---@class LuaBootstrap.raise_market_item_purchased_param
---The player who did the purchasing.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.raise_market_item_purchased)
---@field player_index uint 
---The market entity.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.raise_market_item_purchased)
---@field market LuaEntity 
---The index of the offer purchased.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.raise_market_item_purchased)
---@field offer_index uint 
---The amount of offers purchased.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.raise_market_item_purchased)
---@field count uint 


---**Events:**  
--- * Will raise [on_market_item_purchased](https://lua-api.factorio.com/latest/events.html#on_market_item_purchased) instantly.  
---Raised with the provided arguments.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.raise_market_item_purchased)
---@param param LuaBootstrap.raise_market_item_purchased_param
raise_market_item_purchased=function(param)end,
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.raise_player_crafted_item)
---@class LuaBootstrap.raise_player_crafted_item_param
---The item that has been crafted.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.raise_player_crafted_item)
---@field item_stack LuaItemStack 
---The player doing the crafting.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.raise_player_crafted_item)
---@field player_index uint 
---The recipe used to craft this item.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.raise_player_crafted_item)
---@field recipe LuaRecipe 


---**Events:**  
--- * Will raise [on_player_crafted_item](https://lua-api.factorio.com/latest/events.html#on_player_crafted_item) instantly.  
---Raised with the provided arguments.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.raise_player_crafted_item)
---@param param LuaBootstrap.raise_player_crafted_item_param
raise_player_crafted_item=function(param)end,
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.raise_player_fast_transferred)
---@class LuaBootstrap.raise_player_fast_transferred_param
---The player transferred from or to.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.raise_player_fast_transferred)
---@field player_index uint 
---The entity transferred from or to.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.raise_player_fast_transferred)
---@field entity LuaEntity 
---Whether the transfer was from player to entity. If `false`, the transfer was from entity to player.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.raise_player_fast_transferred)
---@field from_player boolean 


---**Events:**  
--- * Will raise [on_player_fast_transferred](https://lua-api.factorio.com/latest/events.html#on_player_fast_transferred) instantly.  
---Raised with the provided arguments.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.raise_player_fast_transferred)
---@param param LuaBootstrap.raise_player_fast_transferred_param
raise_player_fast_transferred=function(param)end,
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.raise_script_built)
---@class LuaBootstrap.raise_script_built_param
---The entity that has been built.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.raise_script_built)
---@field entity LuaEntity 


---**Events:**  
--- * Will raise [script_raised_built](https://lua-api.factorio.com/latest/events.html#script_raised_built) instantly.  
---Raised with the provided arguments.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.raise_script_built)
---@param param LuaBootstrap.raise_script_built_param
raise_script_built=function(param)end,
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.raise_script_destroy)
---@class LuaBootstrap.raise_script_destroy_param
---The entity that was destroyed.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.raise_script_destroy)
---@field entity LuaEntity 


---**Events:**  
--- * Will raise [script_raised_destroy](https://lua-api.factorio.com/latest/events.html#script_raised_destroy) instantly.  
---Raised with the provided arguments.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.raise_script_destroy)
---@param param LuaBootstrap.raise_script_destroy_param
raise_script_destroy=function(param)end,
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.raise_script_revive)
---@class LuaBootstrap.raise_script_revive_param
---The entity that was revived.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.raise_script_revive)
---@field entity LuaEntity 
---The tags associated with this entity, if any.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.raise_script_revive)
---@field tags? Tags 


---**Events:**  
--- * Will raise [script_raised_revive](https://lua-api.factorio.com/latest/events.html#script_raised_revive) instantly.  
---Raised with the provided arguments.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.raise_script_revive)
---@param param LuaBootstrap.raise_script_revive_param
raise_script_revive=function(param)end,
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.raise_script_set_tiles)
---@class LuaBootstrap.raise_script_set_tiles_param
---The surface whose tiles have been changed.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.raise_script_set_tiles)
---@field surface_index uint 
---The tiles that have been changed.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.raise_script_set_tiles)
---@field tiles Tile[] 


---**Events:**  
--- * Will raise [script_raised_set_tiles](https://lua-api.factorio.com/latest/events.html#script_raised_set_tiles) instantly.  
---Raised with the provided arguments.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.raise_script_set_tiles)
---@param param LuaBootstrap.raise_script_set_tiles_param
raise_script_set_tiles=function(param)end,
---Register a metatable to have linkage recorded and restored when saving/loading. The metatable itself will not be saved. Instead, only the linkage to a registered metatable is saved, and the metatable registered under that name will be used when loading the table.
---
---**Note:** `register_metatable()` can not be used in the console, in event listeners or during a `remote.call()`.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.register_metatable)
---@param name string@The name of this metatable. Names must be unique per mod.
---@param metatable table@The metatable to register.
register_metatable=function(name,metatable)end,
---Registers an entity so that after it's destroyed, [on_entity_destroyed](https://lua-api.factorio.com/latest/events.html#on_entity_destroyed) is called. Once an entity is registered, it stays registered until it is actually destroyed, even through save/load cycles. The registration is global across all mods, meaning once one mod registers an entity, all mods listening to [on_entity_destroyed](https://lua-api.factorio.com/latest/events.html#on_entity_destroyed) will receive the event when it is destroyed. Registering the same entity multiple times will still only fire the destruction event once, and will return the same registration number.
---
---**Note:** Depending on when a given entity is destroyed, [on_entity_destroyed](https://lua-api.factorio.com/latest/events.html#on_entity_destroyed) will either be fired at the end of the current tick or at the end of the next tick.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.register_on_entity_destroyed)
---@param entity LuaEntity@The entity to register.
---@return uint64@The registration number. It is used to identify the entity in the [on_entity_destroyed](https://lua-api.factorio.com/latest/events.html#on_entity_destroyed) event.
register_on_entity_destroyed=function(entity)end,
---Sets the filters for the given event. The filters are only retained when set after the actual event registration, because registering for an event with different or no filters will overwrite previously set ones.
---
---[View documentation](https://lua-api.factorio.com/latest/LuaBootstrap.html#LuaBootstrap.set_event_filter)
---
---### Example  
---Limit the [on_marked_for_deconstruction](https://lua-api.factorio.com/latest/events.html#on_marked_for_deconstruction) event to only be received when a non-ghost entity is marked for deconstruction. 
---```
---script.set_event_filter(defines.events.on_marked_for_deconstruction, {{filter = "ghost", invert = true}})
---```
---
---### Example  
---Limit the [on_built_entity](https://lua-api.factorio.com/latest/events.html#on_built_entity) event to only be received when either a `unit` or a `unit-spawner` is built. 
---```
---script.set_event_filter(defines.events.on_built_entity, {{filter = "type", type = "unit"}, {filter = "type", type = "unit-spawner"}})
---```
---
---### Example  
---Limit the [on_entity_damaged](https://lua-api.factorio.com/latest/events.html#on_entity_damaged) event to only be received when a `rail` is damaged by an `acid` attack. 
---```
---script.set_event_filter(defines.events.on_entity_damaged, {{filter = "rail"}, {filter = "damage-type", type = "acid", mode = "and"}})
---```
---@param event uint@ID of the event to filter.
---@param filters?EventFilter@The filters or `nil` to clear them.
set_event_filter=function(event,filters)end,
}


