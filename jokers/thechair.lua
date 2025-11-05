SMODS.Joker{ --The Chair
    key = "thechair",
    config = {
        extra = {
            chips = 15
        }
    },
    loc_txt = {
        ['name'] = 'The Chair',
        ['text'] = {
            [1] = '{C:chips}+#1#{} Chips whenever',
            [2] = 'another Joker is triggered'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.chips}}
    end,

    
    calculate = function(self, card, context)
        if context.other_joker  then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}