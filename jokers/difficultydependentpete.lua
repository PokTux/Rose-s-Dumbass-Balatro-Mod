SMODS.Joker{ --Difficulty Dependent Pete
    key = "difficultydependentpete",
    config = {
        extra = {
            easy = 0.85,
            medium = 1.5,
            hard = 2.5
        }
    },
    loc_txt = {
        ['name'] = 'Difficulty Dependent Pete',
        ['text'] = {
            [1] = '{X:mult,C:white}X#1#{} Mult during {C:attention}Small Blind{}',
            [2] = '{X:mult,C:white}X#2#{} Mult during {C:attention}Big Blind{}',
            [3] = '{X:mult,C:white}X#3#{}{X:mult,C:white}{} Mult during {C:attention}Boss Blind{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true, ["rosemod2_injoker"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.easy, card.ability.extra.medium, card.ability.extra.hard}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if G.GAME.blind:get_type() == 'Small' then
                return {
                    Xmult = card.ability.extra.easy
                }
            elseif G.GAME.blind:get_type() == 'Big' then
                return {
                    Xmult = card.ability.extra.medium
                }
            elseif G.GAME.blind.boss then
                return {
                    Xmult = card.ability.extra.hard
                }
            end
        end
    end
}