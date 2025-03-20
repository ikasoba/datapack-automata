$summon minecraft:armor_stand ~ ~ ~ { NoAI: 1b, NoGravity: 0b, Silent: 1b, ShowArms: 1b, Invisible: 1b, Small: 1b, NoBasePlate: 1b, DeathLootTable: null, Tags: ["automata:mob", "automata:mob:automata:$(Id)"] }

$data modify storage automata:tmp 0 set value '"\\u00a7a\\u00a7u\\u00a7t\\u00a7o\\u00a7m\\u00a7a\\u00a7t\\u00a7a\\u00a7:\\u00a7$(Color)\\u00a7r"'
$execute store success score @s __automata_tmp run data modify storage automata:tmp 0 set value '"\\u00a7a\\u00a7u\\u00a7t\\u00a7o\\u00a7m\\u00a7a\\u00a7t\\u00a7a\\u00a7:\\u00a7$(Color)\\u00a7r$(DisplayName)"'

$execute if entity @s[scores={__automata_tmp=0}] run summon minecraft:armor_stand ~ ~ ~ { NoAI: 1b, NoGravity: 1b, Silent: 1b, ShowArms: 1b, Invisible: 0b, Small: 0b, NoBasePlate: 1b, DeathLootTable: null, Tags: ["automata:model", "automata:model:automata:$(Id)"], "CustomName": '"\\u00a7a\\u00a7u\\u00a7t\\u00a7o\\u00a7m\\u00a7a\\u00a7t\\u00a7a\\u00a7:\\u00a7$(Color)\\u00a7r$(DisplayName)"', CustomNameVisible: 0b }
$execute if entity @s[scores={__automata_tmp=1}] run summon minecraft:armor_stand ~ ~ ~ { NoAI: 1b, NoGravity: 1b, Silent: 1b, ShowArms: 1b, Invisible: 0b, Small: 0b, NoBasePlate: 1b, DeathLootTable: null, Tags: ["automata:model", "automata:model:automata:$(Id)"], "CustomName": '"\\u00a7a\\u00a7u\\u00a7t\\u00a7o\\u00a7m\\u00a7a\\u00a7t\\u00a7a\\u00a7:\\u00a7$(Color)\\u00a7r$(DisplayName)"', CustomNameVisible: 1b }

$scoreboard players set @e[nbt={Tags:["automata:mob:automata:$(Id)"]}] __automata_id $(Id)
$scoreboard players set @e[nbt={Tags:["automata:model:automata:$(Id)"]}] __automata_id $(Id)

$data modify storage automata:mob_states $(Id) set value { Version: 0, Id: $(Id), Role: $(Role), Mode: 1, Color: $(Color), DisplayName: '$(DisplayName)', Health: $(Health), Inventory: $(Inventory), AnimationKind: 0, AnimationTime: 0 }
