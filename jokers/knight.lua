SMODS.Joker{ --Roaring Knight
    key = "knight",
    config = {
        extra = {
            perish = 0,
            perishable = 0,
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'Roaring Knight',
        ['text'] = {
            [1] = 'Create a random {C:attention}Perishable {}{C:dark_edition}Negative {}{C:legendary}Legendary{} Joker',
            [2] = 'Once the new Joker perishes create another',
            [3] = '{C:white}.{}',
            [4] = '{C:inactive}Always bet on Perkeo Knight{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 7
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
        x = 0,
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
        
        local info_queue_0 = G.P_CENTERS["e_negative"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"e_negative\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,

    
    calculate = function(self, card, context)
    if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
        return {
            func = function()
                card.ability.extra.perish = math.max(0, (card.ability.extra.perish) - 1)
                return true
                end
            }
        end
        if context.setting_blind  and not context.blueprint then
            if (card.ability.extra.perish or 0) <= 0 then
                return {
                    func = function()
                        
                        local created_joker = true
                        G.E_MANAGER:add_event(Event({
                        func = function()
                        local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'Legendary' })
                        if joker_card then
                            joker_card:set_edition("e_negative", true)
                            joker_card:add_sticker('perishable', true)
                        end
                        
                        return true
                        end
                    }))
                    
                    if created_joker then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                    end
                    return true
                    end,
                    extra = {
                    func = function()
                        card.ability.extra.perish = 5
                        return true
                        end,
                        colour = G.C.BLUE
                    }
                }
            end
        end
    end
}