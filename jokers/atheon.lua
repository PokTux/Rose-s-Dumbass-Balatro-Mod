SMODS.Joker{ --Atheon
    key = "atheon",
    config = {
        extra = {
            glassbroke = 0,
            set_probability = 0,
            repetitions = 2,
            numerator = 0
        }
    },
    loc_txt = {
        ['name'] = 'Atheon',
        ['text'] = {
            [1] = 'Add {C:attention}2{} random {C:attention}Glass{} cards with',
            [2] = 'random {C:dark_edition}Editions{} to hand at the',
            [3] = 'start of each round',
            [4] = '{C:white}.{}',
            [5] = 'Retrigger scored {C:attention}Glass{} cards {C:attention}2{}',
            [6] = 'additional times',
            [7] = '{C:white}.{}',
            [8] = '{C:attention}Glass {}cards never break'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_legendary"] = true, ["rosemod2_raidboss"] = true },
    soul_pos = {
        x = 5,
        y = 8
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' and args.source ~= 'buf' 
          or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_glass"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_glass\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,

    
    calculate = function(self, card, context)
        if context.first_hand_drawn  then
            return {
                func = function()
                    local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                    local new_card = create_playing_card({
                    front = card_front,
                    center = 
                    G.P_CENTERS.m_glass
                }, G.discard, true, false, nil, true)
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
                message = "Atheon opens the timestreams",
                extra = {
                func = function()
                    local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                    local new_card = create_playing_card({
                    front = card_front,
                    center = 
                    G.P_CENTERS.m_glass
                }, G.discard, true, false, nil, true)
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
                message = "Atheon opens the timestreams",
                colour = G.C.GREEN
            }
        }
    end
    if context.fix_probability  then
        local numerator, denominator = context.numerator, context.denominator
        if context.identifier == "glass" then
            numerator = card.ability.extra.set_probability
        end
        return {
            numerator = numerator, 
            denominator = denominator
        }
    end
    if context.repetition and context.cardarea == G.play  then
        if SMODS.get_enhancements(context.other_card)["m_glass"] == true then
            return {
                repetitions = card.ability.extra.repetitions,
                message = localize('k_again_ex')
            }
        end
    end
end
}