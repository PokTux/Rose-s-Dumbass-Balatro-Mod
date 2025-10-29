SMODS.Joker{ --r/balatro
    key = "rbalatro",
    config = {
        extra = {
            xchips = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'r/balatro',
        ['text'] = {
            [1] = '{X:chips,C:white}X1.5{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true },

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                x_chips = card.ability.extra.xchips
            }
        end
    end
}