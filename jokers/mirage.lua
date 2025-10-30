SMODS.Joker{ --Mirage
    key = "mirage",
    config = {
        extra = {
            repetitions = 4
        }
    },
    loc_txt = {
        ['name'] = 'Mirage',
        ['text'] = {
            [1] = 'Retrigger each scored card',
            [2] = '{C:attention}four {}additional times if',
            [3] = 'played {C:attention}poker hand{} has',
            [4] = 'already been played this round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
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
        x = 7,
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
        if context.repetition and context.cardarea == G.play  then
            if G.GAME.hands[context.scoring_name] and G.GAME.hands[context.scoring_name].played_this_round > 1 then
                return {
                    repetitions = card.ability.extra.repetitions,
                    message = localize('k_again_ex')
                }
            end
        end
    end
}