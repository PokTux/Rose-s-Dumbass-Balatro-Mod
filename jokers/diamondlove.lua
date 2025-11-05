SMODS.Joker{ --Moirallegance
    key = "diamondlove",
    config = {
        extra = {
            dmnds = 0,
            lowestrankinhand = 0,
            highestrankinhand = 0
        }
    },
    loc_txt = {
        ['name'] = 'Moirallegance',
        ['text'] = {
            [1] = 'If played hand contains {C:attention}exactly two{} {C:diamonds}Diamond{} cards',
            [2] = 'adds {C:attention}double{} the rank of the {C:attention}lowest{} and {C:attention}highest',
            [3] = '{}ranked cards held in hand to Mult'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 0
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
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true, ["rosemod2_tlove"] = true, ["rosemod2_rosemod2_toby"] = true },

    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  then
            if (function()
                local suitCount = 0
                for i, c in ipairs(context.full_hand) do
                    if c:is_suit("Diamonds") then
                        suitCount = suitCount + 1
                    end
                end
                
                return suitCount == 2
                end)() then
                    return {
                        func = function()
                            card.ability.extra.dmnds = 1
                            return true
                            end
                        }
                    end
                end
                if context.cardarea == G.jokers and context.joker_main  then
                    if (card.ability.extra.dmnds or 0) == 1 then
                        return {
                        mult = ((function() local min = 14; for _, card in ipairs(G.hand and G.hand.cards or {}) do if card.base.id < min then min = card.base.id end end; return min end)()) * 2,
                            extra = {
                        mult = ((function() local max = 0; for _, card in ipairs(G.hand and G.hand.cards or {}) do if card.base.id > max then max = card.base.id end end; return max end)()) * 2,
                            message = "<>"
                        }
                    }
                end
            end
            if context.after and context.cardarea == G.jokers  then
                return {
                    func = function()
                        card.ability.extra.dmnds = 0
                        return true
                        end
                    }
                end
            end
}