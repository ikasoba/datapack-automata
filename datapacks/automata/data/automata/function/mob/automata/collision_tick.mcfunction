# Load Motion X

execute store result score @s __automata_tmp run data get entity @s Motion[0] 100
execute if entity @s[scores={__automata_tmp=-1..1}] run data modify entity @s Motion[0] set value 0f
execute if entity @s[scores={__automata_tmp=-1..1}] run scoreboard players set @s __automata_tmp 0

## Collision

scoreboard players set @s __automata_tmp2 0
scoreboard players set @s __automata_tmp3 0
$execute store result score @s __automata_tmp2 run data get entity @e[type=!minecraft:marker,type=!minecraft:item,nbt=!{Tags:["automata:mob:automata:$(Id)"]},nbt=!{Tags:["automata:model:automata:$(Id)"]},distance=..0.5,sort=nearest,limit=1] Pos[0] 100
execute store result score @s __automata_tmp3 run data get entity @s Pos[0] 100
scoreboard players operation @s __automata_tmp2 -= @s __automata_tmp3
execute unless entity @s[scores={__automata_tmp2=-100..100}] run scoreboard players set @s __automata_tmp2 100

execute if entity @s[scores={__automata_tmp2=..0}] run scoreboard players set @s __automata_tmp3 100
execute unless entity @s[scores={__automata_tmp2=..0}] run scoreboard players set @s __automata_tmp3 -100
scoreboard players operation @s __automata_tmp2 += @s __automata_tmp3

scoreboard players set @s __automata_tmp3 3
scoreboard players operation @s __automata_tmp2 /= @s __automata_tmp3

scoreboard players operation @s __automata_tmp += @s __automata_tmp2

## Update

execute store result entity @s Motion[0] double 0.008 run scoreboard players get @s __automata_tmp

# Load Motion Z

execute store result score @s __automata_tmp run data get entity @s Motion[2] 100
execute if entity @s[scores={__automata_tmp=-1..1}] run data modify entity @s Motion[2] set value 0f
execute if entity @s[scores={__automata_tmp=-1..1}] run scoreboard players set @s __automata_tmp 0

## Collision

scoreboard players set @s __automata_tmp2 0
scoreboard players set @s __automata_tmp3 0
$execute store result score @s __automata_tmp2 run data get entity @e[type=!minecraft:marker,type=!minecraft:item,nbt=!{Tags:["automata:mob:automata:$(Id)"]},nbt=!{Tags:["automata:model:automata:$(Id)"]},distance=..0.5,sort=nearest,limit=1] Pos[2] 100
execute store result score @s __automata_tmp3 run data get entity @s Pos[2] 100
scoreboard players operation @s __automata_tmp2 -= @s __automata_tmp3
execute unless entity @s[scores={__automata_tmp2=-100..100}] run scoreboard players set @s __automata_tmp2 100

execute if entity @s[scores={__automata_tmp2=..0}] run scoreboard players set @s __automata_tmp3 100
execute unless entity @s[scores={__automata_tmp2=..0}] run scoreboard players set @s __automata_tmp3 -100
scoreboard players operation @s __automata_tmp2 += @s __automata_tmp3

scoreboard players set @s __automata_tmp3 3
scoreboard players operation @s __automata_tmp2 /= @s __automata_tmp3

scoreboard players operation @s __automata_tmp += @s __automata_tmp2

## Update

execute store result entity @s Motion[2] double 0.008 run scoreboard players get @s __automata_tmp
