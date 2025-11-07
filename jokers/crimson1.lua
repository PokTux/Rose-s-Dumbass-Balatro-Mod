SMODS.Joker{ --Crimson 1
    key = "crimson1",
    config = {
        extra = {
            rage = 0,
            blindchiprequirement = 0,
            xchips = 1000000,
            Xmult = 1000000
        }
    },
    loc_txt = {
        ['name'] = 'Crimson 1',
        ['text'] = {
            [1] = 'Gain a point of {C:red}Rage{} whenever any of the following occur:',
            [2] = '{C:white}.{}',
            [3] = '{C:attention}Glass Card{} is destroyed',
            [4] = '{C:attention}Boss Blind{} ability is triggered',
            [5] = 'Round ends with {C:blue}0{} hands and {C:red}0{} discards remaining',
            [6] = '{C:tarot}The Wheel of Fortune{} fails',
            [7] = '{C:white}.{}',
            [8] = 'When a hand is played at 10 points of {C:red}Rage{} score an',
            [9] = '{C:attention}absurd amount{} of Chips and Mult and reset {C:red}Rage{}',
            [10] = '{C:inactive}(Currently {}{C:attention}#1#{}{C:inactive}/10){}',
            [11] = '{C:white}.{}',
            [12] = '{C:inactive}Art by Prismic{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.rage}}
    end,

    
    calculate = function(self, card, context)
        if context.pseudorandom_result  and not context.blueprint then
            if (context.identifier == "wheel_of_fortune" and not context.result) then
                return {
                    func = function()
                        card.ability.extra.rage = (card.ability.extra.rage) + 1
                        return true
                        end
                    }
                elseif (context.identifier == "glass" and context.result) then
                    return {
                        func = function()
                            card.ability.extra.rage = (card.ability.extra.rage) + 1
                            return true
                            end
                        }
                    end
                end
                if context.cardarea == G.jokers and context.joker_main  and not context.blueprint then
                    if G.GAME.blind.triggered then
                        card.ability.extra.rage = (card.ability.extra.rage) + 1
                    elseif (card.ability.extra.rage or 0) >= 10 then
                        card.ability.extra.rage = 0
                        return {
                            chips = (G.GAME.blind.chips) * 10,
                            extra = {
                            x_chips = card.ability.extra.xchips,
                            colour = G.C.DARK_EDITION,
                            extra = {
                            mult = (G.GAME.blind.chips) * 10,
                            extra = {
                            Xmult = card.ability.extra.Xmult
                        }
                    }
                }
            }
        end
    end
if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
    if (G.GAME.current_round.hands_left <= 0 and G.GAME.current_round.discards_left <= 0) then
        return {
            func = function()
                card.ability.extra.rage = (card.ability.extra.rage) + 1
                return true
                end
            }
        end
    end
end
}