$data modify storage automata:tmp 0 set value { Id: $(Id) }
$data modify storage automata:tmp 0.X set from entity $(Target) Pos[0]

$execute store result score @s __automata_tmp run data get entity $(Target) Pos[1] 10
$scoreboard players add @s __automata_tmp $(OffsetY)
execute store result storage automata:tmp 0.Y float 0.1 run scoreboard players get @s __automata_tmp

$data modify storage automata:tmp 0.Z set from entity $(Target) Pos[2]

function automata:mob/automata/facing_to with storage automata:tmp 0
