SMODS.Consumable {
    key = 'orbitoclast',
    set = 'Tarot',
    pos = { x = 1, y = 1 },
    loc_txt = {
        name = 'Orbitoclast',
        text = {
        [1] = 'Apply a {C:green}Normal Icon{} to {C:attention}1{}',
        [2] = 'selected card'
    }
    },

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_SEALS["rosemod2_normalicon"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("hey dumbass did you put the wrong info queue in?")
        end
        return {vars = {}}
    end,

    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',use = function(self, card, area, copier)
        local used_card = copier or card
        if #G.hand.highlighted == 1 then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            for i = 1, #G.hand.highlighted do
                local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('card1', percent)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            delay(0.2)
            for i = 1, #G.hand.highlighted do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        G.hand.highlighted[i]:set_seal("rosemod2_normalicon", nil, true)
                        return true
                    end
                }))
            end
            for i = 1, #G.hand.highlighted do
                local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('tarot2', percent, 0.6)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    G.hand:unhighlight_all()
                    return true
                end
            }))
            delay(0.5)
            G.E_MANAGER:add_event(Event({
     func = function()
    play_sound("rosemod2_firehole")
    
    return true
    end,
}))
        end
    end,
    can_use = function(self, card)
        return (#G.hand.highlighted == 1)
    end
}