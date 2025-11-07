SMODS.Joker{ --Ant Tenna
    key = "anttenna",
    config = {
        extra = {
            xm = 1,
            xmup = 0.75,
            rosemod2_tensionhorn = 0
        }
    },
    loc_txt = {
        ['name'] = 'Ant Tenna',
        ['text'] = {
            [1] = 'Gains {X:mult,C:white}X#2#{} Mult whenever',
            [2] = 'a blind is defeated',
            [3] = '{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}',
            [4] = '{C:white}.{}',
            [5] = '{C:inactive}Music by Toby Fox{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
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
        x = 6,
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
        
        return {vars = {card.ability.extra.xm, card.ability.extra.xmup}}
    end,

    
    calculate = function(self, card, context)
    if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
        return {
            func = function()
                card.ability.extra.xm = (card.ability.extra.xm) + card.ability.extra.xmup
                return true
                end,
                message = "WHAT AN AMAZING PERFORMANCE!"
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.xm
            }
        end
        if context.setting_blind  and not context.blueprint then
            G.E_MANAGER:add_event(Event({
            func = function()
                play_sound("rosemod2_tensionhorn")
                    SMODS.calculate_effect({message = "Time for another PHYSICAL CHALLENGE!!"}, card)
                        return true
                        end,
                    }))
                end
            end
}