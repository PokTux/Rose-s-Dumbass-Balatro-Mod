SMODS.Joker{ --Modded Copy Of Terraria
    key = "moddedcopyofterraria",
    config = {
        extra = {
            m = 10,
            c = 60,
            odds = 1000,
            odds2 = 1000,
            odds3 = 1000,
            odds4 = 1000,
            odds5 = 1000,
            odds6 = 1000,
            odds7 = 1000,
            odds8 = 1000,
            odds9 = 1000,
            odds10 = 1000,
            odds11 = 1000,
            odds12 = 1000,
            rosemod2_scare = 0
        }
    },
    loc_txt = {
        ['name'] = 'Modded Copy Of Terraria',
        ['text'] = {
            [1] = '{C:chips}+#2#{} Chips {C:mult}+#1#{} Mult',
            [2] = '{C:green}#4# in #5#{} chance to',
            [3] = '{C:attention}jumpscare {}you when',
            [4] = 'performing most actions',
            [5] = '{C:inactive}(Volume warning){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_rosemod2_moddedcopyofterraria') 
        return {vars = {card.ability.extra.m, card.ability.extra.c, card.ability.extra.rosemod2_scare, new_numerator, new_denominator}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                return {
                    chips = card.ability.extra.c,
                    extra = {
                    mult = card.ability.extra.m
                }
                ,
                func = function()
                    if SMODS.pseudorandom_probability(card, 'group_0_3921eba0', 1, card.ability.extra.odds, 'j_rosemod2_moddedcopyofterraria', false) then
                        G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound("rosemod2_scare")
                            
                            return true
                            end,
                        }))
                        
                    end
                    return true
                    end
                }
            end
        end
        if context.individual and context.cardarea == G.play  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_aee9ddb7', 1, card.ability.extra.odds, 'j_rosemod2_moddedcopyofterraria', false) then
                    G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("rosemod2_scare")
                        
                        return true
                        end,
                    }))
                    
                end
            end
        end
        if context.hand_drawn  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_4bee250a', 1, card.ability.extra.odds, 'j_rosemod2_moddedcopyofterraria', false) then
                    G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("rosemod2_scare")
                        
                        return true
                        end,
                    }))
                    
                end
            end
        end
        if context.other_joker  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_3dc86673', 1, card.ability.extra.odds, 'j_rosemod2_moddedcopyofterraria', false) then
                    G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("rosemod2_scare")
                        
                        return true
                        end,
                    }))
                    
                end
            end
        end
        if context.discard  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_32d69ae5', 1, card.ability.extra.odds, 'j_rosemod2_moddedcopyofterraria', false) then
                    G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("rosemod2_scare")
                        
                        return true
                        end,
                    }))
                    
                end
            end
        end
        if context.setting_blind  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_6cdc8275', 1, card.ability.extra.odds, 'j_rosemod2_moddedcopyofterraria', false) then
                    G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("rosemod2_scare")
                        
                        return true
                        end,
                    }))
                    
                end
            end
        end
        if context.skip_blind  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_a0892af4', 1, card.ability.extra.odds, 'j_rosemod2_moddedcopyofterraria', false) then
                    G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("rosemod2_scare")
                        
                        return true
                        end,
                    }))
                    
                end
            end
        end
        if context.starting_shop  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_ac7be97a', 1, card.ability.extra.odds, 'j_rosemod2_moddedcopyofterraria', false) then
                    G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("rosemod2_scare")
                        
                        return true
                        end,
                    }))
                    
                end
            end
        end
    if context.ending_shop  then
        if true then
            if SMODS.pseudorandom_probability(card, 'group_0_5aca48ec', 1, card.ability.extra.odds, 'j_rosemod2_moddedcopyofterraria', false) then
                G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("rosemod2_scare")
                    
                    return true
                    end,
                }))
                
            end
        end
    end
    if context.reroll_shop  then
        if true then
            if SMODS.pseudorandom_probability(card, 'group_0_4095bed0', 1, card.ability.extra.odds, 'j_rosemod2_moddedcopyofterraria', false) then
                G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("rosemod2_scare")
                    
                    return true
                    end,
                }))
                
            end
        end
    end
    if context.buying_card  then
        if true then
            if SMODS.pseudorandom_probability(card, 'group_0_e9048389', 1, card.ability.extra.odds, 'j_rosemod2_moddedcopyofterraria', false) then
                G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("rosemod2_scare")
                    
                    return true
                    end,
                }))
                
            end
        end
    end
    if context.selling_card  then
        if true then
            if SMODS.pseudorandom_probability(card, 'group_0_e92ee6b6', 1, card.ability.extra.odds, 'j_rosemod2_moddedcopyofterraria', false) then
                G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("rosemod2_scare")
                    
                    return true
                    end,
                }))
                
            end
        end
    end
end
}