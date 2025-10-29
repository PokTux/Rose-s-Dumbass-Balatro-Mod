SMODS.Joker{ --Sorren
    key = "sorren",
    config = {
        extra = {
            blind_size = 5,
            rosemod2_stalk = 0,
            n = 0
        }
    },
    loc_txt = {
        ['name'] = 'Sorren',
        ['text'] = {
            [1] = 'Reduces blind size by {C:attention}80%{}',
            [2] = '',
            [3] = '{C:inactive,s:0.75}(Might do something special if his lover is present){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 4
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
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_legendary"] = true, ["rosemod2_rosemod2_frame"] = true },
    soul_pos = {
        x = 1,
        y = 4
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
        if context.setting_blind  then
            if (function()
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i].config.center.key == "j_rosemod2_jade" then
                        return true
                        end
                    end
                    return false
                    end)() then
                        return {
                            func = function()
                                
                                for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                                    G.E_MANAGER:add_event(Event({
                                    trigger = 'after',
                                    delay = 0.4,
                                    func = function()
                                        play_sound('timpani')
                                        SMODS.add_card({ set = 'Tarot', key = 'c_lovers'})                            
                                        card:juice_up(0.3, 0.5)
                                        return true
                                        end
                                    }))
                                end
                                delay(0.6)
                                
                                if created_consumable then
                                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
                                end
                                return true
                                end
                            }
                        else
                            G.E_MANAGER:add_event(Event({
                            func = function()
                                play_sound("rosemod2_stalk")
                                
                                return true
                                end,
                            }))
                            return {
                                func = function()
                                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "It is done...", colour = G.C.GREEN})
                                        G.GAME.blind.chips = G.GAME.blind.chips / card.ability.extra.blind_size
                                        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                                            G.HUD_blind:recalculate()
                                            return true
                                            end
                                        }
                                    end
                                end
                            end
}