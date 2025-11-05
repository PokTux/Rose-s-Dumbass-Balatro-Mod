SMODS.Joker{ --Hearthian Joker
    key = "hearthianjoker",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Hearthian Joker',
        ['text'] = {
            [1] = 'Add a random {C:attention}Wild Card{} with a {C:attention}Blue Seal{}',
            [2] = 'to your deck when any {C:attention}Booster Pack{}',
            [3] = 'is skipped'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 4
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
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_wild"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_wild\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_SEALS["Blue"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"Blue\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,

    
    calculate = function(self, card, context)
        if context.skipping_booster  then
            local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
            local new_card = create_playing_card({
            front = card_front,
            center = 
            G.P_CENTERS.m_wild
        }, G.discard, true, false, nil, true)
        new_card:set_seal("Blue", true)
        
        G.E_MANAGER:add_event(Event({
        func = function()
            new_card:start_materialize()
            G.play:emplace(new_card)
            return true
            end
        }))
        return {
            func = function()
                G.E_MANAGER:add_event(Event({
                func = function()
                    G.deck.config.card_limit = G.deck.config.card_limit + 1
                    return true
                    end
                }))
                draw_card(G.play, G.deck, 90, 'up')
                    SMODS.calculate_context({ playing_card_added = true, cards = { new_card } })
                end,
                message = "Added Card!"
            }
        end
    end
}