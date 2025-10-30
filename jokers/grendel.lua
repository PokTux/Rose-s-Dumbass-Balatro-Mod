SMODS.Joker{ --Grendel
    key = "grendel",
    config = {
        extra = {
            cardsvored = 1,
            rosemod2_eat = 0
        }
    },
    loc_txt = {
        ['name'] = 'Grendel',
        ['text'] = {
            [1] = '{C:attention}Discarding{} cards while this Joker is',
            [2] = 'selected will cause them to be {C:red}consumed {}',
            [3] = 'and this Joker will gain {X:mult,C:white}X0.1{} Mult',
            [4] = '{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
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
    pools = { ["rosemod2_rosemod2_legendary"] = true, ["rosemod2_rosemod2_frame"] = true },
    soul_pos = {
        x = 5,
        y = 5
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
        
        return {vars = {card.ability.extra.cardsvored}}
    end,

    
    calculate = function(self, card, context)
        if context.discard  and not context.blueprint then
            if #G.jokers.highlighted == 1 then
                return {
                    remove = true,
                    message = "Consumed!",
                    extra = {
                    func = function()
                        card.ability.extra.cardsvored = (card.ability.extra.cardsvored) + 0.1
                        return true
                        end,
                        colour = G.C.GREEN
                    }
                }
            end
        end
        if context.pre_discard  and not context.blueprint then
            if #G.jokers.highlighted == 1 then
                G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("rosemod2_eat")
                    
                    return true
                    end,
                }))
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.cardsvored
            }
        end
    end
}