SMODS.Joker{ --Domesticated Joker
    key = "domesticatedjoker",
    config = {
        extra = {
            Xmult = 0.01,
            repetitions = 1
        }
    },
    loc_txt = {
        ['name'] = 'Domesticated Joker',
        ['text'] = {
            [1] = 'Retrigger scored cards',
            [2] = 'Played {C:orange}face{} cards give',
            [3] = '{X:mult,C:white}X#1#{} Mult when scored'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true },
    

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.Xmult}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_face() == true then
                return {
                    Xmult = card.ability.extra.Xmult
                }        
            end
        end
        if context.repetition and context.cardarea == G.play  then
                return {
                    repetitions = card.ability.extra.repetitions,
                    message = localize('k_again_ex')
                }
            end
    end
}