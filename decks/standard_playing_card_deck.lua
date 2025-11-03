SMODS.Back {
    key = 'standard_playing_card_deck',
    pos = { x = 3, y = 0 },
    config = {
},
    loc_txt = {
        name = 'Standard Playing Card Deck',
        text = {
            [1] = 'A standard deck of 52 cards',
            [2] = 'Start with 2 {C:common}Jimbos {}and {C:money}$0{}{C:money}{}'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
     apply = function(self, back)
            G.GAME.starting_params.dollars = 0
            G.E_MANAGER:add_event(Event({
                  func = function()
                      play_sound('timpani')
                      if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                          G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                      local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_joker' })
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
                      local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_joker' })
                          G.GAME.joker_buffer = 0
                      end
                      return true
                  end
              }))
    end
}