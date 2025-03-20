execute if entity @s[nbt={Item: {components: {"minecraft:custom_data": {"automata:automata_state": null}}}}] run function automata:do_summon_first {}
execute if entity @s[nbt={Item: {components: {"minecraft:custom_data": {"automata:automata_state": {}}}}}] run function automata:do_summon_again with entity @s Item.components.minecraft:custom_data.automata:automata_state
kill @s
