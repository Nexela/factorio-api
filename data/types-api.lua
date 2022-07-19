-- ##
--- @meta
do -- Aliases
  --- @alias TriggerItemType '"direct"' | '"area"' | '"line"' | '"cluster"'

  --- @alias TriggerDeliveryTypes  '"instant"' | '"projectile"' | '"flame-thrower"' | '"beam"' | '"stream"' | '"artillery"'

  --- @alias TriggerEffectItemType
  --- | '"damage"'
  --- | '"create-entity"'
  --- | '"create-explosion"'
  --- | '"create-fire"'
  --- | '"create-smoke"'
  --- | '"create-trivial-smoke"'
  --- | '"create-particle"'
  --- | '"create-sticker"'
  --- | '"create-decorative"'
  --- | '"nested-result"'
  --- | '"play-sound"'
  --- | '"push-back"'
  --- | '"destroy-cliffs"'
  --- | '"show-explosion-on-chart"'
  --- | '"insert-item"'
  --- | '"script"'
  --- | '"set-tile"'
  --- | '"invoke-tile-trigger"'
  --- | '"destroy-decoratives"'
  --- | '"camera-effect"'

  --- [View documentation](https://lua-api.factorio.com/latest/Concepts.html#RenderLayer)
  --- @alias RenderLayerType
  --- | '"water-tile"'
  --- | '"ground-tile"'
  --- | '"tile-transition"'
  --- | '"decals"'
  --- | '"lower-radius-visualization"'
  --- | '"radius-visualization"'
  --- | '"transport-belt-integration"'
  --- | '"resource"'
  --- | '"building-smoke"'
  --- | '"decorative"'
  --- | '"ground-patch"'
  --- | '"ground-patch-higher"'
  --- | '"ground-patch-higher2"'
  --- | '"remnants"'
  --- | '"floor"'
  --- | '"transport-belt"'
  --- | '"transport-belt-endings"'
  --- | '"floor-mechanics-under-corpse"'
  --- | '"corpse"'
  --- | '"floor-mechanics"'
  --- | '"item"'
  --- | '"lower-object"'
  --- | '"transport-belt-circuit-connector"'
  --- | '"lower-object-above-shadow"'
  --- | '"object"'
  --- | '"higher-object-under"'
  --- | '"higher-object-above"'
  --- | '"item-in-inserter-hand"'
  --- | '"wires"'
  --- | '"wires-above"'
  --- | '"entity-info-icon"'
  --- | '"entity-info-icon-above"'
  --- | '"explosion"'
  --- | '"projectile"'
  --- | '"smoke"'
  --- | '"air-object"'
  --- | '"air-entity-info-icon"'
  --- | '"light-effect"'
  --- | '"selection-box"'
  --- | '"higher-selection-box"'
  --- | '"collision-selection-box"'
  --- | '"arrow"'
  --- | '"cursor"'

  ---A [string](https://lua-api.factorio.com/latest/Builtin-Types.html#string) specifying a collision mask layer.
  ---[View documentation](https://lua-api.factorio.com/latest/Concepts.html#CollisionMaskLayer)
  --- @alias CollisionMaskLayerStrings
  --- | '"ground-tile"'
  --- | '"water-tile"'
  --- | '"resource-layer"'
  --- | '"doodad-layer"'
  --- | '"floor-layer"'
  --- | '"rail-layer"'
  --- | '"transport-belt-layer"'
  --- | '"item-layer"'
  --- | '"ghost-layer"'
  --- | '"object-layer"'
  --- | '"player-layer"'
  --- | '"train-layer"'

  --- [View documentation](https://wiki.factorio.com/Types/FileName)
  --- @alias FileName string

  --- @alias ExplosionPrototypeString string
  --- @alias FluidStreamPrototypeString string
  --- @alias BeamPrototypeString string
  --- @alias ArtilleryProjectilePrototypeString string
  --- @alias ProjectilePrototypeString string
  --- @alias DamageTypePrototypeString string
  --- @alias AliasDamageTypeFilters DamageTypeFilters|DamageTypePrototypeString[]|DamageTypePrototypeString
end

do -- Other
  --- @class DamageTypeFilters
  --- @field types DamageTypePrototypeString[]|DamageTypePrototypeString
  local DamageTypeFilters = { whitelist = false }

  --- @class Sound
  --- @field aggregation? SoundAggregation
  --- @field variations? SoundVariations[]
  --- @field filename FileName #Mandatory if SoundVariations is not given
  --- @field preload? boolean #Only loaded if SoundVariations is not given
  --- @field speed? float #Only loaded if SoundVariations is not given
  --- @field min_speed? float #Only loaded if SoundVariations is not given
  --- @field max_speed? float #Only loaded if SoundVariations is not given
  local SoundTable = {
    allow_random_repeat = false,
    audible_distance_modifier = 1, --- @type double
  }

  --- @class SoundAggregation
  --- @field max_count uint
  local SoundAggreation = {
    progress_threshold = 1, --- @type float
    remove = false,
    count_already_playing = false
  }

  --- @class SoundVariations
  --- @field filename FileName
  local SoundBasic = {
    volume = 1, --- @type float
    preload = false,
    speed = 1, --- @type float #Speed must be >= 1 / 64. This sets both min and max speed.
    min_speed = 1, --- @type float #Not loaded if speed is present. Speed must be >= 1 / 64.
    max_speed = 1, --- @type float #Mandatory if min_speed is present, otherwise not loaded. Must be >= min_speed.
  }
end

do -- TriggerItem
  --- @class TriggerItem
  --- @field type TriggerItemType
  --- @field action_delivery TriggerDelivery
  --- @field collision_mask? CollisionMaskLayerStrings[]
  local TriggerItem = {
    ignore_collision_condition = false,
    repeat_count = 1, --- @type uint
    probability = 1 --- @type float
  }

  --- @class DirectTriggerItem: TriggerItem
  local DirectTriggerItem = {
    filter_enabled = false, --- @type boolean
    type = 'direct' --- @type string
  }

  --- @alias AreaTriggerItem.collision_mode 'distance-from-collision-box' | 'distance-from-center'
  --- @class AreaTriggerItem: TriggerItem
  --- @field radius double #Mandatory
  local AreaTriggerItem = {
    type = 'area', --- @type string
    trigger_from_target = false, --- @type boolean
    target_entities = true, --- @type boolean
    show_in_tooltip = true, --- @type boolean
    collision_mode = 'distance-from-collision-box' --- @type AreaTriggerItem.collision_mode
  }

  --- @class ClusterTriggerItem: TriggerItem
  --- @field cluster_count double #Mandatory > 1
  --- @field distance float #Mandatory
  local ClusterTriggerItem = {
    type = 'cluster', --- @type string
    distance_deviation = 0 --- @type float
  }

  --- @class LineTriggerItem: TriggerItem
  --- @field range double #Mandatory
  --- @field width double Mandatory
  --- @field range_effects TriggerEffectItem[]
  local LineTriggerItem = {
    type = 'line', --- @type string
  }
end

do -- TriggerDelivery
  --- @class TriggerDelivery
  --- @field type TriggerDeliveryTypes
  --- @field source_effects? TriggerEffectItem[]
  --- @field target_effects? TriggerEffectItem[]
  local TriggerDelivery = {}

  --- @class InstantTriggerDelivery: TriggerDelivery
  local InstantTriggerDelivery = {}

  --- @class ProjectileTriggerDelivery: TriggerDelivery
  --- @field projectile ProjectilePrototypeString
  --- @field starting_speed float
  local ProjectileTriggerDelivery = {
    starting_speed_deviation = 0, --- @type float
    direction_deviation = 0, --- @type float
    range_deviation = 0, --- @type float
    max_range = 100, --- @type double
    min_range = 0 --- @type double
  }

  --- @class BeamTriggerDelivery: TriggerDelivery
  --- @field beam BeamPrototypeString
  --- @field source_offset? Vector<number, double>
  local BeamTriggerDelivery = {
    add_to_shooter = false, --- @type boolean
    max_length = 0, --- @type uint
    duration = 0, --- @type uint
  }

  --- @class FlameThrowerTriggerDelivery: TriggerDelivery
  --- @field explosion ExplosionPrototypeString
  --- @field starting_distance double
  local FlameThrowerTriggerDelivery = {
    direction_deviation = 0, --- @type float
    speed_deviation = 0, --- @type float
    starting_frame_fraction_deviation = 0, --- @type float
    projectile_starting_speed = 1 --- @type float
  }

  --- @class StreamTriggerDelivery: TriggerDelivery
  --- @field stream FluidStreamPrototypeString
  --- @field source_offset? Vector<number, double>
  local StreamTriggerDelivery = {}

  --- @class ArtilleryTriggerDelivery: TriggerDelivery
  --- @field projectile ArtilleryProjectilePrototypeString
  --- @field starting-speed float
  local ArtilleryTriggerDelivery = {
    starting_speed_deviation = 0, --- @type float
    direction_deviation = 0, --- @type float
    range_deviation = 0, --- @type float
    trigger_fired_artillery = false --- @type boolean
  }
end

do -- TriggerEffect
  --- @class TriggerEffectItem
  --- @field type TriggerEffectItemType
  --- @field damage_type_filters? AliasDamageTypeFilters
  local TriggerEffectItem = {
    repeat_count = 0, --- @type uint16
    repeat_count_deviation = 0, --- @type uint16
    probability = 1, --- @type float
    affect_target = false, --- @type boolean
    show_in_tooltip = true, --- @type boolean
  }

  --- @class DamageTriggerEffectItem: TriggerEffectItem
  --- @field damage string #DamagePrototype
  local DamageTriggerEffectItem = {
    apply_damage_to_trees = true, --- @type boolean
    vaporize = false, --- @type boolean
    lower_distance_threshold = 65535, --- @type uint16
    upper_distance_threshold = 65535, --- @type uint16
    lower_damage_modifier = 1, --- @type float
    upper_damage_modiier = 1, --- @type float

  }

  --- @class CreateEntityTriggerEffectItem: TriggerEffectItem
  --- @field entity_name string
  --- @field offset_deviation? BoundingBox
  --- @field tile_collision_mask? CollisionMaskLayerStrings[]
  --- @field offsets? Vector[]
  local CreateEntityTriggerEffectItem = {
    trigger_created_entity = false, --- @type boolean
    check_buildability = false, --- @type boolean
    show_in_tooltip = false, --- @type boolean

  }

  --- @class CreateExplosionTriggerEffectItem: CreateEntityTriggerEffectItem
  local CreateExplosionTriggerEffectItem = {
    max_movement_distance = -1, --- @type float
    max_movement_distance_deviation = 0, --- @type float
    inherit_movement_distance_from_projectile = false, --- @type boolean
    cycle_while_moving = false --- @type boolean
  }

  --- @class CreateFireTriggerEffectItem: CreateEntityTriggerEffectItem
  local CreateFireTriggerEffectItem = {
    intial_ground_flame_count = 255 --- @type uint8
  }

  --- @class CreateSmokeTriggerEffectItem: CreateEntityTriggerEffectItem
  --- @field speed? Vector
  local CreateSmokeTriggerEffectItem = {
    initial_height = 0, --- @type float
    speed_multiplier = 0, --- @type float
    speed_multiplier_deviation = 0, --- @type float
    starting_frame = 0, --- @type float
    starting_frame_deviation = 0, --- @type float
    starting_frame_speed = 0, --- @type float
    speed_from_center = 0, --- @type float
    speed_from_center_deviation = 0 --- @type float
  }

  --- @class CreateTrivialSmokeTriggerEffectItem: TriggerEffectItem
  --- @field smoke_name? string
  --- @field offset_deviation? BoundingBox
  --- @field offsets? Vector[]
  --- @field speed? Vector
  local CreateTrivialSmokeTriggerEffectItem = {
    max_radius = 0, --- @type float
    initial_height = 0, --- @type float
    speed_multiplier = 0, --- @type float
    speed_multiplier_deviation = 0, --- @type float
    starting_frame = 0, --- @type float
    starting_frame_deviation = 0, --- @type float
    starting_frame_speed = 0, --- @type float
    speed_from_center = 0, --- @type float
    speed_from_center_deviation = 0 --- @type float
  }

  --- @class CreateParticleTriggerEffectItem: TriggerEffectItem
  --- @field particle_name string
  --- @field initial_height float
  --- @field offset_deviation? BoundingBox
  --- @field tile_collision_mask? CollisionMaskLayerStrings[]
  --- @field offsets? Vector[]
  local CreateParticleTriggerEffectItem = {
    show_in_tooltip = false, --- @type boolean
    initial_height_deviation = 0, --- @type float
    initial_vertical_speed = 0, --- @type float
    initial_verticle_speed_deviation = 0, --- @type float
    speed_from_center = 0, --- @type float
    speed_from_center_deviation = 0, --- @type float
    tai_length = 0, --- @type float
    tail_length_deviation = 0, --- @type float
    tail_width = 1, --- @type float
    rotate_offsets = false --- @type boolean
  }

  --- @class CreateStickerTriggerEffectItem: TriggerEffectItem
  --- @field sticker string
  local CreateStickerTriggerEffectItem = {
    show_in_tooltip = false, --- @type boolean
    trigger_created_entity = false --- @type boolean
  }

  --- @class CreateDecorativesTriggerEffectItem: TriggerEffectItem
  --- @field decorative string
  --- @field spawn_max uint16
  --- @field spawn_min_radius float
  --- @field spawn_max_radius float # Must be < 24
  local CreateDecorativesTriggerEffectItem = {
    spawn_min = 0, --- @type float
    radius_curve = 0.5, --- @type float
    apply_projection = false, --- @type boolean
    spread_evenly = false --- @type boolean
  }

  --- @class NestedTriggerEffectItem: TriggerEffectItem
  --- @field action TriggerItem
  local NestedTriggerEffectItem = {}

  --- @class PlaySoundTriggerEffectItem: TriggerEffectItem
  --- @field sound Sound|SoundVariations[]
  local PlaySoundTriggerEffectItem = {
    min_distance = 0, --- @type float
    max_distance = 1e21, --- @type float
    volume_modifier = 1, --- @type float
    audibile_distance_modifier = 1, --- @type float
    play_on_taret_position = false --- @type boolean
  }

  --- @class PushBackTriggerEffectItem: TriggerEffectItem
  --- @field distance float
  local PushBackTriggerEffectItem = {}

  --- @class DestroyCliffsTriggerEffectItem: TriggerEffectItem
  --- @field radius float
  --- @field explosion? ExplosionPrototypeString
  local DestroyCliffsTriggerEffectItem = {}

  --- @class ShowExplosionOnChartTriggerEffectItem: TriggerEffectItem
  --- @field scale float
  local ShowExplosionOnChartTriggerEffectItem = {}

  --- @class InsertItemTriggerEffectItem: TriggerEffectItem
  --- @field item string
  local InsertItemTriggerEffectItem = {
    count = 1 --- @type uint
  }

  --- @class ScriptTriggerEffectItem: TriggerEffectItem
  --- @field effect_id string #The effect_id that will be provided in on_script_trigger_effect
  local ScriptTriggerEffectItem = {}

  --- @class SetTileTriggerEffectItem: TriggerEffectItem
  --- @field tile_name string
  --- @field radius float
  --- @field tile_collision_mask? CollisionMaskLayerStrings[]
  local SetTileTriggerEffectItem = {
    apply_projection = false, --- @type boolean
  }

  --- @class InvokeTileEffectTriggerEffectItem: TriggerEffectItem
  --- @field tile_collision_mask? CollisionMaskLayerStrings[]
  local InvokeTileEffectTriggerEffectItem = {}

  --- @class DestroyDecorativesTriggerEffectItem: TriggerEffectItem
  --- @field radius float
  --- @field from_render_layer? RenderLayerType
  --- @field to_render_layer? RenderLayerType
  local DestroyDecorativesTriggerEffectItem = {
    include_soft_decoratives = false, --- @type boolean
    include_decals = false, --- @type boolean
    invoke_decorative_trigger = true, --- @type boolean
    decoratives_with_trigger_only = false, --- @type boolean
  }

  --- @class CamerEffectTriggerEffectItem: TriggerEffectItem
  --- @field efffect string
  --- @field duration uint8
  local CamerEffectTriggerEffectItem = {
    ease_in_duration = 0,
    ease_out_duration = 0,
    delay = 0,
    full_strength_max_distance = 0
  }


end

do -- AttackParameters
  --- @class BaseAttackParameters
  --- @field range float
  --- @field cooldown float
  --- @field type '"projectile"' | '"beam"' | '"stream"'
  local BaseAttackParameters = {}

  --- @class ProjectileAttackParameters: BaseAttackParameters
  --- @field projectile_center? Vector
  --- @field shell_particle? CircularParticleCreationSpecification[]
  --- @field projectile_creation_parameters? CircularProjectileCreationSpecification[]
  local ProjectileAttackParameters = {
    projectile_creation_distance = 0, --- @type float
    projectile_orientation_offset = 0, --- @type float
  }

  --- @class BeamAttackParameters: BaseAttackParameters
  --- @field source_offset? Vector
  local BeamAttackParameters = {
    source_direction_count = 0, --- @type uint
  }

  --- @class StreamAttackParameters: BaseAttackParameters
  --- @field projectile_creation_parameters? CircularProjectileCreationSpecification[]
  --- @field gun_center_shift? Vector|Vector[]|table<defines.direction, Vector>
  --- @field fluids? table<string, double> @FluidPrototype string, damage_modifier
  local StreamAttackParameters = {
    gun_barrel_length = 0, --- @type float
    fluid_consumption = 0 --- @type float
  }
end
