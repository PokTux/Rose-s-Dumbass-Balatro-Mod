SMODS.Consumable {
    key = 'quantummoon',
    set = 'Planet',
    pos = { x = 3, y = 1 },
    config = { extra = {
        hand_type = "Five of a Kind",
        levels = 1,
        hand_type = "Flush House",
        hand_type = "Flush Five"
    } },
    loc_txt = {
        name = 'Quantum Moon',
        text = {
        [1] = 'Level up all secret',
        [2] = '{C:purple}poker hands {}'
    }
    },
    set_card_type_badge = function(self, card, badges)
            badges[1] = create_badge('Moon?', get_type_colour(self or card.config, card), nil, 1.2)
        end,
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',use = function(self, card, area, copier)
        local used_card = copier or card
            update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
                { handname = localize('Five of a Kind', 'poker_hands'), 
                  chips = G.GAME.hands['Five of a Kind'].chips, 
                  mult = G.GAME.hands['Five of a Kind'].mult, 
                  level = G.GAME.hands['Five of a Kind'].level })
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
            level_up_hand(card, "Five of a Kind", true, 1)
            update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, 
                {handname=localize('Five of a Kind', 'poker_hands'), 
                 chips = G.GAME.hands['Five of a Kind'].chips, 
                 mult = G.GAME.hands['Five of a Kind'].mult, 
                 level=G.GAME.hands['Five of a Kind'].level})    
            delay(1.3)
            update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
                { handname = localize('Flush House', 'poker_hands'), 
                  chips = G.GAME.hands['Flush House'].chips, 
                  mult = G.GAME.hands['Flush House'].mult, 
                  level = G.GAME.hands['Flush House'].level })
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
            level_up_hand(card, "Flush House", true, 1)
            update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, 
                {handname=localize('Flush House', 'poker_hands'), 
                 chips = G.GAME.hands['Flush House'].chips, 
                 mult = G.GAME.hands['Flush House'].mult, 
                 level=G.GAME.hands['Flush House'].level})    
            delay(1.3)
            update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
                { handname = localize('Flush Five', 'poker_hands'), 
                  chips = G.GAME.hands['Flush Five'].chips, 
                  mult = G.GAME.hands['Flush Five'].mult, 
                  level = G.GAME.hands['Flush Five'].level })
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
            level_up_hand(card, "Flush Five", true, 1)
            update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, 
                {handname=localize('Flush Five', 'poker_hands'), 
                 chips = G.GAME.hands['Flush Five'].chips, 
                 mult = G.GAME.hands['Flush Five'].mult, 
                 level=G.GAME.hands['Flush Five'].level})    
            delay(1.3)
    end,
    can_use = function(self, card)
        return true
    end
}