SMODS.Joker{ --Triple Jokers
    key = "triplejokers",
    config = {
        extra = {
            mult = 10,
            chips = 35,
            dollars = 2
        }
    },
    loc_txt = {
        ['name'] = 'Triple Jokers',
        ['text'] = {
            [1] = '{C:mult}+10{} Mult {C:chips}+35{} Chips and Earn{C:money} $2{} if',
            [2] = 'played hand contains exactly',
            [3] = 'one {C:hearts}Heart{}, one {C:clubs}Club{}, and one {C:diamonds}Diamond{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 0
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

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if ((function()
                local suitCount = 0
                for i, c in ipairs(context.full_hand) do
                    if c:is_suit("Hearts") then
                        suitCount = suitCount + 1
                    end
                end
                
                return suitCount == 1
                end)() and (function()
                    local suitCount = 0
                    for i, c in ipairs(context.full_hand) do
                        if c:is_suit("Clubs") then
                            suitCount = suitCount + 1
                        end
                    end
                    
                    return suitCount == 1
                    end)() and (function()
                        local suitCount = 0
                        for i, c in ipairs(context.full_hand) do
                            if c:is_suit("Diamonds") then
                                suitCount = suitCount + 1
                            end
                        end
                        
                        return suitCount == 1
                        end)()) then
                            return {
                                mult = card.ability.extra.mult,
                                extra = {
                                chips = card.ability.extra.chips,
                                colour = G.C.CHIPS,
                                extra = {
                                dollars = card.ability.extra.dollars,
                                colour = G.C.MONEY
                            }
                        }
                    }
                end
            end
        end
}