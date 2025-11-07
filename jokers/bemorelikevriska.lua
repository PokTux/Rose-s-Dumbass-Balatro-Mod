SMODS.Joker{ --Be More Like Vriska
    key = "bemorelikevriska",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Be More Like Vriska',
        ['text'] = {
            [1] = 'Scored {C:attention}Queens {}of any suit',
            [2] = 'and {C:attention}2{} of {C:hearts}Hearts {}become {C:attention}8{}s'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true, ["rosemod2_injoker"] = true },

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            if context.other_card:get_id() == 12 then
                assert(SMODS.change_base(context.other_card, nil, "8"))
                return {
                    message = "Card Modified!"
                    }
                elseif (context.other_card:get_id() == 2 and context.other_card:is_suit("Hearts")) then
                    assert(SMODS.change_base(context.other_card, nil, "8"))
                    return {
                        message = "Card Modified!"
                        }
                    end
                end
            end
}