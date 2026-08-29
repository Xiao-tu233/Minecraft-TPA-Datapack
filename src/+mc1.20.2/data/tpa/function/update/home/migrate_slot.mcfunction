# Parent function: tpa:update/home/scan
# @macro: {name: string, uid: int, id: int}

# Normalize the old slot into the new list element shape.
data modify storage tpa:tpa temp.home_migration set value {x: 0, y: 0, z: 0, dimension: "", uid: 0, id: 0}
$data modify storage tpa:tpa temp.home_migration.x set from storage tpa:tpa option.home_legacy.$(name).$(id).x
$data modify storage tpa:tpa temp.home_migration.y set from storage tpa:tpa option.home_legacy.$(name).$(id).y
$data modify storage tpa:tpa temp.home_migration.z set from storage tpa:tpa option.home_legacy.$(name).$(id).z

# Prefer the current spelling, then support the historical 2.0.3 spellings.
$execute if data storage tpa:tpa option.home_legacy.$(name).$(id).dimension run data modify storage tpa:tpa temp.home_migration.dimension set from storage tpa:tpa option.home_legacy.$(name).$(id).dimension
$execute unless data storage tpa:tpa option.home_legacy.$(name).$(id).dimension if data storage tpa:tpa option.home_legacy.$(name).$(id).dim run data modify storage tpa:tpa temp.home_migration.dimension set from storage tpa:tpa option.home_legacy.$(name).$(id).dim
$execute unless data storage tpa:tpa option.home_legacy.$(name).$(id).dimension unless data storage tpa:tpa option.home_legacy.$(name).$(id).dim if data storage tpa:tpa option.home_legacy.$(name).$(id).Dimension run data modify storage tpa:tpa temp.home_migration.dimension set from storage tpa:tpa option.home_legacy.$(name).$(id).Dimension

data modify storage tpa:tpa temp.home_migration.uid set from storage tpa:tpa temp.update_home.uid
data modify storage tpa:tpa temp.home_migration.id set from storage tpa:tpa temp.update_home.id

# An existing uid+id entry wins; otherwise append and only then remove the old slot.
$execute if data storage tpa:tpa home[{uid: $(uid), id: $(id)}] run data remove storage tpa:tpa option.home_legacy.$(name).$(id)
$execute unless data storage tpa:tpa home[{uid: $(uid), id: $(id)}] run data modify storage tpa:tpa home append from storage tpa:tpa temp.home_migration
$execute if data storage tpa:tpa home[{uid: $(uid), id: $(id)}] run data remove storage tpa:tpa option.home_legacy.$(name).$(id)

data remove storage tpa:tpa temp.home_migration
