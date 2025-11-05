SMODS.Joker{ --Two of Bounies
    key = "lucyjoker",
    config = {
        extra = {
            xm = 2.5
        }
    },
    loc_txt = {
        ['name'] = 'Two of Bounies',
        ['text'] = {
            [1] = 'First played {C:attention}2{} of {C:hearts}Hearts {}gives',
            [2] = '{X:mult,C:white}X#1#{} Mult when scored'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true, ["rosemod2_injoker"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.xm}}
    end,

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 2 and context.other_card:is_suit("Hearts")) then
                return {
                    Xmult = card.ability.extra.xm
                }
            end
        end
    end
}