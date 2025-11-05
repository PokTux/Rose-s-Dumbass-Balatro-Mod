SMODS.Joker{ --Ralsei
    key = "ralsei",
    config = {
        extra = {
            polychromecardsindeck = 1,
            rosemod2_tensionhorn = 0
        }
    },
    loc_txt = {
        ['name'] = 'Ralsei',
        ['text'] = {
            [1] = 'Cards scored without an',
            [2] = '{C:attention}Edition {}become {C:dark_edition}Polychrome{}',
            [3] = 'and gain a random {C:attention}Seal{}',
            [4] = '{C:white}.{}',
            [5] = '{X:chips,C:white}X0.1{} Chips for each',
            [6] = '{C:dark_edition}Polychrome{} card in deck',
            [7] = '{C:inactive}(Currently{} {X:blue,C:white}X#2#{} {C:inactive}Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
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
    pools = { ["rosemod2_rosemod2_legendary"] = true, ["rosemod2_fungang"] = true },
    soul_pos = {
        x = 1,
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
        
        local info_queue_0 = G.P_CENTERS["e_polychrome"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"e_polychrome\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.rosemod2_tensionhorn, card.ability.extra.polychromecardsindeck + ((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.edition and card.edition.polychrome then count = count + 1 end end; return count end)()) * 0.1}}
    end,

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            if context.other_card.edition == nil then
                local random_seal = SMODS.poll_seal({mod = 10, guaranteed = true})
                if random_seal then
                    context.other_card:set_seal(random_seal, true)
                end
                context.other_card:set_edition("e_polychrome", true)
                return {
                    message = "Card Modified!"
                    }
                end
            end
            if context.setting_blind  and not context.blueprint then
                G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("rosemod2_tensionhorn")
                        SMODS.calculate_effect({message = "!"}, card)
                        return true
                        end,
                    }))
                end
                if context.cardarea == G.jokers and context.joker_main  then
                    return {
                    x_chips = card.ability.extra.polychromecardsindeck + ((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.edition and card.edition.polychrome then count = count + 1 end end; return count end)()) * 0.1
                    }
                end
            end
}