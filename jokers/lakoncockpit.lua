SMODS.Joker{ --Lakon Cockpit
    key = "lakoncockpit",
    config = {
        extra = {
            xc = 2,
            mny = 4
        }
    },
    loc_txt = {
        ['name'] = 'Lakon Cockpit',
        ['text'] = {
            [1] = '{C:attention}Glass{} cards give {X:chips,C:white}X#1#{} Chips an',
            [2] = 'and {C:money}$#2#{} when scored but {C:red}always break{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_glass"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_glass\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.xc, card.ability.extra.mny}}
    end,

    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if SMODS.get_enhancements(context.other_card)["m_glass"] == true then
                context.other_card.should_destroy = true
                return {
                    x_chips = card.ability.extra.xc,
                    extra = {
                    dollars = card.ability.extra.mny,
                    colour = G.C.MONEY,
                    extra = {
                    message = "Destroyed!",
                    colour = G.C.RED
                }
            }
        }
    end
end
end
}