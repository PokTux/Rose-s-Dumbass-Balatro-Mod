SMODS.Joker{ --A Suggestion
    key = "asuggestion",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'A Suggestion',
        ['text'] = {
            [1] = 'Scored {C:attention}Jacks {}and {C:attention}Kings {}become {C:attention}Queens{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true },

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 13 or context.other_card:get_id() == 11) then
                assert(SMODS.change_base(context.other_card, nil, "Queen"))
                return {
                    message = "I have a suggestion"
                }
            end
        end
    end
}