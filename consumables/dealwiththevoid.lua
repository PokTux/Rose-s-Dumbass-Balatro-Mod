SMODS.Consumable {
    key = 'dealwiththevoid',
    set = 'Spectral',
    pos = { x = 1, y = 0 },
    config = { extra = {
        hand_size_value = 1
    } },
    loc_txt = {
        name = 'Deal With The Void',
        text = {
        [1] = 'Creates a {C:legendary}Legendary{} Warframe',
        [2] = '{C:red}-1{} hand size',
        [3] = '{C:inactive}(Must have room){}',
        [4] = '{C:white}.{}',
        [5] = '{C:inactive}Let\'s say we shake on it...{}'
    }
    },
    cost = 4,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    soul_pos = {
        x = 2,
        y = 0
    },use = function(self, card, area, copier)
        local used_card = copier or card
            G.E_MANAGER:add_event(Event({
                  trigger = 'after',
                  delay = 0.4,
                  func = function()
                      play_sound('timpani')
                      if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                          G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                      local new_joker = SMODS.add_card({ set = 'rosemod2_rosemod2_frame' })
                      if new_joker then
                      end
                          G.GAME.joker_buffer = 0
                      end
                      used_card:juice_up(0.3, 0.5)
                      return true
                  end
              }))
              delay(0.6)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "-"..tostring(1).." Hand Size", colour = G.C.RED})
                    G.hand:change_size(-1)
                    return true
                end
            }))
            delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}