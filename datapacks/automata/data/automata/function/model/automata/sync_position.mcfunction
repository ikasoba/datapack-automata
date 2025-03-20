$data modify storage automata:tmp 0 set from entity $(Target) Pos

execute store result score @s __automata_tmp run data get storage automata:tmp 0[1] 10
scoreboard players remove @s __automata_tmp 6
execute store result storage automata:tmp 0[1] double 0.1 run scoreboard players get @s __automata_tmp

data modify entity @s Pos[0] set from storage automata:tmp 0[0]
data modify entity @s Pos[1] set from storage automata:tmp 0[1]
data modify entity @s Pos[2] set from storage automata:tmp 0[2]
