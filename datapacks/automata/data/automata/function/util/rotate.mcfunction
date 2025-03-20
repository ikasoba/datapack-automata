execute store result score @s __automata_tmp run data get entity @s Rotation[0] 100
$scoreboard players set @s __automata_tmp2 $(RotationX)
scoreboard players operation @s __automata_tmp += @s __automata_tmp2

execute store result entity @s Rotation[0] float 0.01 run scoreboard players get @s __automata_tmp

execute store result score @s __automata_tmp run data get entity @s Rotation[1] 100
$scoreboard players set @s __automata_tmp2 $(RotationZ)
scoreboard players operation @s __automata_tmp += @s __automata_tmp2

execute store result entity @s Rotation[1] float 0.01 run scoreboard players get @s __automata_tmp
