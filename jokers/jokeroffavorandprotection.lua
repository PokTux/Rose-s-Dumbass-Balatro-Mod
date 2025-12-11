
SMODS.Joker{ --Joker of Favor and Protection
    key = "jokeroffavorandprotection",
    config = {
        extra = {
            hands = 1,
            handsize = 2,
            xmult = 1.2,
            no = 0,
            start_dissolve = 0
        }
    },
    loc_txt = {
        ['name'] = 'Joker of Favor and Protection',
        ['text'] = {
            [1] = '{C:blue}+#1#{} Hands',
            [2] = '{C:attention}+#2#{} hand size',
            [3] = '{X:mult,C:white}X#3#{} Mult',
            [4] = 'This card is destroyed',
            [5] = 'when any card is sold'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.hands, card.ability.extra.handsize, card.ability.extra.xmult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.xmult
            }
        end
        if context.selling_card  and not context.blueprint then
            return {
                func = function()
                    local target_joker = card
                    
                    if target_joker then
                        target_joker.getting_sliced = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                return true
                            end
                        }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                    end
                    return true
                end
            }
        end
    end,
    
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.handsize)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.handsize)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hands
    end
}