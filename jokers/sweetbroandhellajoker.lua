SMODS.Joker{ --Sweet Bro And Hella Joker
    key = "sweetbroandhellajoker",
    config = {
        extra = {
            chips = 0,
            chup = 5,
            leftmostcardrank = 0,
            highestrankinhand = 0,
            rightmostcardrank = 0,
            lowestrankinhand = 0
        }
    },
    loc_txt = {
        ['name'] = 'Sweet Bro And Hella Joker',
        ['text'] = {
            [1] = 'Gains {C:chips}+#2#{} chips when hand is played',
            [2] = 'if {C:attention}Highest {}Ranked card held in hand',
            [3] = 'is in the {C:attention}leftmost {}position and',
            [4] = '{C:attention}Lowest {}Ranked card held in hand',
            [5] = 'is in the {C:attention}rightmost {}position',
            [6] = '{C:inactive}(Currently{} {C:chips}+#1#{} {C:inactive}Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
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
    pools = { ["rosemod2_rosemod2_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.chips, card.ability.extra.chup}}
    end,

    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  and not context.blueprint then
        if ((G.hand and G.hand.cards[1] and G.hand.cards[1].base.id or 0) == (function() local max = 0; for _, card in ipairs(G.hand and G.hand.cards or {}) do if card.base.id > max then max = card.base.id end end; return max end)() and (G.hand and G.hand.cards[#G.hand.cards] and G.hand.cards[#G.hand.cards].base.id or 0) == (function() local min = 14; for _, card in ipairs(G.hand and G.hand.cards or {}) do if card.base.id < min then min = card.base.id end end; return min end)()) then
            return {
                func = function()
                    card.ability.extra.chips = (card.ability.extra.chips) + card.ability.extra.chup
                    return true
                    end
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.chup
            }
        end
    end
}