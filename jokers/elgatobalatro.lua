SMODS.Joker{ --El Gato Balatro
    key = "elgatobalatro",
    config = {
        extra = {
            cardstodiscard = 23,
            pmultvar = 0
        }
    },
    loc_txt = {
        ['name'] = 'El Gato Balatro',
        ['text'] = {
            [1] = 'This Joker gains {C:mult}+10{} Mult every {C:orange}23{} {C:inactive}[#1#]{} cards discarded',
            [2] = '{C:inactive}(Currently{} {C:mult}+#2#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 1
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
        
        return {vars = {card.ability.extra.cardstodiscard, card.ability.extra.pmultvar}}
    end,

    
    calculate = function(self, card, context)
        if context.discard  and not context.blueprint then
            if (card.ability.extra.cardstodiscard or 0) <= 1 then
                return {
                    func = function()
                        card.ability.extra.pmultvar = (card.ability.extra.pmultvar) + 10
                        return true
                        end,
                        extra = {
                        func = function()
                            card.ability.extra.cardstodiscard = 23
                            return true
                            end,
                            colour = G.C.BLUE
                        }
                    }
                else
                    return {
                        func = function()
                            card.ability.extra.cardstodiscard = math.max(0, (card.ability.extra.cardstodiscard) - 1)
                            return true
                            end
                        }
                    end
                end
                if context.cardarea == G.jokers and context.joker_main  then
                    return {
                        mult = card.ability.extra.pmultvar
                    }
                end
            end
}