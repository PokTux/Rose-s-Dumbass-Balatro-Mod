SMODS.Joker{ --Soul
    key = "soul",
    config = {
        extra = {
            rosemod2_tensionhorn = 0
        }
    },
    loc_txt = {
        ['name'] = 'Soul',
        ['text'] = {
            [1] = 'Copies the abilities of',
            [2] = '{C:attention}Jokers {}in the first',
            [3] = 'three slots'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
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
        x = 2,
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

    
    calculate = function(self, card, context)
        if context.setting_blind  and not context.blueprint then
            G.E_MANAGER:add_event(Event({
            func = function()
                play_sound("rosemod2_tensionhorn")
                    SMODS.calculate_effect({message = "!"}, card)
                    return true
                    end,
                }))
            end
            
            local target_joker = nil
            
            target_joker = G.jokers.cards[1]
            if target_joker == card then
                target_joker = nil
            end
            
            local ret = SMODS.blueprint_effect(card, target_joker, context)
            if ret then
                    SMODS.calculate_effect(ret, card)
                end
                
                local target_joker = nil
                
                target_joker = G.jokers.cards[2]
                if target_joker == card then
                    target_joker = nil
                end
                
                local ret = SMODS.blueprint_effect(card, target_joker, context)
                if ret then
                        SMODS.calculate_effect(ret, card)
                    end
                    
                    local target_joker = nil
                    
                    target_joker = G.jokers.cards[3]
                    if target_joker == card then
                        target_joker = nil
                    end
                    
                    local ret = SMODS.blueprint_effect(card, target_joker, context)
                    if ret then
                            SMODS.calculate_effect(ret, card)
                        end
                    end
}