execute store result score @s __automata_tmp run data get entity @s HandItems[0].count
scoreboard players remove @s __automata_tmp 1
execute store result entity @s HandItems[0].count int 1 run scoreboard players get @s __automata_tmp
execute if entity @s[scores={__automata_tmp=..0}] run data modify entity @s HandItems[0] set value {}

particle minecraft:note ~ ~2.1 ~ 0.05 0.1 0.05 1 1

$data modify storage automata:mob_states $(Id).Color set value $(Color)
$function automata:model/automata/set_name { Color: $(Color), DisplayName: '$(DisplayName)' }
