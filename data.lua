-- data.raw.furnace["burner-furnace"]

---@alias PrototypeDataType.name string
---@alias PrototypeData.name string

---@class PrototypeData
---@field name string
---@field type string
---@field [any] any


---@class data
---@field is_demo boolean
---@field raw {[PrototypeDataType.name]: {[PrototypeData.name]: PrototypeData}}
data = {}


---@param otherdata PrototypeData[]
function data.extend(self, otherdata) end
