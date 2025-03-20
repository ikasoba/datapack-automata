$execute store result score @s __automata_tmp run data get storage automata:mob_states $(Id).HasFacingTarget
execute if entity @s[scores={__automata_tmp=49..}] run return 0

$data modify storage automata:mob_states $(Id).HasFacingTarget set value 50f

$execute as @e[nbt={Tags:["automata:model:automata:$(Id)"]},limit=1] facing $(X) $(Y) $(Z) run tp @s ~ ~-0.6 ~ ~ ~

$execute store result score @s __automata_tmp run data get entity @e[nbt={Tags:["automata:model:automata:$(Id)"]},limit=1] Rotation[0] 10
scoreboard players operation @s __automata_tmp3 = @s __automata_tmp
execute store result score @s __automata_tmp2 run data get entity @s Rotation[0] 10
scoreboard players operation @s __automata_tmp3 -= @s __automata_tmp2

execute unless data entity @s Pose.Head run data modify entity @s Pose.Head set value [0.01f, 0f, 0f]
execute store result entity @s Pose.Head[1] float 0.1 run scoreboard players get @s __automata_tmp3
execute unless entity @s[scores={__automata_tmp3=-300..300}] store result entity @s Rotation[0] float 0.1 run scoreboard players get @s __automata_tmp

$data modify entity @s Pose.Head[0] set from entity @e[nbt={Tags:["automata:model:automata:$(Id)"]},limit=1] Rotation[1]
