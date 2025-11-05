SMODS.Joker{ --Kismesissitude
    key = "spadelove",
    config = {
        extra = {
            pmult = 0,
            pchips = 0
        }
    },
    loc_txt = {
        ['name'] = 'Kismesissitude',
        ['text'] = {
            [1] = 'Gains {C:mult}+6.12{} Mult and {C:chips}+41.3{} Chips if played hand contains a {C:attention}Pair {}',
            [2] = 'and all scored cards are {C:spades}Spades{}',
            [3] = '{C:inactive}(Currently {C:mult}+#1#{} {C:inactive}Mult and {C:chips}+#2#{}{C:inactive} Chips){}{}{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
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

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.pmult, card.ability.extra.pchips}}
    end,

    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  and not context.blueprint then
            if (next(context.poker_hands["Pair"]) and (function()
                local allMatchSuit = true
                for i, c in ipairs(context.scoring_hand) do
                    if not (c:is_suit("Spades")) then
                        allMatchSuit = false
                        break
                    end
                end
                
                return allMatchSuit and #context.scoring_hand > 0
                end)()) then
                    return {
                        func = function()
                            card.ability.extra.pmult = (card.ability.extra.pmult) + 6.12
                            return true
                            end,
                            extra = {
                            func = function()
                                card.ability.extra.pchips = (card.ability.extra.pchips) + 41.3
                                return true
                                end,
                                colour = G.C.GREEN
                            }
                        }
                    end
                end
                if context.cardarea == G.jokers and context.joker_main  then
                    return {
                        mult = card.ability.extra.pmult,
                        message = "<3<",
                        extra = {
                        chips = card.ability.extra.pchips,
                        message = "<3<",
                        colour = G.C.CHIPS
                    }
                }
            end
        end
}