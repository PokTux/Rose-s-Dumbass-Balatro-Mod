SMODS.Joker{ --This Joker is Already Here
    key = "thisjokerisalreadyhere",
    config = {
        extra = {
            set_probability = 1,
            set_probability2 = 2,
            numerator = 0,
            denominator = 0
        }
    },
    loc_txt = {
        ['name'] = 'This Joker is Already Here',
        ['text'] = {
            [1] = '{C:inactive}That\'s a strange question to ask someone who{}',
            [2] = '{C:inactive}is omniscient and therefore knows outcomes with{}',
            [3] = '{C:inactive}one hundred percent certainty{}',
            [4] = '{C:white}...{}',
            [5] = '{C:inactive}You have exactly a {}{C:green}fifty percent chance{}',
            [6] = '{C:white}.{}',
            [7] = '{C:inactive,s:0.8}(Changes all probabilities to {}{C:green,s:0.8}1 in 2{}{C:inactive,s:0.8}){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true, ["rosemod2_rosemod2_toby"] = true },

    
    calculate = function(self, card, context)
        if context.fix_probability and not context.blueprint then
            local numerator, denominator = context.numerator, context.denominator
            numerator = card.ability.extra.set_probability
            denominator = card.ability.extra.set_probability2
            return {
                numerator = numerator, 
                denominator = denominator
            }
        end
    end
}