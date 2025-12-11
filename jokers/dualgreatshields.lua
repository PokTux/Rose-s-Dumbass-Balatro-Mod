
SMODS.Joker{ --Dual Greatshields
    key = "dualgreatshields",
    config = {
        extra = {
            blind_size0 = 2,
            blind_size02 = 3
        }
    },
    loc_txt = {
        ['name'] = 'Dual Greatshields',
        ['text'] = {
            [1] = 'All {C:attention}Boss Blinds{} are {C:purple}THE WALL{}',
            [2] = 'All {C:attention}Showdown Blinds{} are {C:purple}Violet Vessel{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.setting_blind  and not context.blueprint then
            if (G.GAME.blind.boss) and ((to_big(G.GAME.round_resets.ante) ~= to_big(8) and to_big(G.GAME.round_resets.ante) ~= to_big(16) and to_big(G.GAME.round_resets.ante) ~= to_big(24) and to_big(G.GAME.round_resets.ante) ~= to_big(32))) then
                return {
                    func = function()
                        if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    G.GAME.blind:disable()
                                    play_sound('timpani')
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled'), colour = G.C.GREEN})
                        end
                        return true
                    end,
                    extra = {
                        
                        func = function()
                            if G.GAME.blind.in_blind then
                                
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "X"..tostring(2).." Blind Size", colour = G.C.GREEN})
                                G.GAME.blind.chips = G.GAME.blind.chips * 2
                                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                                G.HUD_blind:recalculate()
                                return true
                            end
                        end,
                        colour = G.C.GREEN
                    }
                }
            elseif (G.GAME.blind.boss) and ((to_big(G.GAME.round_resets.ante) == to_big(8) or to_big(G.GAME.round_resets.ante) == to_big(16) or to_big(G.GAME.round_resets.ante) == to_big(24) or to_big(G.GAME.round_resets.ante) == to_big(32))) then
                return {
                    func = function()
                        if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    G.GAME.blind:disable()
                                    play_sound('timpani')
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled'), colour = G.C.GREEN})
                        end
                        return true
                    end,
                    extra = {
                        
                        func = function()
                            if G.GAME.blind.in_blind then
                                
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "X"..tostring(3).." Blind Size", colour = G.C.GREEN})
                                G.GAME.blind.chips = G.GAME.blind.chips * 3
                                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                                G.HUD_blind:recalculate()
                                return true
                            end
                        end,
                        colour = G.C.GREEN
                    }
                }
            end
        end
    end
}