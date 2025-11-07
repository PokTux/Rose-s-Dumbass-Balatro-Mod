SMODS.Joker{ --Nomai Joker
    key = "nomaijoker",
    config = {
        extra = {
            odds = 22,
            ante_value = -1,
            n = 0
        }
    },
    loc_txt = {
        ['name'] = 'Nomai Joker',
        ['text'] = {
            [1] = '{C:attention}-1{} Ante when {C:spectral}Black Hole{} is',
            [2] = 'used',
            [3] = '{C:inactive}(Cannot go below Ante 1){}',
            [4] = '{C:white}.{}',
            [5] = 'When a {C:planet}Planet {}card is used',
            [6] = '{C:green}#2# in #3#{} chance to create',
            [7] = 'a {C:spectral}Black Hole{}',
            [8] = '{C:inactive}(Must have room){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["c_black_hole"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"c_black_hole\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_rosemod2_nomaijoker') 
        return {vars = {card.ability.extra.n, new_numerator, new_denominator}}
    end,

    
    calculate = function(self, card, context)
        if context.using_consumeable  then
            if context.consumeable and context.consumeable.ability.set == 'Planet' then
                if SMODS.pseudorandom_probability(card, 'group_0_da00dea8', 1, card.ability.extra.odds, 'j_rosemod2_nomaijoker', false) then
                        SMODS.calculate_effect({func = function()
                            
                            for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                                G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.4,
                                func = function()
                                    play_sound('timpani')
                                    SMODS.add_card({ set = 'Spectral', key = 'c_black_hole'})                            
                                    card:juice_up(0.3, 0.5)
                                    return true
                                    end
                                }))
                            end
                            delay(0.6)
                            
                            if created_consumable then
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
                            end
                            return true
                            end}, card)
                        end
                    elseif (context.consumeable and context.consumeable.ability.set == 'Spectral' and context.consumeable.config.center.key == 'c_black_hole' and G.GAME.round_resets.ante > 1) then
                        return {
                            func = function()
                                local mod = card.ability.extra.ante_value
                                		ease_ante(mod)
                                		G.E_MANAGER:add_event(Event({
                                			func = function()
                                    				G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante + mod
                                    				return true
                                    			end,
                                		}))
                                return true
                                end,
                                message = "Ante +" .. card.ability.extra.ante_value
                            }
                        end
                    end
                end
}