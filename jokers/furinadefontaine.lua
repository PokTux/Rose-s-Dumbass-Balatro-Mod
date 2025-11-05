SMODS.Joker{ --Furina de Fontaine
    key = "furinadefontaine",
    config = {
        extra = {
            xmult = 3
        }
    },
    loc_txt = {
        ['name'] = 'Furina de Fontaine',
        ['text'] = {
            [1] = 'Played Knaves each give',
            [2] = '{X:mult,C:white}X#1#{} Mult when scored',
            [3] = '',
            [4] = '{C:inactive}However these days,{}',
            [5] = '{C:inactive}they\'re called{} {C:attention}Jacks{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
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
    pools = { ["rosemod2_rosemod2_legendary"] = true },
    soul_pos = {
        x = 1,
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
        
        return {vars = {card.ability.extra.xmult}}
    end,

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 11 then
                return {
                    Xmult = card.ability.extra.xmult
                }
            end
        end
    end
}