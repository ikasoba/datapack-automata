$scoreboard players set @s __automata_tmp $(AnimationTime)
scoreboard players set @s __automata_tmp2 10
scoreboard players operation @s __automata_tmp %= @s __automata_tmp2

execute if entity @s[scores={__automata_tmp=5..}] run scoreboard players remove @s __automata_tmp 10
execute if entity @s[scores={__automata_tmp=..0}] run scoreboard players set @s __automata_tmp2 -1
execute if entity @s[scores={__automata_tmp=..0}] run scoreboard players operation @s __automata_tmp *= @s __automata_tmp2

scoreboard players add @s __automata_tmp 2

execute unless data entity @s Pose.LeftArm run data modify entity @s Pose.LeftArm set value [0f, 0f, 0.01f]
data modify entity @s Pose.LeftArm[1] set value 0f
execute store result entity @s Pose.LeftArm[0] float -3 run scoreboard players get @s __automata_tmp
execute store result entity @s Pose.LeftArm[2] float -3 run scoreboard players get @s __automata_tmp

execute unless data entity @s Pose.RightArm run data modify entity @s Pose.RightArm set value [0f, 0f, 0.01f]
execute store result entity @s Pose.RightArm[0] float -12 run scoreboard players get @s __automata_tmp
execute store result entity @s Pose.RightArm[1] float 0.5 run scoreboard players get @s __automata_tmp
execute store result entity @s Pose.RightArm[2] float 1 run scoreboard players get @s __automata_tmp
