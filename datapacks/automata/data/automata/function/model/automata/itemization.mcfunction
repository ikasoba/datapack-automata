data modify storage automata:tmp 0 set from entity @s HandItems[0]
$data modify storage automata:tmp 0.components.minecraft:custom_data.automata:automata_state set from storage automata:mob_states $(Id)

# Append Text Component JSON

data modify storage automata:tmp 3 set value { Dest: "storage automata:tmp 2[1]", A: '{ "italic": false, "color": "gray", "text": "名前: ', B: "" }
$execute store success score @s __automata_tmp run data modify storage automata:tmp 3.B set from storage automata:mob_states $(Id).DisplayName
execute if entity @s[scores={__automata_tmp=0}] run data modify storage automata:tmp 3.B set value "§o(無名)"

data modify storage automata:tmp 2 set value ["自動でうごく人形", ""]

function automata:util/concat_string with storage automata:tmp 3

data modify storage automata:tmp 3 set value { Dest: "storage automata:tmp 2[1]", A: "", B: '" }' }
data modify storage automata:tmp 3.A set from storage automata:tmp 2[1]

function automata:util/concat_string with storage automata:tmp 3

# Append Text Component JSON

data modify storage automata:tmp 3 set value { Dest: "storage automata:tmp 2[2]", A: '{ "italic": false, "color": "gray", "text": "色: ', B: "" }

# Map Color Id to Color Name
data modify storage automata:tmp 3.B set value { 0: "§6茶", 1: "§3青", 2: "§a緑", 3: "§e黄", 4: "§d紫" }
data modify storage automata:tmp 4 set value { Dest: "storage automata:tmp 3.B", Input: "storage automata:tmp 3.B.", Path: 0 }
$data modify storage automata:tmp 4.Path set from storage automata:mob_states $(Id).Color

function automata:util/get_nbt_from_path with storage automata:tmp 4

data modify storage automata:tmp 2 append value ""

function automata:util/concat_string with storage automata:tmp 3

data modify storage automata:tmp 3 set value { Dest: "storage automata:tmp 2[2]", A: "", B: '" }' }
data modify storage automata:tmp 3.A set from storage automata:tmp 2[2]

function automata:util/concat_string with storage automata:tmp 3

# Summon Item

data modify storage automata:tmp 1 set value { Id: "minecraft:item", X: '~', Y: '~1', Z: '~', Data: { Motion: [0d, 0.25d, 0d], Item: {} } }
data modify storage automata:tmp 1.Data.Item set from storage automata:tmp 0
data modify storage automata:tmp 1.Data.Item.components.minecraft:lore set from storage automata:tmp 2
data modify storage automata:tmp 1.Data.Item.components.minecraft:custom_data.automata:item_kind set value "entity_summon_item"

function automata:util/summon_with with storage automata:tmp 1

kill @s
