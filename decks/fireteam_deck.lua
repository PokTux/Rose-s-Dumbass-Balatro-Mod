SMODS.Back {
    key = 'fireteam_deck',
    pos = { x = 4, y = 0 },
    config = {
      hand_size_value = 6,
},
    loc_txt = {
        name = 'Fireteam Deck',
        text = {
            [1] = 'Start with a {C:legendary}Legnedary{}',
            [2] = '{C:attention}Raid Boss{} Joker',
            [3] = 'Hand size is set to {C:attention}6{}'
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
                      local new_joker = SMODS.add_card({ set = 'rosemod2_raidboss' })
                          G.GAME.joker_buffer = 0
                      end
                      return true
                  end
              }))
            G.GAME.starting_params.hand_size = 6
    end
}