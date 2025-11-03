SMODS.Joker{ --Gary McCready
    key = "garymccready",
    config = {
        extra = {
            mult = 40,
            xmult = 4,
            chips = 40,
            xchips = 4
        }
    },
    loc_txt = {
        ['name'] = 'Gary McCready',
        ['text'] = {
            [1] = '{C:chips}+#3#{} Chips',
            [2] = '{C:mult}+#1#{} Mult',
            [3] = '{X:chips,C:white}X#4#{} Chips',
            [4] = '{X:mult,C:white}X#2#{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 5
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
    pools = { ["rosemod2_rosemod2_legendary"] = true },
    soul_pos = {
        x = 1,
        y = 5
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
        
        return {vars = {card.ability.extra.mult, card.ability.extra.xmult, card.ability.extra.chips, card.ability.extra.xchips}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.chips,
                extra = {
                mult = card.ability.extra.mult,
                extra = {
                x_chips = card.ability.extra.xchips,
                colour = G.C.DARK_EDITION,
                extra = {
                Xmult = card.ability.extra.xmult
            }
        }
    }
}
end
end
}