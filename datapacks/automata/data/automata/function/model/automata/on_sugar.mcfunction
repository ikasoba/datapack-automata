execute store result score @s __automata_tmp run data get entity @s HandItems[0].count
scoreboard players remove @s __automata_tmp 1
execute store result entity @s HandItems[0].count int 1 run scoreboard players get @s __automata_tmp
execute if entity @s[scores={__automata_tmp=..0}] run data modify entity @s HandItems[0] set value {}
give @p minecraft:sugar

particle minecraft:note ~ ~2.1 ~ 0.05 0.1 0.05 1 1

$execute store result score @s __automata_tmp run data get storage automata:mob_states $(Id).Mode
scoreboard players add @s __automata_tmp 1
scoreboard players set @s __automata_tmp2 2
scoreboard players operation @s __automata_tmp %= @s __automata_tmp2
$execute store result storage automata:mob_states $(Id).Mode int 1 run scoreboard players get @s __automata_tmp
$execute if entity @s[scores={__automata_tmp=0}] run data modify storage automata:mob_states $(Id).AnimationKind set value 1
$execute if entity @s[scores={__automata_tmp=1}] run data modify storage automata:mob_states $(Id).AnimationKind set value 0
$execute as @e[nbt={Tags:["automata:mob:automata:$(Id)"]}] at @s run function automata:mob/automata/on_mode_changed {}
