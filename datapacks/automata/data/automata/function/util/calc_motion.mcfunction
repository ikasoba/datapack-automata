$execute unless entity @e[nbt={Tags:["automata:calc_motion_marker:$(ParentId)"]},limit=1] run summon minecraft:marker $(X) $(Y) $(Z) { Tags: ["automata:calc_motion_marker", "automata:calc_motion_marker:$(ParentId)"], data: { Y: '$(Y)', Target: '$(Target)' } }

