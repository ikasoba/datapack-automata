$scoreboard players set @s __automata_tmp $(Mode)

$execute unless entity @s[scores={__automata_tmp=2}] if entity @e[distance=..8,type=minecraft:zombie,limit=1,sort=nearest] run data modify storage automata:mob_states $(Id).PreviousMode set value $(Mode)
$execute unless entity @s[scores={__automata_tmp=2}] if entity @e[distance=..8,type=minecraft:zombie,limit=1,sort=nearest] run data modify storage automata:mob_states $(Id).Mode set value 2
$execute unless entity @s[scores={__automata_tmp=2}] if entity @e[distance=..8,type=minecraft:zombie,limit=1,sort=nearest] run data modify storage automata:mob_states $(Id).AttackCooldown set value 0f
$execute if entity @s[scores={__automata_tmp=2}] unless entity @e[distance=..8,type=minecraft:zombie,limit=1,sort=nearest] run data modify storage automata:mob_states $(Id).AnimationKind set value 0
$execute if entity @s[scores={__automata_tmp=2}] unless entity @e[distance=..8,type=minecraft:zombie,limit=1,sort=nearest] run data modify storage automata:mob_states $(Id).Mode set from storage automata:mob_states $(Id).PreviousMode

$execute store result score @s __automata_tmp2 run data get storage automata:mob_states $(Id).AttackCooldown
$execute if entity @s[scores={__automata_tmp2=..0,__automata_tmp=2}] unless entity @e[distance=..2.5,type=minecraft:zombie,limit=1,sort=nearest] run data modify storage automata:mob_states $(Id).AnimationKind set value 0
$execute if entity @s[scores={__automata_tmp2=0,__automata_tmp=2}] if entity @e[distance=..2.5,type=minecraft:zombie,limit=1,sort=nearest] run data modify storage automata:mob_states $(Id).AnimationKind set value 3

execute if entity @s[scores={__automata_tmp2=0,__automata_tmp=2},nbt={OnGround: 1b}] if entity @e[distance=..4,type=minecraft:zombie,limit=1,sort=nearest] run data modify entity @s Motion[1] set value 0.25d
execute if entity @s[scores={__automata_tmp2=0,__automata_tmp=2}] run damage @e[distance=..2.5,type=minecraft:zombie,limit=1,sort=nearest] 1 minecraft:mob_attack at ~ ~ ~
$execute if entity @s[scores={__automata_tmp2=0,__automata_tmp=2}] if entity @e[distance=..2.5,type=minecraft:zombie,limit=1,sort=nearest] run data modify storage automata:mob_states $(Id).AttackCooldown set value 10f
$execute if entity @s[scores={__automata_tmp2=1..,__automata_tmp=2}] store result storage automata:mob_states $(Id).AttackCooldown float 0.75 run data get storage automata:mob_states $(Id).AttackCooldown
$execute if entity @s[scores={__automata_tmp2=1..,__automata_tmp=2}] if entity @e[distance=..8,type=minecraft:zombie,limit=1,sort=nearest] run function automata:mob/automata/follow_tick { Id: $(Id), Target: "@e[distance=..8,type=minecraft:zombie,limit=1,sort=nearest]", Ratio: -1, AnimationTime: $(AnimationTime) }
$execute if entity @s[scores={__automata_tmp2=0,__automata_tmp=2}] if entity @e[distance=1.5..16,type=minecraft:zombie,limit=1,sort=nearest] run function automata:mob/automata/follow_tick { Id: $(Id), Target: "@e[distance=1.5..16,type=minecraft:zombie,limit=1,sort=nearest]", Ratio: 1, AnimationTime: $(AnimationTime) }
