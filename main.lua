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

local jokerIndexList = {42,3,32,15,5,7,23,9,40,38,25,2,22,24,35,8,21,30,10,27,1,29,6,19,16,4,36,41,18,11,17,37,34,28,33,26,20,31,39,14,13,12}

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


local consumableIndexList = {2,1}

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


local sealIndexList = {1}

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


local deckIndexList = {2,1}

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
        ["j_rosemod2_asuggestion"] = true,
        ["j_rosemod2_clownmaskedculprits"] = true,
        ["j_rosemod2_clublove"] = true,
        ["j_rosemod2_deltarunetomorrow"] = true,
        ["j_rosemod2_diamondlove"] = true,
        ["j_rosemod2_elgatobalatro"] = true,
        ["j_rosemod2_extrudejoker"] = true,
        ["j_rosemod2_fatasstetoplush"] = true,
        ["j_rosemod2_fujoker"] = true,
        ["j_rosemod2_heartlove"] = true,
        ["j_rosemod2_heyundyne"] = true,
        ["j_rosemod2_himejoker"] = true,
        ["j_rosemod2_homophobicdog"] = true,
        ["j_rosemod2_imperialcutter"] = true,
        ["j_rosemod2_joakerofpuredark"] = true,
        ["j_rosemod2_jokaro"] = true,
        ["j_rosemod2_lakoncockpit"] = true,
        ["j_rosemod2_magichat"] = true,
        ["j_rosemod2_mementomori"] = true,
        ["j_rosemod2_mrgreen"] = true,
        ["j_rosemod2_mustang"] = true,
        ["j_rosemod2_rbalatro"] = true,
        ["j_rosemod2_somnihouse"] = true,
        ["j_rosemod2_spadelove"] = true,
        ["j_rosemod2_temporaljoker"] = true,
        ["j_rosemod2_thisisstupid"] = true,
        ["j_rosemod2_thisjokercandoanything"] = true,
        ["j_rosemod2_thisjokerisalreadyhere"] = true,
        ["j_rosemod2_triplejokers"] = true,
        ["j_rosemod2_video"] = true,
        ["j_rosemod2_vivrusty"] = true
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
    key = "rosemod2_rosemod2_toby",
    cards = {
        ["j_rosemod2_clublove"] = true,
        ["j_rosemod2_deltarunetomorrow"] = true,
        ["j_rosemod2_diamondlove"] = true,
        ["j_rosemod2_heartlove"] = true,
        ["j_rosemod2_heyundyne"] = true,
        ["j_rosemod2_joakerofpuredark"] = true,
        ["j_rosemod2_spadelove"] = true,
        ["j_rosemod2_susie"] = true,
        ["j_rosemod2_temporaljoker"] = true,
        ["j_rosemod2_thisjokercandoanything"] = true,
        ["j_rosemod2_thisjokerisalreadyhere"] = true
    },
})

SMODS.ObjectType({
    key = "rosemod2_rosemod2_legendary",
    cards = {
        ["j_rosemod2_furinadefontaine"] = true,
        ["j_rosemod2_garymccready"] = true,
        ["j_rosemod2_grendel"] = true,
        ["j_rosemod2_jade"] = true,
        ["j_rosemod2_mirage"] = true,
        ["j_rosemod2_sorren"] = true,
        ["j_rosemod2_susie"] = true,
        ["j_rosemod2_valkyr"] = true
    },
})

SMODS.ObjectType({
    key = "rosemod2_rosemod2_frame",
    cards = {
        ["j_rosemod2_grendel"] = true,
        ["j_rosemod2_jade"] = true,
        ["j_rosemod2_mirage"] = true,
        ["j_rosemod2_sorren"] = true,
        ["j_rosemod2_valkyr"] = true
    },
})