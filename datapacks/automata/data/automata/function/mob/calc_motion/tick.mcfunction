execute store result score @s __automata_tmp run data get entity @s Pos[0] 100
$execute store result score @s __automata_tmp2 run data get entity $(Target) Pos[0] 100

scoreboard players operation @s __automata_tmp -= @s __automata_tmp2
$execute store result score @s __automata_tmp3 run data get entity $(Target) Motion[0] 100
scoreboard players operation @s __automata_tmp += @s __automata_tmp3
scoreboard players set @s __automata_tmp2 2
scoreboard players operation @s __automata_tmp /= @s __automata_tmp2

$execute store result entity $(Target) Motion[0] double 0.01 run scoreboard players get @s __automata_tmp

execute store result score @s __automata_tmp run data get entity @s Pos[2] 100
$execute store result score @s __automata_tmp2 run data get entity $(Target) Pos[2] 100

scoreboard players operation @s __automata_tmp -= @s __automata_tmp2
$execute store result score @s __automata_tmp3 run data get entity $(Target) Motion[2] 100
scoreboard players operation @s __automata_tmp += @s __automata_tmp3
scoreboard players set @s __automata_tmp2 2
scoreboard players operation @s __automata_tmp /= @s __automata_tmp2

$execute store result entity $(Target) Motion[2] double 0.01 run scoreboard players get @s __automata_tmp

execute store result score @s __automata_tmp run data get entity @s Pos[1] 100
$execute store result score @s __automata_tmp2 run data get entity $(Target) Pos[1] 100

# Y が "^" と等しいなら Y 軸はスキップ
data modify storage automata:tmp 0 set value { '^': 0 }
$execute if data storage automata:tmp 0.'$(Y)' run kill @s
$execute if data storage automata:tmp 0.'$(Y)' run return 0

scoreboard players operation @s __automata_tmp -= @s __automata_tmp2
$execute store result score @s __automata_tmp3 run data get entity $(Target) Motion[1] 100
scoreboard players operation @s __automata_tmp += @s __automata_tmp3
scoreboard players set @s __automata_tmp2 2
scoreboard players operation @s __automata_tmp /= @s __automata_tmp2

$execute store result entity $(Target) Motion[1] double 0.01 run scoreboard players get @s __automata_tmp

kill @s
