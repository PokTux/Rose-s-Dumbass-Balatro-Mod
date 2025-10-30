SMODS.Joker{ --Imperial Cutter
    key = "imperialcutter",
    config = {
        extra = {
            c = 792,
            odds = 5,
            start_dissolve = 0,
            y = 0
        }
    },
    loc_txt = {
        ['name'] = 'Imperial Cutter',
        ['text'] = {
            [1] = '{C:chips}+#1#{} Chips',
            [2] = '{C:green}#4# in #5# {}chance this',
            [3] = 'card is destroyed',
            [4] = 'at end of round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 2
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
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 2, card.ability.extra.odds, 'j_rosemod2_imperialcutter') 
        return {vars = {card.ability.extra.c, card.ability.extra.start_dissolve, card.ability.extra.y, new_numerator, new_denominator}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.c
            }
        end
    if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
        if true then
            if SMODS.pseudorandom_probability(card, 'group_0_2557c626', 2, card.ability.extra.odds, 'j_rosemod2_imperialcutter', false) then
                    SMODS.calculate_effect({func = function()
                        card:start_dissolve()
                        return true
                        end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "EJECT! EJECT! EJECT!", colour = G.C.RED})
                    end
                end
            end
        end
}