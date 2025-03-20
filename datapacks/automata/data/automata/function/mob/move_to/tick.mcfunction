$data modify entity $(Target) Rotation set from entity @s Rotation
$data modify entity $(Target) Pos set from entity @s Pos

$scoreboard players set @s __automata_tmp $(X)
execute store result score @s __automata_tmp2 run data get entity @s Pos[0]
scoreboard players operation @s __automata_tmp -= @s __automata_tmp2

$scoreboard players set @s __automata_tmp2 $(Y)
scoreboard players operation @s __automata_tmp += @s __automata_tmp2
execute store result score @s __automata_tmp2 run data get entity @s Pos[1]
scoreboard players operation @s __automata_tmp -= @s __automata_tmp2

$scoreboard players set @s __automata_tmp2 $(Z)
scoreboard players operation @s __automata_tmp += @s __automata_tmp2
execute store result score @s __automata_tmp2 run data get entity @s Pos[2]
scoreboard players operation @s __automata_tmp -= @s __automata_tmp2

scoreboard players set @s __automata_tmp2 3
scoreboard players operation @s __automata_tmp /= @s __automata_tmp2

$data modify entity @s wander_target set value [$(X), $(Y), $(Z)]

execute if entity @s[scores={__automata_tmp=-1..1}] run tp 0 -99999 0
execute if entity @s[scores={__automata_tmp=-1..1}] run kill @s
