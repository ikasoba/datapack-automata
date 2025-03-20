$execute unless data storage $(Storage) $(Path) run function automata:log { Message: "$(Storage) $(Path) <- $(Value)" }
$execute unless data storage $(Storage) $(Path) run data modify storage $(Storage) $(Path) set value $(Value)
