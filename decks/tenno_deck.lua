SMODS.Back {
    key = 'tenno_deck',
    pos = { x = 1, y = 0 },
    config = {
      joker_slots_value = 1,
},
    loc_txt = {
        name = 'Tenno Deck',
        text = {
            [1] = 'Start with {C:spectral}Deal With The Void{}',
            [2] = '{C:dark_edition}-1{} Joker Slot'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
     apply = function(self, back)
            for i = 1, 1 do
            G.E_MANAGER:add_event(Event({
            func = function()
  
            play_sound('timpani')
            SMODS.add_card({ set = 'Spectral', key = 'c_rosemod2_dealwiththevoid'
             })
            return true
        end
        }))
    end
            G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots - 1
    end
}