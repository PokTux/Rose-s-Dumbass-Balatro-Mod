SMODS.Joker{ --Token
    key = "token",
    config = {
        extra = {
            xm = 3,
            odds = 6,
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'Token',
        ['text'] = {
            [1] = '{X:mult,C:white}X#1#{} Mult',
            [2] = '{C:green}#3# in #4# {}chance to create {C:attention}10{}',
            [3] = 'useless {C:dark_edition}Negative {}Gummy Sharks',
            [4] = 'when {C:attention}Blind {}is selected'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["e_negative"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"e_negative\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_rosemod2_token') 
        return {vars = {card.ability.extra.xm, card.ability.extra.ignore, new_numerator, new_denominator}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.xm
            }
        end
        if context.setting_blind  and not context.blueprint then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_9b0e81ed', 1, card.ability.extra.odds, 'j_rosemod2_token', false) then
                        SMODS.calculate_effect({func = function()
                            
                            local created_joker = true
                            G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_rosemod2_gummyshark' })
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
                            end}, card)
                                SMODS.calculate_effect({func = function()
                                    
                                    local created_joker = true
                                    G.E_MANAGER:add_event(Event({
                                    func = function()
                                        local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_rosemod2_gummyshark' })
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
                                    end}, card)
                                        SMODS.calculate_effect({func = function()
                                            
                                            local created_joker = true
                                            G.E_MANAGER:add_event(Event({
                                            func = function()
                                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_rosemod2_gummyshark' })
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
                                            end}, card)
                                                SMODS.calculate_effect({func = function()
                                                    
                                                    local created_joker = true
                                                    G.E_MANAGER:add_event(Event({
                                                    func = function()
                                                        local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_rosemod2_gummyshark' })
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
                                                    end}, card)
                                                        SMODS.calculate_effect({func = function()
                                                            
                                                            local created_joker = true
                                                            G.E_MANAGER:add_event(Event({
                                                            func = function()
                                                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_rosemod2_gummyshark' })
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
                                                            end}, card)
                                                                SMODS.calculate_effect({func = function()
                                                                    
                                                                    local created_joker = true
                                                                    G.E_MANAGER:add_event(Event({
                                                                    func = function()
                                                                        local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_rosemod2_gummyshark' })
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
                                                                    end}, card)
                                                                        SMODS.calculate_effect({func = function()
                                                                            
                                                                            local created_joker = true
                                                                            G.E_MANAGER:add_event(Event({
                                                                            func = function()
                                                                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_rosemod2_gummyshark' })
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
                                                                            end}, card)
                                                                                SMODS.calculate_effect({func = function()
                                                                                    
                                                                                    local created_joker = true
                                                                                    G.E_MANAGER:add_event(Event({
                                                                                    func = function()
                                                                                        local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_rosemod2_gummyshark' })
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
                                                                                    end}, card)
                                                                                        SMODS.calculate_effect({func = function()
                                                                                            
                                                                                            local created_joker = true
                                                                                            G.E_MANAGER:add_event(Event({
                                                                                            func = function()
                                                                                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_rosemod2_gummyshark' })
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
                                                                                            end}, card)
                                                                                                SMODS.calculate_effect({func = function()
                                                                                                    
                                                                                                    local created_joker = true
                                                                                                    G.E_MANAGER:add_event(Event({
                                                                                                    func = function()
                                                                                                        local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_rosemod2_gummyshark' })
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
                                                                                                    end}, card)
                                                                                                end
                                                                                            end
                                                                                        end
                                                                                    end
}