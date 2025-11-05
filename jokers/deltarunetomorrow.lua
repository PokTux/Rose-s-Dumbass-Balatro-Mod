SMODS.Joker{ --Deltarune Tomorrow
    key = "deltarunetomorrow",
    config = {
        extra = {
            xm = 3.4
        }
    },
    loc_txt = {
        ['name'] = 'Deltarune Tomorrow',
        ['text'] = {
            [1] = '{X:mult,C:white}X#1#{} Mult if scored hand',
            [2] = 'contains a {C:attention}5 {}and a {C:attention}6{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
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
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true, ["rosemod2_rosemod2_toby"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.xm}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if ((function()
                local rankCount = 0
                for i, c in ipairs(context.scoring_hand) do
                    if c:get_id() == 5 then
                        rankCount = rankCount + 1
                    end
                end
                
                return rankCount >= 1
                end)() and (function()
                    local rankCount = 0
                    for i, c in ipairs(context.scoring_hand) do
                        if c:get_id() == 6 then
                            rankCount = rankCount + 1
                        end
                    end
                    
                    return rankCount >= 1
                    end)()) then
                        return {
                            Xmult = card.ability.extra.xm,
                            message = "Deltarune Today!?"
                        }
                    end
                end
            end
}