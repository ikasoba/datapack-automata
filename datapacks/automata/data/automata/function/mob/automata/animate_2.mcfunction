$scoreboard players set @s __automata_tmp $(AnimationTime)
scoreboard players set @s __automata_tmp2 30
scoreboard players operation @s __automata_tmp %= @s __automata_tmp2

execute if entity @s[scores={__automata_tmp=15..}] run scoreboard players remove @s __automata_tmp 30
execute if entity @s[scores={__automata_tmp=..0}] run scoreboard players set @s __automata_tmp2 -1
execute if entity @s[scores={__automata_tmp=..0}] run scoreboard players operation @s __automata_tmp *= @s __automata_tmp2

scoreboard players remove @s __automata_tmp 7

execute unless data entity @s Pose.LeftLeg run data modify entity @s Pose.LeftLeg set value [0f, 0f, 0.01f]
data modify entity @s Pose.LeftLeg[2] set value 0f
data modify entity @s Pose.LeftLeg[1] set value 0f
execute store result entity @s Pose.LeftLeg[0] float -12 run scoreboard players get @s __automata_tmp

execute unless data entity @s Pose.RightLeg run data modify entity @s Pose.RightLeg set value [0f, 0f, 0.01f]
data modify entity @s Pose.RightLeg[2] set value 0f
data modify entity @s Pose.RightLeg[1] set value 0f
execute store result entity @s Pose.RightLeg[0] float 12 run scoreboard players get @s __automata_tmp
