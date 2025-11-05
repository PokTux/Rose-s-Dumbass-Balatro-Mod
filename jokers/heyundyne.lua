SMODS.Joker{ --Hey Undyne
    key = "heyundyne",
    config = {
        extra = {
            HEYUNDYNEHOWMANYHUMANSOULS = 7
        }
    },
    loc_txt = {
        ['name'] = 'Hey Undyne',
        ['text'] = {
            [1] = '{X:mult,C:white}X#1#{} Mult if scored hand contains',
            [2] = 'a {C:attention}Five of a Kind{} of {C:attention}7s{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 2
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
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true, ["rosemod2_rosemod2_toby"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.HEYUNDYNEHOWMANYHUMANSOULS}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                local rankCount = 0
                for i, c in ipairs(context.scoring_hand) do
                    if c:get_id() == 7 then
                        rankCount = rankCount + 1
                    end
                end
                
                return rankCount >= 5
                end)() then
                    return {
                        Xmult = card.ability.extra.HEYUNDYNEHOWMANYHUMANSOULS
                    }
                end
            end
        end
}