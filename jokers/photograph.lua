SMODS.Joker{ --Video
    key = "photograph",
    config = {
        extra = {
            xm = 2
        }
    },
    loc_txt = {
        ['name'] = 'Video',
        ['text'] = {
            [1] = 'First played {C:orange}numbered{} card',
            [2] = 'gives {X:mult,C:white}X#1#{} Mult when scored'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 0
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
    pools = { ["rosemod2_rosemod2_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.xm}}
    end,

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if ((function()
                for i = 1, #context.scoring_hand do
                    local scoring_card = context.scoring_hand[i]
                    if (scoring_card:get_id() == 2 or scoring_card:get_id() == 4 or scoring_card:get_id() == 6 or scoring_card:get_id() == 8 or scoring_card:get_id() == 10) then
                        return scoring_card == context.other_card
                        end
                    end
                    return false
                    end)() or (function()
                        for i = 1, #context.scoring_hand do
                            local scoring_card = context.scoring_hand[i]
                            if (scoring_card:get_id() == 14 or scoring_card:get_id() == 3 or scoring_card:get_id() == 5 or scoring_card:get_id() == 7 or scoring_card:get_id() == 9) then
                                return scoring_card == context.other_card
                                end
                            end
                            return false
                            end)()) then
                                return {
                                    Xmult = card.ability.extra.xm
                                }
                            end
                        end
                    end
}