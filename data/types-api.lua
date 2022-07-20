---@meta

do
  ---[View documentation](https://wiki.factorio.com/Types/FileName)
  ---@alias filename string

  ---@class SoundTable
  ---@field aggregation? SoundTable.Aggregation
  ---@field variations? SoundTable.Variations[]
  ---@field filename filename #Mandatory if SoundVariations is not given
  ---@field preload? boolean #Only loaded if SoundVariations is not given
  ---@field speed? float #Only loaded if SoundVariations is not given
  ---@field min_speed? float #Only loaded if SoundVariations is not given
  ---@field max_speed? float #Only loaded if SoundVariations is not given
  local SoundTable = {
    allow_random_repeat = false,
    audible_distance_modifier = 1, ---@type double
  }

  ---@class SoundTable.Aggregation
  ---@field max_count uint
  local SoundAggreation = {
    progress_threshold = 1.0,
    remove = false,
    count_already_playing = false
  }

  ---@class SoundTable.Variations
  ---@field filename filename
  local SoundVariations = {
    volume = 1.0,
    preload = false,
    speed = 1.0, --Speed must be >= 1 / 64. This sets both min and max speed.
    min_speed = 1.0, --Not loaded if speed is present. Speed must be >= 1 / 64.
    max_speed = 1.0, --Mandatory if min_speed is present, otherwise not loaded. Must be >= min_speed.
  }
end
