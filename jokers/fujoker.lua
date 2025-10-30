SMODS.Joker{ --Fujoker
    key = "fujoker",
    config = {
        extra = {
            m = 24
        }
    },
    loc_txt = {
        ['name'] = 'Fujoker',
        ['text'] = {
            [1] = '{C:mult}+#1#{} Mult if scored hand',
            [2] = 'contains a {C:attention}Pair {}of {C:attention}Kings{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.m}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                local rankCount = 0
                for i, c in ipairs(context.scoring_hand) do
                    if c:get_id() == 13 then
                        rankCount = rankCount + 1
                    end
                end
                
                return rankCount >= 2
                end)() then
                    return {
                        mult = card.ability.extra.m,
                        message = "YAOI!"
                    }
                end
            end
        end
}