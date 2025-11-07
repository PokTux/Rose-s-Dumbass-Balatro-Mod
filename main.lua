SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "balatro", 
    path = "balatro.png", 
    px = 333,
    py = 216,
    prefix_config = { key = false },
    atlas_table = "ASSET_ATLAS"
})


SMODS.Atlas({
    key = "CustomJokers", 
    path = "CustomJokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomConsumables", 
    path = "CustomConsumables.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomBoosters", 
    path = "CustomBoosters.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomEnhancements", 
    path = "CustomEnhancements.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomSeals", 
    path = "CustomSeals.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.Atlas({
    key = "CustomDecks", 
    path = "CustomDecks.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end

local jokerIndexList = {77,7,62,32,12,16,42,20,55,74,47,5,40,45,70,19,39,59,23,50,1,57,14,36,33,10,71,76,35,26,34,72,66,51,4,49,9,73,30,69,67,18,38,68,63,22,46,31,52,65,21,13,25,11,53,44,24,17,8,15,28,27,48,37,60,75,29,43,64,41,61,56,3,6,54,2,58}

local function load_jokers_folder()
    local mod_path = SMODS.current_mod.path
    local jokers_path = mod_path .. "/jokers"
    local files = NFS.getDirectoryItemsInfo(jokers_path)
    for i = 1, #jokerIndexList do
        local file_name = files[jokerIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("jokers/" .. file_name))()
        end
    end
end


local consumableIndexList = {10,1,14,4,13,2,3,12,15,8,11,9,7,6,5}

local function load_consumables_folder()
    local mod_path = SMODS.current_mod.path
    local consumables_path = mod_path .. "/consumables"
    local files = NFS.getDirectoryItemsInfo(consumables_path)
    local set_file_number = #files + 1
    for i = 1, #files do
        if files[i].name == "sets.lua" then
            assert(SMODS.load_file("consumables/sets.lua"))()
            set_file_number = i
        end
    end    
    for i = 1, #consumableIndexList do
        local j = consumableIndexList[i]
        if j >= set_file_number then 
            j = j + 1
        end
        local file_name = files[j].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("consumables/" .. file_name))()
        end
    end
end


local enhancementIndexList = {1}

local function load_enhancements_folder()
    local mod_path = SMODS.current_mod.path
    local enhancements_path = mod_path .. "/enhancements"
    local files = NFS.getDirectoryItemsInfo(enhancements_path)
    for i = 1, #enhancementIndexList do
        local file_name = files[enhancementIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("enhancements/" .. file_name))()
        end
    end
end


local sealIndexList = {1,2}

local function load_seals_folder()
    local mod_path = SMODS.current_mod.path
    local seals_path = mod_path .. "/seals"
    local files = NFS.getDirectoryItemsInfo(seals_path)
    for i = 1, #sealIndexList do
        local file_name = files[sealIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("seals/" .. file_name))()
        end
    end
end


local deckIndexList = {5,4,3,2,1}

local function load_decks_folder()
    local mod_path = SMODS.current_mod.path
    local decks_path = mod_path .. "/decks"
    local files = NFS.getDirectoryItemsInfo(decks_path)
    for i = 1, #deckIndexList do
        local file_name = files[deckIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("decks/" .. file_name))()
        end
    end
end

local function load_rarities_file()
    local mod_path = SMODS.current_mod.path
    assert(SMODS.load_file("rarities.lua"))()
end

load_rarities_file()

local function load_boosters_file()
    local mod_path = SMODS.current_mod.path
    assert(SMODS.load_file("boosters.lua"))()
end

load_boosters_file()
assert(SMODS.load_file("sounds.lua"))()
load_jokers_folder()
load_consumables_folder()
load_enhancements_folder()
load_seals_folder()
load_decks_folder()
SMODS.ObjectType({
    key = "rosemod2_food",
    cards = {
        ["j_gros_michel"] = true,
        ["j_egg"] = true,
        ["j_ice_cream"] = true,
        ["j_cavendish"] = true,
        ["j_turtle_bean"] = true,
        ["j_diet_cola"] = true,
        ["j_popcorn"] = true,
        ["j_ramen"] = true,
        ["j_selzer"] = true
    },
})

SMODS.ObjectType({
    key = "rosemod2_rosemod2_jokers",
    cards = {
        ["j_rosemod2_aigeneratedcakerecipe"] = true,
        ["j_rosemod2_arachnidjoker"] = true,
        ["j_rosemod2_asuggestion"] = true,
        ["j_rosemod2_bemorelikevriska"] = true,
        ["j_rosemod2_carpet"] = true,
        ["j_rosemod2_clownmaskedculprits"] = true,
        ["j_rosemod2_club27"] = true,
        ["j_rosemod2_clublove"] = true,
        ["j_rosemod2_crimson1"] = true,
        ["j_rosemod2_deltarunetomorrow"] = true,
        ["j_rosemod2_detailedsurfacescanner"] = true,
        ["j_rosemod2_diamondlove"] = true,
        ["j_rosemod2_difficultydependentpete"] = true,
        ["j_rosemod2_drakeclasscarrier"] = true,
        ["j_rosemod2_elgatobalatro"] = true,
        ["j_rosemod2_extrudejoker"] = true,
        ["j_rosemod2_factorfictionchalkboard"] = true,
        ["j_rosemod2_farragutclassbattlecruiser"] = true,
        ["j_rosemod2_fatasstetoplush"] = true,
        ["j_rosemod2_fatralph"] = true,
        ["j_rosemod2_forzarewind"] = true,
        ["j_rosemod2_fujoker"] = true,
        ["j_rosemod2_gummyshark"] = true,
        ["j_rosemod2_hearthianjoker"] = true,
        ["j_rosemod2_heartlove"] = true,
        ["j_rosemod2_heyundyne"] = true,
        ["j_rosemod2_himejoker"] = true,
        ["j_rosemod2_homophobicdog"] = true,
        ["j_rosemod2_imperialcutter"] = true,
        ["j_rosemod2_javelinclasscarrier"] = true,
        ["j_rosemod2_joakerofpuredark"] = true,
        ["j_rosemod2_jokaro"] = true,
        ["j_rosemod2_lakoncockpit"] = true,
        ["j_rosemod2_lucyjoker"] = true,
        ["j_rosemod2_magichat"] = true,
        ["j_rosemod2_majesticclassinterdictor"] = true,
        ["j_rosemod2_mementomori"] = true,
        ["j_rosemod2_moddedcopyofterraria"] = true,
        ["j_rosemod2_mrgreen"] = true,
        ["j_rosemod2_mustang"] = true,
        ["j_rosemod2_nomaijoker"] = true,
        ["j_rosemod2_orboffworldresourcebase"] = true,
        ["j_rosemod2_photograph"] = true,
        ["j_rosemod2_rbalatro"] = true,
        ["j_rosemod2_somnihouse"] = true,
        ["j_rosemod2_spadelove"] = true,
        ["j_rosemod2_stay"] = true,
        ["j_rosemod2_sweetbroandhellajoker"] = true,
        ["j_rosemod2_temporaljoker"] = true,
        ["j_rosemod2_thechair"] = true,
        ["j_rosemod2_thecrazies1973"] = true,
        ["j_rosemod2_thejokerisyou"] = true,
        ["j_rosemod2_thisisstupid"] = true,
        ["j_rosemod2_thisjokercandoanything"] = true,
        ["j_rosemod2_thisjokerisalreadyhere"] = true,
        ["j_rosemod2_token"] = true,
        ["j_rosemod2_triplejokers"] = true,
        ["j_rosemod2_vivrusty"] = true
    },
})

SMODS.ObjectType({
    key = "rosemod2_injoker",
    cards = {
        ["j_rosemod2_aigeneratedcakerecipe"] = true,
        ["j_rosemod2_bemorelikevriska"] = true,
        ["j_rosemod2_club27"] = true,
        ["j_rosemod2_difficultydependentpete"] = true,
        ["j_rosemod2_factorfictionchalkboard"] = true,
        ["j_rosemod2_imperialcutter"] = true,
        ["j_rosemod2_lucyjoker"] = true,
        ["j_rosemod2_orboffworldresourcebase"] = true,
        ["j_rosemod2_somnihouse"] = true,
        ["j_rosemod2_thecrazies1973"] = true
    },
})

SMODS.ObjectType({
    key = "rosemod2_rosemod2_legendary",
    cards = {
        ["j_rosemod2_aksis"] = true,
        ["j_rosemod2_anttenna"] = true,
        ["j_rosemod2_atheon"] = true,
        ["j_rosemod2_furinadefontaine"] = true,
        ["j_rosemod2_garymccready"] = true,
        ["j_rosemod2_grendel"] = true,
        ["j_rosemod2_jade"] = true,
        ["j_rosemod2_knight"] = true,
        ["j_rosemod2_lotus"] = true,
        ["j_rosemod2_mirage"] = true,
        ["j_rosemod2_oryx"] = true,
        ["j_rosemod2_ralsei"] = true,
        ["j_rosemod2_rosemarymary"] = true,
        ["j_rosemod2_sorren"] = true,
        ["j_rosemod2_soul"] = true,
        ["j_rosemod2_susie"] = true,
        ["j_rosemod2_valkyr"] = true
    },
})

SMODS.ObjectType({
    key = "rosemod2_raidboss",
    cards = {
        ["j_rosemod2_aksis"] = true,
        ["j_rosemod2_atheon"] = true,
        ["j_rosemod2_oryx"] = true
    },
})

SMODS.ObjectType({
    key = "rosemod2_fungang",
    cards = {
        ["j_rosemod2_anttenna"] = true,
        ["j_rosemod2_knight"] = true,
        ["j_rosemod2_ralsei"] = true,
        ["j_rosemod2_soul"] = true,
        ["j_rosemod2_susie"] = true
    },
})

SMODS.ObjectType({
    key = "rosemod2_rosemod2_toby",
    cards = {
        ["j_rosemod2_arachnidjoker"] = true,
        ["j_rosemod2_carpet"] = true,
        ["j_rosemod2_clublove"] = true,
        ["j_rosemod2_deltarunetomorrow"] = true,
        ["j_rosemod2_diamondlove"] = true,
        ["j_rosemod2_heartlove"] = true,
        ["j_rosemod2_heyundyne"] = true,
        ["j_rosemod2_joakerofpuredark"] = true,
        ["j_rosemod2_spadelove"] = true,
        ["j_rosemod2_temporaljoker"] = true,
        ["j_rosemod2_thejokerisyou"] = true,
        ["j_rosemod2_thisjokercandoanything"] = true,
        ["j_rosemod2_thisjokerisalreadyhere"] = true
    },
})

SMODS.ObjectType({
    key = "rosemod2_rosesmod2_jokers",
    cards = {
        ["j_rosemod2_atlasjoker"] = true
    },
})

SMODS.ObjectType({
    key = "rosemod2_tlove",
    cards = {
        ["j_rosemod2_clublove"] = true,
        ["j_rosemod2_diamondlove"] = true,
        ["j_rosemod2_heartlove"] = true,
        ["j_rosemod2_spadelove"] = true
    },
})

SMODS.ObjectType({
    key = "rosemod2_rosemod2_frame",
    cards = {
        ["j_rosemod2_grendel"] = true,
        ["j_rosemod2_jade"] = true,
        ["j_rosemod2_lotus"] = true,
        ["j_rosemod2_mirage"] = true,
        ["j_rosemod2_sorren"] = true,
        ["j_rosemod2_valkyr"] = true
    },
})

SMODS.ObjectType({
    key = "rosemod2_c_black_hole",
    cards = {
        ["j_rosemod2_nomaijoker"] = true
    },
})