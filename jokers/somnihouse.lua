SMODS.Joker{ --Somni House
    key = "somnihouse",
    config = {
        extra = {
            dreaming = 0,
            repetitions = 1,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Somni House',
        ['text'] = {
            [1] = 'If scored cards contain three {C:attention}Jacks{}',
            [2] = 'and two {C:attention}Queens {}retrigger all scored',
            [3] = 'cards once',
            [4] = '{C:inactive}(this idea came to me in a dream){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 1
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

    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  then
            if ((function()
                local rankCount = 0
                for i, c in ipairs(context.scoring_hand) do
                    if c:get_id() == 11 then
                        rankCount = rankCount + 1
                    end
                end
                
                return rankCount >= 3
                end)() and (function()
                    local rankCount = 0
                    for i, c in ipairs(context.scoring_hand) do
                        if c:get_id() == 12 then
                            rankCount = rankCount + 1
                        end
                    end
                    
                    return rankCount >= 2
                    end)()) then
                        return {
                            func = function()
                                card.ability.extra.dreaming = 1
                                return true
                                end
                            }
                        end
                    end
                    if context.repetition and context.cardarea == G.play  then
                        if (card.ability.extra.var1 or 0) == 1 then
                            return {
                                repetitions = card.ability.extra.repetitions,
                                message = localize('k_again_ex')
                            }
                        end
                    end
                    if context.after and context.cardarea == G.jokers  then
                        return {
                            func = function()
                                card.ability.extra.dreaming = 0
                                return true
                                end
                            }
                        end
                    end
}