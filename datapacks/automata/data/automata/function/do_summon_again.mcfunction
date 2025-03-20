function automata:log { Message: "オートマタの復元中" }

# Load
data modify storage automata:tmp 0 set from entity @s Item.components.minecraft:custom_data.automata:automata_state

## initialize id
#execute store result storage automata:tmp 0.Id int 1 run data get storage automata:global_state Id
#
## append id to global_state living_automatas
#data modify storage automata:global_state living_automatas append from storage automata:tmp 0.Id
#
## increment global_state id
#execute store result score @e[nbt={Tags:["automata:dummy4score"]}] __automata_tmp run data get storage automata:global_state Id
#scoreboard players add @e[nbt={Tags:["automata:dummy4score"]}] __automata_tmp 1
#execute store result storage automata:global_state Id int 1 run scoreboard players get @e[nbt={Tags:["automata:dummy4score"]},limit=1] __automata_tmp

# do summon
function automata:summon_automata with storage automata:tmp 0

function automata:log { Message: "オートマタの復元完了" }
