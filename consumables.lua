ST.category = {
Str = 1,
Agi = 2,
AP = 3,
Armor = 4,
SP = 5,
SpecSP = 6,
MP5Pot = 7,
TankFood = 8,
MeleeFood = 9,
HunterFood = 10,
CasterFood = 11,
HealerFood = 12,
SpiritAlc = 13
}

ST.categoryNameById = ST.reverseMap(ST.category)

-- TODO: choose buff package -> bessere Implementierung
-- names of possible buff packages
ST.buffPackage = {
	full = 1,
	small = 2,
}

-- choose buff package, players should have
-- demandedBuffPackage = buffPackage["full"]

local categoriesByRole = {}
categoriesByRole[ST.role["TANK"]] = {ST.category["Str"], ST.category["Agi"], ST.category["Armor"], ST.category["TankFood"]}
categoriesByRole[ST.role["DRUID"]] = {ST.category["MP5Pot"], ST.category["HealerFood"], ST.category["SpiritAlc"]}
categoriesByRole[ST.role["PRIEST"]] = {ST.category["MP5Pot"], ST.category["HealerFood"], ST.category["SpiritAlc"]}
categoriesByRole[ST.role["SHAMAN"]] = {ST.category["MP5Pot"], ST.category["HealerFood"]}
categoriesByRole[ST.role["WARRIOR"]] = {ST.category["Str"], ST.category["Agi"], ST.category["AP"], ST.category["MeleeFood"]}
categoriesByRole[ST.role["HUNTER"]] = {ST.category["Agi"], ST.category["AP"], ST.category["HunterFood"]}
categoriesByRole[ST.role["MAGE"]] = {ST.category["SP"], ST.category["SpecSP"], ST.category["CasterFood"]}

categoriesByRole[ST.role["ROGUE"]] = categoriesByRole[ST.role["WARRIOR"]]
categoriesByRole[ST.role["CAT"]] = categoriesByRole[ST.role["WARRIOR"]]
categoriesByRole[ST.role["ENHANCER"]] = categoriesByRole[ST.role["WARRIOR"]]
categoriesByRole[ST.role["WARLOCK"]] = categoriesByRole[ST.role["MAGE"]]
categoriesByRole[ST.role["SHADOW"]] = categoriesByRole[ST.role["MAGE"]]
categoriesByRole[ST.role["ELEMENTAL"]] = categoriesByRole[ST.role["MAGE"]]
categoriesByRole[ST.role["MOONKIN"]] = categoriesByRole[ST.role["MAGE"]]

ST.categoriesByRole = categoriesByRole

------------------------------------------------------------------------------
-- CREATE CONSUMABLE ID INFO

local consumableIds = {}

-- PROTECTION POTIONS
consumableIds[17543] = "GreaterFireProtectionPotion"
consumableIds[17544] = "GreaterFrostProtectionPotion"
consumableIds[17546] = "GreaterNatureProtectionPotion"
consumableIds[17548] = "GreaterShadowProtectionPotion"
consumableIds[17549] = "GreaterArcaneProtectionPotion"

consumableIds[7233] = "FireProtectionPotion"
consumableIds[7239] = "FrostProtectionPotion"
consumableIds[7242] = "ShadowProtectionPotion"
consumableIds[7254] = "NatureProtectionPotion"

-- PROTECTION JUJUS
consumableIds[16325] = "JujuChill" -- NEED TO CHECK SPELL ID
consumableIds[16326] = "JujuEmber" -- NEED TO CHECK SPELL ID

-- TANK CONSUMES
consumableIds[11348] = "ElixirOfSuperiorDefense"
consumableIds[3593] = "ElixirOfFortitudeHP120"
consumableIds[17540] = "GreaterStoneshield"
-- food
consumableIds[25661] = "ChimaerokChopsStamiFood" -- +25 Stami
consumableIds[18191] = "IncreasedStami10" -- +10
-- alc
consumableIds[22789] = "GordokGrogStami" -- +10 Stami 
consumableIds[25804] = "RumseyRum" -- +15 Stami 

-- MELEE/HUNTER CONSUMES
consumableIds[11405] = "ElixirOfTheGiants"
consumableIds[16323] = "JujuPower" -- NEED TO CHECK SPELL ID
consumableIds[11334] = "ElixirOfGreaterAgility"
consumableIds[17538] = "ElixirOfTheMongoose"
consumableIds[17038] = "WinterfallFirewater"
consumableIds[16329] = "JujuMight" -- NEED TO CHECK SPELL ID
-- food
consumableIds[18192] = "WinterCalmarAgi"
consumableIds[18125] = "BlessedSunfruitStr"
consumableIds[24799] = "SmokedDesertDumplingsStr" -- NEED TO CHECK SPELL ID

-- rage of ages 10667

-- CASTER CONSUMES
consumableIds[17539] = "GreaterArcaneElixir" -- +35 SP
consumableIds[11390] = "ArcaneElixir" -- +20 SP
consumableIds[11474] = "ElixirOfShadowPower" -- +40 SP
consumableIds[26276] = "ElixirOfGreaterFirepower" -- +40 SP
consumableIds[7844] = "ElixirOfFirepower" -- +10 SP
consumableIds[21920] = "ElixirOfFrostPower" -- +15 SP
--food
consumableIds[22730] = "RunnTumTuberIntFood" -- NEED TO CHECK SPELL ID

-- HEALER CONSUMES
consumableIds[24363] = "MagebloodPotion" -- NEED TO CHECK SPELL ID
-- food
consumableIds[18194] = "NightfinSoupManaregFood" -- NEED TO CHECK SPELL ID
consumableIds[18141] = "BlessedSunfruitJuiceSpirit"
consumableIds[19710] = "WellFedSpiritAndStami12" -- +12 Spirit+Stami NEED TO CHECK SPELL ID
consumableIds[19711] = "WellFedSpiritAndStami14" -- +14 Spirit+Stami NEED TO CHECK SPELL ID
consumableIds[24870] = "WellFedSpiritAndStami25p" -- +lvl/4 Spirit+Stami NEED TO CHECK SPELL ID
-- alc
consumableIds[22790] = "KreegsStoutSpiritAlc" -- +25 Spirit NEED TO CHECK SPELL ID

-- FLASKS
consumableIds[17626] = "FlaskOfTheTitans"
consumableIds[17627] = "FlaskOfDistilledWisdom"
consumableIds[17628] = "FlaskOfSupremePower"

ST.consumableIds = consumableIds

ST.consumableIdsByName = ST.reverseMap(consumableIds)

------------------------------------------------------------------------------
-- Set Consumable Categories for Full-Buffed Package
-- TODO: choose buff package -> bessere Implementierung
ST.consumableIdsByCategoryFull = {}
-- Str = 1,
-- Agi = 2,
-- AP = 3,
-- Armor = 4,
-- SP = 5,
-- SpecSP = 6,
-- MP5Pot = 7,
-- TankFood = 8,
-- MeleeFood = 9,
-- HunterFood = 10,
-- CasterFood = 11,
-- HealerFood = 12,
-- SpiritAlc = 13

ST.consumableIdsByCategoryFull[ST.category["Str"]] = {				-- 1
	ST.consumableIdsByName["ElixirOfTheGiants"],
	ST.consumableIdsByName["JujuPower"]
}

ST.consumableIdsByCategoryFull[ST.category["Agi"]] = {				-- 2
	ST.consumableIdsByName["ElixirOfTheMongoose"]
}

ST.consumableIdsByCategoryFull[ST.category["AP"]] = {				-- 3
	ST.consumableIdsByName["JujuMight"],
	ST.consumableIdsByName["WinterfallFirewater"]
}

ST.consumableIdsByCategoryFull[ST.category["Armor"]] = {			-- 4
	ST.consumableIdsByName["ElixirOfSuperiorDefense"]
}

ST.consumableIdsByCategoryFull[ST.category["SP"]] = {				-- 5
	ST.consumableIdsByName["GreaterArcaneElixir"],
	ST.consumableIdsByName["FlaskOfSupremePower"] -- Flask may replace SP Pot (?)
}

ST.consumableIdsByCategoryFull[ST.category["SpecSP"]] = {			-- 6
	ST.consumableIdsByName["ElixirOfGreaterFirepower"],
	ST.consumableIdsByName["ElixirOfShadowPower"],
	-- ST.consumableIdsByName["FlaskOfSupremePower"] -- Flask may replace SpecSP Pot (?)
}

ST.consumableIdsByCategoryFull[ST.category["MP5Pot"]] = {			-- 7
	ST.consumableIdsByName["MagebloodPotion"]
}

ST.consumableIdsByCategoryFull[ST.category["TankFood"]] = {		-- 8
	ST.consumableIdsByName["ChimaerokChopsStamiFood"],
	ST.consumableIdsByName["IncreasedStami10"],
	ST.consumableIdsByName["WellFedSpiritAndStami12"],
	ST.consumableIdsByName["WellFedSpiritAndStami14"],
	ST.consumableIdsByName["WellFedSpiritAndStami25p"],
	ST.consumableIdsByName["WinterCalmarAgi"],
	ST.consumableIdsByName["BlessedSunfruitStr"],
	ST.consumableIdsByName["SmokedDesertDumplingsStr"]
}

ST.consumableIdsByCategoryFull[ST.category["MeleeFood"]] = {		-- 9
	ST.consumableIdsByName["WinterCalmarAgi"],
	ST.consumableIdsByName["BlessedSunfruitStr"],
	ST.consumableIdsByName["SmokedDesertDumplingsStr"],
	ST.consumableIdsByName["ChimaerokChopsStamiFood"]
}

ST.consumableIdsByCategoryFull[ST.category["HunterFood"]] = {		-- 10
	ST.consumableIdsByName["WinterCalmarAgi"],
	ST.consumableIdsByName["NightfinSoupManaregFood"],
	ST.consumableIdsByName["RunnTumTuberIntFood"]
}

ST.consumableIdsByCategoryFull[ST.category["CasterFood"]] = {		-- 11
	ST.consumableIdsByName["NightfinSoupManaregFood"],
	ST.consumableIdsByName["RunnTumTuberIntFood"]
}

ST.consumableIdsByCategoryFull[ST.category["HealerFood"]] = {		-- 12
	ST.consumableIdsByName["NightfinSoupManaregFood"],
	ST.consumableIdsByName["RunnTumTuberIntFood"],
	ST.consumableIdsByName["WellFedSpiritAndStami12"],
	ST.consumableIdsByName["WellFedSpiritAndStami14"],
	ST.consumableIdsByName["WellFedSpiritAndStami25p"]
}

ST.consumableIdsByCategoryFull[ST.category["SpiritAlc"]] = {		-- 13
	ST.consumableIdsByName["KreegsStoutSpiritAlc"]
}

------------------------------------------------------------------------------
-- Set Consumable Categories for Small Package

ST.consumableIdsByCategorySmall = {}

ST.consumableIdsByCategorySmall[ST.category["Str"]] = {		-- 1
	ST.consumableIdsByName["ElixirOfTheGiants"],
	ST.consumableIdsByName["JujuPower"]
}

ST.consumableIdsByCategorySmall[ST.category["Agi"]] = {		-- 2
	ST.consumableIdsByName["ElixirOfTheMongoose"],
	ST.consumableIdsByName["ElixirOfGreaterAgility"]
}

ST.consumableIdsByCategorySmall[ST.category["AP"]] = {		-- 3
	nil
}

ST.consumableIdsByCategorySmall[ST.category["Armor"]] = {		-- 4
	ST.consumableIdsByName["ElixirOfSuperiorDefense"]
}

ST.consumableIdsByCategorySmall[ST.category["SP"]] = {		-- 5
	ST.consumableIdsByName["GreaterArcaneElixir"],
	ST.consumableIdsByName["ArcaneElixir"],
	ST.consumableIdsByName["FlaskOfSupremePower"] -- Flask may replace SP Pot (?)
}

ST.consumableIdsByCategorySmall[ST.category["SpecSP"]] = {		-- 6
	ST.consumableIdsByName["ElixirOfGreaterFirepower"],
	ST.consumableIdsByName["ElixirOfFirepower"],
	ST.consumableIdsByName["ElixirOfShadowPower"]
}

ST.consumableIdsByCategorySmall[ST.category["MP5Pot"]] = {		-- 7
	ST.consumableIdsByName["MagebloodPotion"]
}

ST.consumableIdsByCategorySmall[ST.category["TankFood"]] = {		-- 8
	ST.consumableIdsByName["ChimaerokChopsStamiFood"],
	ST.consumableIdsByName["IncreasedStami10"],
	ST.consumableIdsByName["WellFedSpiritAndStami12"],
	ST.consumableIdsByName["WellFedSpiritAndStami14"],
	ST.consumableIdsByName["WellFedSpiritAndStami25p"],
	ST.consumableIdsByName["WinterCalmarAgi"],
	ST.consumableIdsByName["BlessedSunfruitStr"],
	ST.consumableIdsByName["SmokedDesertDumplingsStr"]
}

ST.consumableIdsByCategorySmall[ST.category["MeleeFood"]] = {		-- 9
	ST.consumableIdsByName["ChimaerokChopsStamiFood"],
	ST.consumableIdsByName["WinterCalmarAgi"],
	ST.consumableIdsByName["BlessedSunfruitStr"],
	ST.consumableIdsByName["SmokedDesertDumplingsStr"]
}

ST.consumableIdsByCategorySmall[ST.category["HunterFood"]] = {		-- 10
	ST.consumableIdsByName["WinterCalmarAgi"],
	ST.consumableIdsByName["NightfinSoupManaregFood"],
	ST.consumableIdsByName["RunnTumTuberIntFood"]
}

ST.consumableIdsByCategorySmall[ST.category["CasterFood"]] = {		-- 11
	ST.consumableIdsByName["NightfinSoupManaregFood"],
	ST.consumableIdsByName["RunnTumTuberIntFood"]
}

ST.consumableIdsByCategorySmall[ST.category["HealerFood"]] = {		-- 12
	ST.consumableIdsByName["NightfinSoupManaregFood"],
	ST.consumableIdsByName["RunnTumTuberIntFood"],
	ST.consumableIdsByName["WellFedSpiritAndStami12"],
	ST.consumableIdsByName["WellFedSpiritAndStami14"],
	ST.consumableIdsByName["WellFedSpiritAndStami25p"]
}

ST.consumableIdsByCategorySmall[ST.category["SpiritAlc"]] = {		-- 13
	-- ST.consumableIdsByName["KreegsStoutSpiritAlc"]
}
