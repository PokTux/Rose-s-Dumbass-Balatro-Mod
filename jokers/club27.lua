SMODS.Joker{ --Club 27
    key = "club27",
    config = {
        extra = {
            mup = 4,
            cup = 7,
            mu = 0,
            ch = 0
        }
    },
    loc_txt = {
        ['name'] = 'Club 27',
        ['text'] = {
            [1] = 'Gains {C:mult}+#1#{} Mult and {C:chips}+#2#{} Chips if',
            [2] = 'scored hand contains a {C:attention}9{} and a {C:attention}3{}',
            [3] = '{C:inactive}(Currently{} {C:mult}+#3# {}{C:inactive}Mult and{} {C:chips}+#4#{}{C:inactive} Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 5
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
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true, ["rosemod2_injoker"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.mup, card.ability.extra.cup, card.ability.extra.mu, card.ability.extra.ch}}
    end,

    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  then
            if ((function()
                local rankCount = 0
                for i, c in ipairs(context.scoring_hand) do
                    if c:get_id() == 9 then
                        rankCount = rankCount + 1
                    end
                end
                
                return rankCount >= 1
                end)() and (function()
                    local rankCount = 0
                    for i, c in ipairs(context.scoring_hand) do
                        if c:get_id() == 3 then
                            rankCount = rankCount + 1
                        end
                    end
                    
                    return rankCount >= 1
                    end)()) then
                        return {
                            func = function()
                                card.ability.extra.mu = (card.ability.extra.mu) + card.ability.extra.mup
                                return true
                                end,
                                extra = {
                                func = function()
                                    card.ability.extra.ch = (card.ability.extra.ch) + card.ability.extra.cup
                                    return true
                                    end,
                                    colour = G.C.GREEN
                                }
                            }
                        end
                    end
                    if context.cardarea == G.jokers and context.joker_main  then
                        return {
                            mult = card.ability.extra.mu,
                            extra = {
                            chips = card.ability.extra.ch,
                            colour = G.C.CHIPS
                        }
                    }
                end
            end
}