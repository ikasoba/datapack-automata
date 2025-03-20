$execute unless entity @e[nbt={Tags:["automata:mob:automata:$(Id)"]},distance=..256,limit=1] run function automata:model/automata/die { Id: $(Id) }

$function automata:model/automata/sync_position { Target: '@e[nbt={Tags:["automata:mob:automata:$(Id)"]},limit=1]' }

$data modify entity @s Rotation set from entity @e[nbt={Tags:["automata:mob:automata:$(Id)"]},limit=1] Rotation
$data modify entity @s Pose set from entity @e[nbt={Tags:["automata:mob:automata:$(Id)"]},limit=1] Pose

$execute unless entity @s[nbt={CustomName:'"§a§u§t§o§m§a§t§a§:§$(Color)§r$(DisplayName)"'}] run function automata:model/automata/on_name_changed { Id: $(Id), Color: $(Color) }

$execute if entity @s[nbt={HandItems:[{id:"minecraft:sugar"}, {}]}] run function automata:model/automata/on_sugar { Id: $(Id) }
$execute if entity @s[nbt={HandItems:[{id:"minecraft:brown_dye"}, {}]}] run function automata:model/automata/on_dyeing { Id: $(Id), Color: 0, DisplayName: '$(DisplayName)' }
$execute if entity @s[nbt={HandItems:[{id:"minecraft:cyan_dye"}, {}]}] run function automata:model/automata/on_dyeing { Id: $(Id), Color: 1, DisplayName: '$(DisplayName)' }
$execute if entity @s[nbt={HandItems:[{id:"minecraft:lime_dye"}, {}]}] run function automata:model/automata/on_dyeing { Id: $(Id), Color: 2, DisplayName: '$(DisplayName)' }
$execute if entity @s[nbt={HandItems:[{id:"minecraft:yellow_dye"}, {}]}] run function automata:model/automata/on_dyeing { Id: $(Id), Color: 3, DisplayName: '$(DisplayName)' }
$execute if entity @s[nbt={HandItems:[{id:"minecraft:magenta_dye"}, {}]}] run function automata:model/automata/on_dyeing { Id: $(Id), Color: 4, DisplayName: '$(DisplayName)' }

$execute if entity @s[nbt={HandItems:[{components: { "minecraft:custom_data": { "automata:automata_state": "null" } }}, {}]}] run function automata:model/automata/itemization { Id: $(Id) }

$execute store result score @s __automata_tmp run data get storage automata:mob_states $(Id).Role

scoreboard players set @s __automata_tmp2 0
execute if items entity @s weapon.mainhand #minecraft:swords run scoreboard players set @s __automata_tmp2 1

$execute unless entity @s[scores={__automata_tmp=0}] if entity @s[scores={__automata_tmp2=0}] run function automata:model/automata/set_role { Id: $(Id), Role: 0 }
$execute unless entity @s[scores={__automata_tmp=1}] if entity @s[scores={__automata_tmp2=1}] run function automata:model/automata/set_role { Id: $(Id), Role: 1 }
