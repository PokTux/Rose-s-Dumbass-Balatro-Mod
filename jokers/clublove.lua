SMODS.Joker{ --Auspisticism
    key = "clublove",
    config = {
        extra = {
            at3c = 0,
            rt = 2
        }
    },
    loc_txt = {
        ['name'] = 'Auspisticism',
        ['text'] = {
            [1] = 'If played hand contains {C:attention}exactly three{} {C:clubs}Club{} cards',
            [2] = 'retrigger the {C:attention}first {}and {C:attention}last {}scored cards {C:attention}#2#{}',
            [3] = 'additional times'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true, ["rosemod2_tlove"] = true, ["rosemod2_rosemod2_toby"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.at3c, card.ability.extra.rt}}
    end,

    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  then
            if (function()
                local suitCount = 0
                for i, c in ipairs(context.full_hand) do
                    if c:is_suit("Clubs") then
                        suitCount = suitCount + 1
                    end
                end
                
                return suitCount == 3
                end)() then
                    return {
                        func = function()
                            card.ability.extra.at3c = 1
                            return true
                            end
                        }
                    end
                end
                if context.repetition and context.cardarea == G.play  then
                    if ((context.other_card == context.scoring_hand[1] or context.other_card == context.scoring_hand[#context.scoring_hand]) and (card.ability.extra.at3c or 0) == 1) then
                        return {
                            repetitions = card.ability.extra.rt,
                            message = "c8<"
                        }
                    end
                end
                if context.after and context.cardarea == G.jokers  then
                    return {
                        func = function()
                            card.ability.extra.at3c = 0
                            return true
                            end
                        }
                    end
                end
}