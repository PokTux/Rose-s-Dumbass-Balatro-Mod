SMODS.Joker{ --Mr. Green
    key = "mrgreen",
    config = {
        extra = {
            mny = 7,
            odds = 4,
            dollars = 0,
            start_dissolve = 0,
            n = 0
        }
    },
    loc_txt = {
        ['name'] = 'Mr. Green',
        ['text'] = {
            [1] = 'Earn {C:money}$#1#{} at end of round',
            [2] = '{C:green}#4# in #5#{} chance to set money to',
            [3] = '{C:money}$0{} and {C:red}self destruct{} at end of round',
            [4] = '{C:white}.{}',
            [5] = '{C:inactive}Art from{} {C:green}Mr. Green\'s Big Break{} {C:inactive}thumbnail{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 1
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
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_rosemod2_mrgreen') 
        return {vars = {card.ability.extra.mny, card.ability.extra.n, card.ability.extra.start_dissolve, new_numerator, new_denominator}}
    end,

    
    calculate = function(self, card, context)
    if context.end_of_round and context.game_over == false and context.main_eval  then
        if true then
            if SMODS.pseudorandom_probability(card, 'group_0_247ee83a', 1, card.ability.extra.odds, 'j_rosemod2_mrgreen', false) then
                    SMODS.calculate_effect({func = function()
                        local target_amount = card.ability.extra.dollars
                        local current_amount = G.GAME.dollars
                        local difference = target_amount - current_amount
                            ease_dollars(difference)
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Set to $"..tostring(card.ability.extra.dollars), colour = G.C.MONEY})
                                return true
                                end}, card)
                                    SMODS.calculate_effect({func = function()
                                        card:start_dissolve()
                                        return true
                                        end}, card)
                                    end
                                else
                                    return {
                                        dollars = card.ability.extra.mny
                                    }
                                end
                            end
                        end
}