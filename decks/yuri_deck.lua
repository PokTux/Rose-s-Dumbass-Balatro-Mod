SMODS.Back {
    key = 'yuri_deck',
    pos = { x = 0, y = 0 },
    config = {
      joker_slots_value = 8,
},
    loc_txt = {
        name = 'Yuri Deck',
        text = {
            [1] = 'All face cards are {C:attention}Queens{}',
            [2] = 'Start with a {C:edition}Polychrome {}',
            [3] = '{C:blue}Blueprint {}and {C:money}Brainstorm{}',
            [4] = '',
            [5] = '{C:red}NO STRAIGHTS{}'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
     apply = function(self, back)
            G.E_MANAGER:add_event(Event({
                  func = function()
                      play_sound('timpani')
                      if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                          G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                      local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_rosemod2_yuri' })
                      if new_joker then
                          new_joker:add_sticker('eternal', true)
                      end
                          G.GAME.joker_buffer = 0
                      end
                      return true
                  end
              }))
            G.E_MANAGER:add_event(Event({
                  func = function()
                      play_sound('timpani')
                      if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                          G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                      local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_blueprint' })
                      if new_joker then
                          new_joker:set_edition("e_polychrome", true)
                          new_joker:add_sticker('eternal', true)
                      end
                          G.GAME.joker_buffer = 0
                      end
                      return true
                  end
              }))
            G.E_MANAGER:add_event(Event({
                  func = function()
                      play_sound('timpani')
                      if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                          G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                      local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_brainstorm' })
                      if new_joker then
                          new_joker:set_edition("e_polychrome", true)
                          new_joker:add_sticker('eternal', true)
                      end
                          G.GAME.joker_buffer = 0
                      end
                      return true
                  end
              }))
            G.E_MANAGER:add_event(Event({
                    func = function()
                    for k, v in pairs(G.playing_cards) do
                        if v:get_id() == 13 then
                        assert(SMODS.change_base(v, nil, "Queen"))
                        end                        
                    end
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                    func = function()
                    for k, v in pairs(G.playing_cards) do
                        if v:get_id() == 11 then
                        assert(SMODS.change_base(v, nil, "Queen"))
                        end                        
                    end
                    return true
                end
            }))
            G.GAME.starting_params.joker_slots = 8
    end
}