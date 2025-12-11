
SMODS.Joker{ --LOHAC Stock Market
    key = "lohacstockmarket",
    config = {
        extra = {
            money = -3
        }
    },
    loc_txt = {
        ['name'] = 'LOHAC Stock Market',
        ['text'] = {
            [1] = 'Earn {C:money}$#1#{} at end of round. Payout',
            [2] = 'increases by {C:money}$3{} when {C:attention}Boss Blind{}',
            [3] = 'is defeated'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 10
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true, ["rosemod2_rosemod2_toby"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.money}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.money = (card.ability.extra.money) + 3
                    return true
                end
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + card.ability.extra.money
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.money), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}