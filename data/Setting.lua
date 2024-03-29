---@meta

---@alias SettingType.setting_type "startup" | "runtime-global" | "runtime-per-user"

---@class SettingType
---@field name string
---@field type SettingTypes.type
---@field localised_name? LocalisedString
---@field localised_description? LocalisedString
---@field order? Order
---@field hidden? boolean - Optional.
---@field setting_type SettingType.setting_type
---@class SettingType.IntSetting: SettingType
---@field default_value int64 Defines the default value of the setting.
---@field minimum_value? int64 Defines the lowest possible number.
---@field maximum_value? int64 Defines the highest possible number.
---@field allowed_values? int64[] Makes it possible to force the player to choose between the defined numbers, creates a dropdown instead of a texfield.
---@class SettingType.DoubleSetting: SettingType
---@field default_value double Defines the default value of the setting.
---@field minimum_value? double Defines the lowest possible number.
---@field maximum_value? double Defines the highest possible number.
---@field allowed_values? double[] Makes it possible to force the player to choose between the defined numbers, creates a dropdown instead of a texfield.
---@class SettingType.BoolSetting: SettingType
---@field default_value boolean Defines the default value of the setting, in this case whether the checkbox is checked or not.
---@field forced_value? boolean Only loaded if hidden = true. This forces the setting to be of this value. This can be useful for mod compatiblity.
---@class SettingType.StringSetting: SettingType
---@field default_value string Defines the default value of the setting.
---@field allow_blank? boolean Defines whether it's possible for the user to set the textfield to empty and apply the setting.
---@field auto_trim? boolean Whether values that are input by the user should have whitespace removed from both ends of the string.
---@field allowed_values? string[] Defines the values that the user can select from. The strings in the dropdown can be localized and can have a tooltip
