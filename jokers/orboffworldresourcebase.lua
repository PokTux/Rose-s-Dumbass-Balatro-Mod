SMODS.Joker{ --O.R.B: Off-World Resource Base
    key = "orboffworldresourcebase",
    config = {
        extra = {
            currentyear = 0,
            n = 0,
            y = 0
        }
    },
    loc_txt = {
        ['name'] = 'O.R.B: Off-World Resource Base',
        ['text'] = {
            [1] = 'Create a {C:dark_edition}Negative {}{C:planet}Planet {}card at',
            [2] = 'end of round if the current',
            [3] = 'year is {C:attention}2002{}',
            [4] = '{C:white}.{}',
            [5] = '{C:inactive}(It is currently{} {C:attention}#3#{}{C:inactive}){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 5
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
    pools = { ["rosemod2_rosemod2_jokers"] = true, ["rosemod2_injoker"] = true },

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["e_negative"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"e_negative\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.n, card.ability.extra.y, os.date("*t", os.time()).year}}
    end,

    
    calculate = function(self, card, context)
    if context.end_of_round and context.game_over == false and context.main_eval  then
        if os.date("*t", os.time()).year == 2002 then
            return {
                func = function()
                    
                    for i = 1, 1 do
                        G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.4,
                        func = function()
                            if G.consumeables.config.card_limit > #G.consumeables.cards + G.GAME.consumeable_buffer then
                                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            end
                            
                            play_sound('timpani')
                            SMODS.add_card({ set = 'Planet', edition = 'e_negative', })                            
                            card:juice_up(0.3, 0.5)
                            return true
                            end
                        }))
                    end
                    delay(0.6)
                    
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_planet'), colour = G.C.SECONDARY_SET.Planet})
                    end
                    return true
                    end
                }
            end
        end
    end
}