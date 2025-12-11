
SMODS.Joker{ --Deathbed Companion
    key = "deathbedcompanion",
    config = {
        extra = {
            xmult = 0.9,
            hands = 2,
            round = 0
        }
    },
    loc_txt = {
        ['name'] = 'Deathbed Companion',
        ['text'] = {
            [1] = '{X:mult,C:white}X#1#{} Mult',
            [2] = 'Sell this card to gain',
            [3] = '{C:blue}+#2#{} Hands for the current',
            [4] = 'round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.xmult, card.ability.extra.hands}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.xmult
            }
        end
        if context.selling_self  and not context.blueprint then
            return {
                
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.hands).." Hands", colour = G.C.GREEN})
                    
                    G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + card.ability.extra.hands
                    return true
                end
            }
        end
    end
}