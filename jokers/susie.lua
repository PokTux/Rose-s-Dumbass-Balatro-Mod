SMODS.Joker{ --Susie
    key = "susie",
    config = {
        extra = {
            Xmult = 2,
            rosemod2_tensionhorn = 0
        }
    },
    loc_txt = {
        ['name'] = 'Susie',
        ['text'] = {
            [1] = 'Played {C:hearts}Hearts{} and {C:spades}Spades{} each',
            [2] = 'give {X:mult,C:white}X2{} Mult when scored'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 3
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
    pools = { ["rosemod2_rosemod2_legendary"] = true, ["rosemod2_rosemod2_toby"] = true },
    soul_pos = {
        x = 5,
        y = 3
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
            if context.individual and context.cardarea == G.play  then
                if (context.other_card:is_suit("Spades") or context.other_card:is_suit("Hearts")) then
                    return {
                        Xmult = card.ability.extra.Xmult
                    }
                end
            end
        end
}