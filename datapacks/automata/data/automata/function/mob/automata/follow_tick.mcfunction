scoreboard players set @s __automata_tmp 0

execute unless block ^-0.5 ^ ^ air unless block ^ ^ ^0.5 air run scoreboard players set @s __automata_tmp -1
execute unless block ^0.5 ^ ^ air unless block ^ ^ ^0.5 air run scoreboard players set @s __automata_tmp 1

execute unless block ^ ^1 ^0.5 air unless block ^ ^ ^0.5 air run scoreboard players set @s __automata_tmp 1

execute store result score @s __automata_tmp2 positioned ~ ~0.5 ~ rotated ~45 0 run function automata:util/block_distance
execute store result score @s __automata_tmp3 positioned ~ ~0.5 ~ rotated ~-45 0 run function automata:util/block_distance

scoreboard players operation @s __automata_tmp2 -= @s __automata_tmp3

execute if entity @s[scores={__automata_tmp2=-3..-2}] run scoreboard players set @s __automata_tmp -2
execute if entity @s[scores={__automata_tmp2=2..3}] run scoreboard players set @s __automata_tmp 2

$execute store result score @s __automata_tmp2 run data get storage automata:mob_states $(Id).StuckTime

execute store result score @s __automata_tmp3 positioned ~ ~0.5 ~ rotated ~ -45 run function automata:util/block_distance

execute if entity @s[scores={__automata_tmp=1,__automata_tmp3=..2}] run scoreboard players add @s __automata_tmp2 5
execute if entity @s[scores={__automata_tmp=-1,__automata_tmp3=..2}] run scoreboard players add @s __automata_tmp2 5
execute if entity @s[scores={__automata_tmp=2,__automata_tmp3=..2}] run scoreboard players add @s __automata_tmp2 5
execute if entity @s[scores={__automata_tmp=-2,__automata_tmp3=..2}] run scoreboard players add @s __automata_tmp2 5

execute if entity @s[scores={__automata_tmp2=10..}] run scoreboard players set @s __automata_tmp2 10

execute if entity @s[scores={__automata_tmp2=1..}] run scoreboard players remove @s __automata_tmp2 1
$execute store result storage automata:mob_states $(Id).StuckTime int 1 run scoreboard players get @s __automata_tmp2

execute if entity @s[scores={__automata_tmp2=1..,__automata_tmp=2,__automata_tmp3=..2}] run data modify storage automata:tmp 0 set value { RotationX: -300, RotationZ: 0 }
execute if entity @s[scores={__automata_tmp2=1..,__automata_tmp=-2,__automata_tmp3=..2}] run data modify storage automata:tmp 0 set value { RotationX: 300, RotationZ: 0 }
execute if entity @s[scores={__automata_tmp2=1..,__automata_tmp=1,__automata_tmp3=..2}] run data modify storage automata:tmp 0 set value { RotationX: 300, RotationZ: 0 }
execute if entity @s[scores={__automata_tmp2=1..,__automata_tmp=-1,__automata_tmp3=..2}] run data modify storage automata:tmp 0 set value { RotationX: -300, RotationZ: 0 }
execute if entity @s[scores={__automata_tmp2=1..}] run data modify entity @s Pose.Head[1] set value 0f

execute unless entity @s[scores={__automata_tmp=0,__automata_tmp3=2..}] run function automata:util/rotate with storage automata:tmp 0

execute store result score @s __automata_tmp positioned ~ ~ ~ rotated ~ 0 run function automata:util/block_distance
$execute unless block ~ ~-0.1 ~ air if entity @s[nbt={OnGround:1b},scores={__automata_tmp=0..3,__automata_tmp3=1..}] run function automata:util/calc_motion { ParentId: $(Id), Target: '@e[nbt={Tags:["automata:mob:automata:$(Id)"]},limit=1]', X: '^', Y: '^0.85', Z: '^' }

scoreboard players set @s __automata_tmp 0
$execute if entity $(Target) run scoreboard players set @s __automata_tmp 1
$execute store result score @s __automata_tmp2 run data get storage automata:mob_states $(Id).StuckTime

$execute if entity @s[scores={__automata_tmp=1,__automata_tmp2=0}] run function automata:mob/automata/facing_to_entity { Id: $(Id), Target: '$(Target)', OffsetY: 0 }

scoreboard players set @s __automata_tmp 0
$execute if entity $(Target) run scoreboard players set @s __automata_tmp 1
$execute store result score @s __automata_tmp2 run data get storage automata:mob_states $(Id).StuckTime

$execute if entity @s[scores={__automata_tmp=1}] run function automata:util/calc_motion { ParentId: $(Id), Target: '@e[nbt={Tags:["automata:mob:automata:$(Id)"]},limit=1]', X: '^', Y: '^', Z: '^0.5' }
$execute if entity @s[scores={__automata_tmp2=1..}] run function automata:util/calc_motion { ParentId: $(Id), Target: '@e[nbt={Tags:["automata:mob:automata:$(Id)"]},limit=1]', X: '^', Y: '^', Z: '^0.5' }

#$data modify storage automata:tmp 0.X set from entity $(Target) Pos[0]
#$data modify storage automata:tmp 0.Y set from entity $(Target) Pos[1]
#$data modify storage automata:tmp 0.Z set from entity $(Target) Pos[2]
#execute store result storage automata:tmp 0.X int 1 run data get storage automata:tmp 0.X
#execute store result storage automata:tmp 0.Y int 1 run data get storage automata:tmp 0.Y
#execute store result storage automata:tmp 0.Z int 1 run data get storage automata:tmp 0.Z
 
$function automata:mob/automata/animate_2 { AnimationTime: $(AnimationTime) }

