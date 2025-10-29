SMODS.Joker{ --Homophobic Dog
    key = "homophobicdog",
    config = {
        extra = {
            chips = 0
        }
    },
    loc_txt = {
        ['name'] = 'Homophobic Dog',
        ['text'] = {
            [1] = 'Gains {C:chips}+30{} Chips if',
            [2] = 'played hand contains',
            [3] = 'a {C:attention}Straight{}, resets if',
            [4] = 'played hand contains a {C:attention}Pair{}',
            [5] = '{C:inactive}(Currently{} {C:chips}+#1#{} {C:inactive}Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
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

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.chips}}
    end,

    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  and not context.blueprint then
            if next(context.poker_hands["Straight"]) then
                return {
                    func = function()
                        card.ability.extra.chips = (card.ability.extra.chips) + 30
                        return true
                        end,
                        message = "Pack it up skittles squad"
                    }
                elseif next(context.poker_hands["Pair"]) then
                    return {
                        func = function()
                            card.ability.extra.chips = 0
                            return true
                            end,
                            message = "Not too fond of pairs"
                        }
                    end
                end
                if context.cardarea == G.jokers and context.joker_main  then
                    return {
                        chips = card.ability.extra.chips
                    }
                end
            end
}