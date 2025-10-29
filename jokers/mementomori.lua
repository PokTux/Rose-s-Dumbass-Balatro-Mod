SMODS.Joker{ --Memento Mori
    key = "mementomori",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Memento Mori',
        ['text'] = {
            [1] = 'On{C:attention} final hand{} of round, add a {C:attention}Lucky{} card to your hand'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true },

    
    calculate = function(self, card, context)
        if context.hand_drawn  then
            if G.GAME.current_round.hands_left == 1 then
                return {
                    func = function()
                        local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                        local new_card = create_playing_card({
                        front = card_front,
                        center = 
                        G.P_CENTERS.m_lucky
                    }, G.discard, true, false, nil, true)
                    
                    G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                    new_card.playing_card = G.playing_card
                    table.insert(G.playing_cards, new_card)
                    
                    G.E_MANAGER:add_event(Event({
                    func = function()
                        G.hand:emplace(new_card)
                        new_card:start_materialize()
                            SMODS.calculate_context({ playing_card_added = true, cards = { new_card } })
                            return true
                            end
                        }))
                    end,
                    message = "Added Card to Hand!"
                }
            end
        end
    end
}