SMODS.Joker{ --V.IV Rusty
    key = "vivrusty",
    config = {
        extra = {
            Xmult = 1.75
        }
    },
    loc_txt = {
        ['name'] = 'V.IV Rusty',
        ['text'] = {
            [1] = 'Played {C:attention}Steel Cards{} each give',
            [2] = '{X:red,C:white}X1.75{} Mult when scored'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 2
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
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true },

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_steel"] == true then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}