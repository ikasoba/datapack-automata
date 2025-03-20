$data modify storage automata:mob_states $(Id).Role set value $(Role)

$execute store result score @s __automata_tmp run data get storage automata:mob_states $(Id).Mode

$execute if entity @s[scores={__automata_tmp=2..}] run data modify storage automata:mob_states $(Id).Mode set value 1

particle minecraft:happy_villager ~ ~1 ~ 0.35 0.35 0.35 1 10
