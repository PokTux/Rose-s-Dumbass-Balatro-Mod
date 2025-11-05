SMODS.Joker{ --Forza Rewind
    key = "forzarewind",
    config = {
        extra = {
            n = 0,
            start_dissolve = 0,
            y = 0
        }
    },
    loc_txt = {
        ['name'] = 'Forza Rewind',
        ['text'] = {
            [1] = 'When a {C:attention}Wheel of Fortune{} fails',
            [2] = 'create a{C:attention} Wheel of Fortune{}',
            [3] = '{C:inactive}(Must have room){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["c_wheel_of_fortune"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"c_wheel_of_fortune\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,

    
    calculate = function(self, card, context)
        if context.pseudorandom_result  then
            if (context.identifier == "wheel_of_fortune" and not context.result) then
                return {
                    func = function()
                        
                        for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                            G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.4,
                            func = function()
                                play_sound('timpani')
                                SMODS.add_card({ set = 'Tarot', key = 'c_wheel_of_fortune'})                            
                                card:juice_up(0.3, 0.5)
                                return true
                                end
                            }))
                        end
                        delay(0.6)
                        
                        if created_consumable then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
                        end
                        return true
                        end
                    }
                end
            end
            if context.setting_blind  and not context.blueprint then
                if (function()
                    for i = 1, #G.jokers.cards do
                        if G.jokers.cards[i].config.center.key == "j_rosemod2_crimson1" then
                            return true
                            end
                        end
                        return false
                        end)() then
                            return {
                                func = function()
                                    card:start_dissolve()
                                    return true
                                    end,
                                    message = "Nuh Uh"
                                }
                            end
                        end
                    end
}