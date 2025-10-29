SMODS.Joker{ --Lakon Cockpit
    key = "lakoncockpit",
    config = {
        extra = {
            xchips = 2,
            dollars = 4
        }
    },
    loc_txt = {
        ['name'] = 'Lakon Cockpit',
        ['text'] = {
            [1] = '{C:attention}Glass{} cards give {X:chips,C:white}X2{} Chips an',
            [2] = 'and {C:money}$4{} when scored but {C:red}always break{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true },

    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if SMODS.get_enhancements(context.other_card)["m_glass"] == true then
                context.other_card.should_destroy = true
                return {
                    x_chips = card.ability.extra.xchips,
                    extra = {
                    dollars = card.ability.extra.dollars,
                    colour = G.C.MONEY,
                    extra = {
                    message = "Destroyed!",
                    colour = G.C.RED
                }
            }
        }
    end
end
end
}