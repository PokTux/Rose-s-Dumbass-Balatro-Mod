SMODS.Back {
    key = 'surveydeck',
    pos = { x = 2, y = 0 },
    config = {
      hands_value = 1,
        add_starting_cards_count = 4,
        add_starting_cards_count = 1,
        add_starting_cards_count = 2,
},
    loc_txt = {
        name = 'SURVEY_DECK',
        text = {
            [1] = 'Start with {C:spectral}Vessel{}',
            [2] = 'and 7 extra {C:attention}Aces{}',
            [3] = '{C:blue}-1{} hand every round'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
     apply = function(self, back)
            G.GAME.starting_params.hands = G.GAME.starting_params.hands - 1
            G.E_MANAGER:add_event(Event({
            func = function()
            for i = 1, 1 do
  
            play_sound('timpani')
            SMODS.add_card({ set = 'Spectral', area = G.consumeables, key = 'c_rosemod2_vessel'
             })
        end
        return true
        end
        }))
            G.E_MANAGER:add_event(Event({
                delay = 0.3,
                func = function()
                    local cards = {}
                    for i = 1, 4 do
                        local _rank = 'Ace'
                        local _suit = 'Diamonds'
                        local new_card_params = { set = "Base", area = G.deck }
                        if _rank then new_card_params.rank = _rank end
                        if _suit then new_card_params.suit = _suit end
                        cards[i] = SMODS.add_card(new_card_params)
                    end
                    SMODS.calculate_context({ playing_card_added = true, cards = cards })
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                delay = 0.3,
                func = function()
                    local cards = {}
                    for i = 1, 1 do
                        local _rank = 'Ace'
                        local _suit = 'Hearts'
                        local new_card_params = { set = "Base", area = G.deck }
                        if _rank then new_card_params.rank = _rank end
                        if _suit then new_card_params.suit = _suit end
                        cards[i] = SMODS.add_card(new_card_params)
                    end
                    SMODS.calculate_context({ playing_card_added = true, cards = cards })
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                delay = 0.3,
                func = function()
                    local cards = {}
                    for i = 1, 2 do
                        local _rank = 'Ace'
                        local _suit = 'Clubs'
                        local new_card_params = { set = "Base", area = G.deck }
                        if _rank then new_card_params.rank = _rank end
                        if _suit then new_card_params.suit = _suit end
                        cards[i] = SMODS.add_card(new_card_params)
                    end
                    SMODS.calculate_context({ playing_card_added = true, cards = cards })
                    return true
                end
            }))
    end
}