SMODS.Joker{ --Valkyr
    key = "valkyr",
    config = {
        extra = {
            kitty = 1,
            rosemod2_valk = 0
        }
    },
    loc_txt = {
        ['name'] = 'Valkyr',
        ['text'] = {
            [1] = 'This Joker gains {X:mult,C:white}X0.07{} Mult when a',
            [2] = 'card is scored up to {X:mult,C:white}X4.5{} Mult',
            [3] = '{C:white}.{}',
            [4] = 'If possible, consumes {X:mult,C:white}X1.5{} Mult to',
            [5] = 'prevent death during a{C:attention} Boss Blind{}',
            [6] = '{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
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
        x = 3,
        y = 4
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
          or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.kitty}}
    end,

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            if (card.ability.extra.kitty or 0) >= 4.5 then
                card.ability.extra.kitty = 4.5
            else
                card.ability.extra.kitty = (card.ability.extra.kitty) + 0.07
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.kitty
            }
        end
    if context.end_of_round and context.game_over and context.main_eval  and not context.blueprint then
        if ((card.ability.extra.kitty or 0) >= 2.5 and G.GAME.blind.boss) then
            G.E_MANAGER:add_event(Event({
            func = function()
                play_sound("rosemod2_valk")
                
                return true
                end,
            }))
            return {
                saved = true,
                message = localize('k_saved_ex'),
                extra = {
                func = function()
                    card.ability.extra.kitty = math.max(0, (card.ability.extra.kitty) - 1.5)
                    return true
                    end,
                    colour = G.C.RED
                }
            }
        end
    end
end
}