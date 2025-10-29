SMODS.Joker{ --Matespritship
    key = "heartlove",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Matespritship',
        ['text'] = {
            [1] = 'If played hand contains a {C:attention}Pair {}',
            [2] = 'and all scored cards are {C:hearts}Hearts{}',
            [3] = 'add a random {C:attention}playing card{} with a',
            [4] = 'random {C:dark_edition}Edition{} and {C:attention}Seal{}',
            [5] = 'to your {C:attention}hand{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true, ["rosemod2_tlove"] = true, ["rosemod2_rosemod2_toby"] = true },

    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  then
            if (next(context.poker_hands["Pair"]) and (function()
                local allMatchSuit = true
                for i, c in ipairs(context.scoring_hand) do
                    if not (c:is_suit("Hearts")) then
                        allMatchSuit = false
                        break
                    end
                end
                
                return allMatchSuit and #context.scoring_hand > 0
                end)()) then
                    return {
                        func = function()
                            local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                            local new_card = create_playing_card({
                            front = card_front,
                            center = 
                            G.P_CENTERS.c_base
                        }, G.discard, true, false, nil, true)
                        new_card:set_seal(pseudorandom_element({'Gold','Red','Blue','Purple','rosemod2_hatseal'}, pseudoseed('add_card_hand_seal')), true)
                        new_card:set_edition(pseudorandom_element({'e_foil','e_holo','e_polychrome','e_negative'}, pseudoseed('add_card_hand_edition')), true)
                        
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
                        message = "<3"
                    }
                end
            end
        end
}