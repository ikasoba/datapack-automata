$execute unless entity @e[nbt={Tags:["automata:model:automata:$(Id)"]},distance=..256,limit=1] run function automata:mob/automata/die { Id: $(Id) }

#$scoreboard players set @s __automata_tmp $(Mode)
#$execute if entity @s[scores={__automata_tmp=0..1}] if entity @p[distance=..3.5,limit=1] run function automata:mob/automata/facing_to_entity { Id: $(Id), Target: "@p[distance=..3.5,limit=1]", OffsetY: 8 }
#
#$scoreboard players set @s __automata_tmp $(Mode)
#$execute if entity @s[scores={__automata_tmp=0..1}] unless entity @p[distance=..5,limit=1] if entity @e[type=!minecraft:player,type=!minecraft:marker,nbt=!{Tags:["automata:mob"]},nbt=!{Tags:["automata:model"]},distance=..5,sort=nearest,limit=1] run function automata:mob/automata/facing_to_entity { Id: $(Id), Target: '@e[type=!minecraft:marker,nbt=!{Tags:["automata:mob"]},nbt=!{Tags:["automata:model"]},distance=..5,sort=nearest,limit=1]', OffsetY: 0 }

$scoreboard players set @s __automata_tmp $(Mode)
$execute if entity @s[scores={__automata_tmp=1}] if entity @p[distance=3.5..] run function automata:mob/automata/follow_tick { Id: $(Id), Target: "@p[distance=3.5..,limit=1]", Ratio: 1, AnimationTime: $(AnimationTime) }

#$scoreboard players set @s __automata_tmp $(Mode)
#$execute if entity @s[scores={__automata_tmp=1}] if entity @p run function automata:mob/automata/facing_to_entity { Id: $(Id), Target: "@p[limit=1]", OffsetY: 8 }

$function automata:mob/automata/animate_$(AnimationKind) { Id: $(Id), AnimationTime: $(AnimationTime) }

$function automata:mob/automata/roles/$(Role)/tick with storage automata:mob_states $(Id)

$function automata:mob/automata/collision_tick { Id: $(Id), AnimationTime: $(AnimationTime) }

$scoreboard players set @s __automata_tmp $(AnimationTime)
scoreboard players add @s __automata_tmp 1
$execute store result storage automata:mob_states $(Id).AnimationTime int 1 run scoreboard players get @s __automata_tmp

$execute store result score @s __automata_tmp run data get storage automata:mob_states $(Id).HasFacingTarget
execute if entity @s[scores={__automata_tmp=0}] store result entity @s Pose.Head[0] float 0.75 run data get entity @s Pose.Head[0]

$execute store result storage automata:mob_states $(Id).HasFacingTarget float 0.9 run data get storage automata:mob_states $(Id).HasFacingTarget

