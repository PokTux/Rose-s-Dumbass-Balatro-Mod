SMODS.Consumable {
    key = 'hourglasstwins',
    set = 'Planet',
    pos = { x = 7, y = 1 },
    config = { extra = {
        hand_type = "Pair",
        levels = 1,
        hand_type = "Two Pair"
    } },
    loc_txt = {
        name = 'Hourglass Twins',
        text = {
            [1] = 'Level up {C:attention}Pair{}',
            [2] = 'and {C:attention}Two Pair{}'
        }
    },
    set_card_type_badge = function(self, card, badges)
            badges[1] = create_badge('Binary Planets', get_type_colour(self or card.config, card), nil, 1.2)
        end,
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',use = function(self, card, area, copier)
        local used_card = copier or card
            update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
                { handname = localize('Pair', 'poker_hands'), 
                  chips = G.GAME.hands['Pair'].chips, 
                  mult = G.GAME.hands['Pair'].mult, 
                  level = G.GAME.hands['Pair'].level })
                G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.8, 0.5)
                    G.TAROT_INTERRUPT_PULSE = true
                    return true
                end
            }))
            update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.9,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.8, 0.5)
                    return true
                end
            }))
            update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.9,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.8, 0.5)
                    G.TAROT_INTERRUPT_PULSE = nil
                    return true
                end
            }))
            update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+'..tostring(1) })
            delay(1.3)
            level_up_hand(card, "Pair", true, 1)
            update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, 
                {handname=localize('Pair', 'poker_hands'), 
                 chips = G.GAME.hands['Pair'].chips, 
                 mult = G.GAME.hands['Pair'].mult, 
                 level=G.GAME.hands['Pair'].level})    
            delay(1.3)
            update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
                { handname = localize('Two Pair', 'poker_hands'), 
                  chips = G.GAME.hands['Two Pair'].chips, 
                  mult = G.GAME.hands['Two Pair'].mult, 
                  level = G.GAME.hands['Two Pair'].level })
                G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.8, 0.5)
                    G.TAROT_INTERRUPT_PULSE = true
                    return true
                end
            }))
            update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.9,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.8, 0.5)
                    return true
                end
            }))
            update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.9,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.8, 0.5)
                    G.TAROT_INTERRUPT_PULSE = nil
                    return true
                end
            }))
            update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+'..tostring(1) })
            delay(1.3)
            level_up_hand(card, "Two Pair", true, 1)
            update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, 
                {handname=localize('Two Pair', 'poker_hands'), 
                 chips = G.GAME.hands['Two Pair'].chips, 
                 mult = G.GAME.hands['Two Pair'].mult, 
                 level=G.GAME.hands['Two Pair'].level})    
            delay(1.3)
    end,
    can_use = function(self, card)
        return true
    end
}