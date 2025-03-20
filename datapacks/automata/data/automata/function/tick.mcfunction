function automata:summon_dispatcher {}

execute as @e[nbt={Tags:["automata:calc_motion_marker"]}] at @s run function automata:mob/calc_motion/tick with entity @s data
execute as @e[nbt={Tags:["automata:move_to"]}] at @s run function automata:mob/move_to/tick with entity @s ArmorItems[3].components.minecraft:custom_data
