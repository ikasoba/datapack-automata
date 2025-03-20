$execute unless block ^ ^ ^$(N) minecraft:air unless block ^ ^ ^$(N) #minecraft:fences unless block ^ ^ ^$(N) #automata:non_colliding_blocks run return $(N_i)

$data modify storage automata:tmp 0 set value $(N)

execute store result score @s __automata_tmp run data get storage automata:tmp 0 2

$execute if entity @s[scores={__automata_tmp=15..}] run return $(N_i)

scoreboard players add @s __automata_tmp 1

data modify storage automata:tmp 0 set value {}
execute store result storage automata:tmp 0.N float 0.5 run scoreboard players get @s __automata_tmp
execute store result storage automata:tmp 0.N_i int 1 run scoreboard players get @s __automata_tmp

return run function automata:util/block_distance_tick with storage automata:tmp 0
