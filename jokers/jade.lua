SMODS.Joker{ --Jade
    key = "jade",
    config = {
        extra = {
            respect = 0,
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'Jade',
        ['text'] = {
            [1] = 'Create a {C:dark_edition}Polychrome {}{C:rare}Rare{} Joker when',
            [2] = '{C:attention}Small Blind{} or {C:attention}Big Blind{} is selected',
            [3] = '{C:inactive}(Must have room){}',
            [4] = 'Create a {C:dark_edition}Negative {}{C:rare}Rare{} Joker',
            [5] = 'when {C:attention}Boss Blind{} is selected',
            [6] = '',
            [7] = '',
            [8] = '{C:inactive,s:0.75}(Might do something special if her lover is present){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 6
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
    pools = { ["rosemod2_rosemod2_legendary"] = true, ["rosemod2_rosemod2_frame"] = true },
    soul_pos = {
        x = 8,
        y = 6
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
        local info_queue_1 = G.P_CENTERS["e_negative"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"e_negative\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,

    
    calculate = function(self, card, context)
        if context.setting_blind  then
            if (G.GAME.blind:get_type() == 'Small' or G.GAME.blind:get_type() == 'Big') then
                return {
                    func = function()
                        
                        local created_joker = false
                        if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                            created_joker = true
                            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                            G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'Rare' })
                                if joker_card then
                                    joker_card:set_edition("e_polychrome", true)
                                    
                                end
                                G.GAME.joker_buffer = 0
                                return true
                                end
                            }))
                        end
                        if created_joker then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                        end
                        return true
                        end
                    }
                elseif G.GAME.blind.boss then
                    return {
                        func = function()
                            
                            local created_joker = true
                            G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'Rare' })
                                if joker_card then
                                    joker_card:set_edition("e_negative", true)
                                    
                                end
                                
                                return true
                                end
                            }))
                            
                            if created_joker then
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                            end
                            return true
                            end
                        }
                    end
                end
            end
}