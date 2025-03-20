function automata:util/set_default_storage { Storage: "automata:global_state", Path: "Id", Value: 0 }
scoreboard objectives add __automata_tmp dummy
scoreboard objectives add __automata_tmp2 dummy
scoreboard objectives add __automata_tmp3 dummy
scoreboard objectives add __automata_id dummy

execute unless entity @e[nbt={Tags:["automata:dummy4score"]}] run function automata:log { Message: "summon dummy entity for score." }
execute unless entity @e[nbt={Tags:["automata:dummy4score"]}] run summon minecraft:armor_stand 0 0 0 { NoAI: 1b, Silent: 1b, NoGravity: 1b, Invisible: 1b, Invulnerable: 1b, PersistenceRequired: 1b, Tags: ["automata:dummy4score"] }

function automata:log { Message: "Initialized." }
