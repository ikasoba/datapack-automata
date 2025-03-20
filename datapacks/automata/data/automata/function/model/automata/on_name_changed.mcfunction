data modify storage automata:tmp 0 set value { Storage: "automata:tmp", Path: 1 }
data modify storage automata:tmp 0.Json set from entity @s CustomName
function automata:util/set_storage_from_json_string with storage automata:tmp 0

execute if data entity @s CustomName run data modify entity @s CustomNameVisible set value 1b

$data modify storage automata:tmp 0 set value { Color: $(Color) }
data modify storage automata:tmp 0.DisplayName set from storage automata:tmp 1
$data modify storage automata:mob_states $(Id).DisplayName set from storage automata:tmp 1
function automata:model/automata/set_name with storage automata:tmp 0
