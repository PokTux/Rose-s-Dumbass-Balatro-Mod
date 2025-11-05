SMODS.Joker{ --Rosemary Mary
    key = "rosemarymary",
    config = {
        extra = {
            xm = 1,
            xmup = 0.75,
            repetitions = 2
        }
    },
    loc_txt = {
        ['name'] = 'Rosemary Mary',
        ['text'] = {
            [1] = 'Gains {X:mult,C:white}X#2#{} Mult if played hand',
            [2] = 'contains a {C:attention}Flush{} or a {C:attention}Full House{}',
            [3] = '{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}',
            [4] = '{C:white}.{}',
            [5] = 'Retrigger all scored cards {C:attention}2{} additional times',
            [6] = 'if played hand contains a {C:attention}Flush House{}',
            [7] = '{C:white}.{}',
            [8] = '{C:inactive,s:0.65}The obligatory Legendary Joker that represents the mod creator{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 9
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
        y = 9
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
        
        return {vars = {card.ability.extra.xm, card.ability.extra.xmup}}
    end,

    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  then
            if (next(context.poker_hands["Flush"]) or next(context.poker_hands["Full House"])) then
                return {
                    func = function()
                        card.ability.extra.xm = (card.ability.extra.xm) + card.ability.extra.xmup
                        return true
                        end
                    }
                end
            end
            if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.xm
                }
            end
            if context.repetition and context.cardarea == G.play  then
                if next(context.poker_hands["Flush House"]) then
                    return {
                        repetitions = card.ability.extra.repetitions,
                        message = localize('k_again_ex')
                    }
                end
            end
            if context.first_hand_drawn  and not context.blueprint then
                if (function()
                    for i = 1, #G.jokers.cards do
                        if G.jokers.cards[i].config.center.key == "j_rosemod2_oryx" then
                            return true
                            end
                        end
                        return false
                        end)() then
                            return {
                                message = "*sighhh*",
                                extra = {
                                message = "*swoooon* <3",
                                colour = G.C.PURPLE
                            }
                        }
                    end
                end
            end
}