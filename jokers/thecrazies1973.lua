SMODS.Joker{ --The Crazies (1973)
    key = "thecrazies1973",
    config = {
        extra = {
            handsremaining = 1
        }
    },
    loc_txt = {
        ['name'] = 'The Crazies (1973)',
        ['text'] = {
            [1] = 'Gives {X:mult,C:white}X0.5{} Mult per hands',
            [2] = 'remaining',
            [3] = '{C:inactive}(Currently {}{X:mult,C:white}X#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true, ["rosemod2_injoker"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.handsremaining + ((G.GAME.current_round.hands_left or 0)) * 0.5}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.handsremaining + (G.GAME.current_round.hands_left) * 0.5
            }
        end
    end
}