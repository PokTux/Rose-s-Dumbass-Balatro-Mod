SMODS.Joker{ --Detailed Surface Scanner
    key = "detailedsurfacescanner",
    config = {
        extra = {
            dollars = 2
        }
    },
    loc_txt = {
        ['name'] = 'Detailed Surface Scanner',
        ['text'] = {
            [1] = 'Earn {C:money}$2{} when a',
            [2] = '{C:planet}Planet {}card is',
            [3] = 'used'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true },

    
    calculate = function(self, card, context)
        if context.using_consumeable  then
            if context.consumeable and context.consumeable.ability.set == 'Planet' then
                return {
                    dollars = card.ability.extra.dollars
                }
            end
        end
    end
}