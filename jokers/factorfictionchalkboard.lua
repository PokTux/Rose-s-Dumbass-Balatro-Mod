SMODS.Joker{ --Fact Or Fiction Chalkboard
    key = "factorfictionchalkboard",
    config = {
        extra = {
            mult = 30,
            blkbrd = 0,
            odds = 5,
            voice10 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Fact Or Fiction Chalkboard',
        ['text'] = {
            [1] = '{C:mult}+#1#{} Mult if all cards held in hand are {C:spades}Spades {}or {C:clubs}Clubs{}',
            [2] = '{C:green}#4#{} in {C:green}#5#{} chance to moan when a card is scored'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true, ["rosemod2_injoker"] = true },

    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_rosemod2_factorfictionchalkboard') 
        return {vars = {card.ability.extra.mult, card.ability.extra.blkbrd, card.ability.extra.voice10, new_numerator, new_denominator}}
    end,

    
    calculate = function(self, card, context)
    if context.individual and context.cardarea == G.hand and not context.end_of_round  then
        if (context.other_card:is_suit("Diamonds") or context.other_card:is_suit("Hearts")) then
            return {
                func = function()
                    card.ability.extra.blkbrd = 0
                    return true
                    end
                }
            else
                return {
                    func = function()
                        card.ability.extra.blkbrd = 1
                        return true
                        end
                    }
                end
            end
            if context.cardarea == G.jokers and context.joker_main  then
                if (card.ability.extra.blkbrd or 0) ~= 0 then
                    return {
                        mult = card.ability.extra.mult
                    }
                end
            end
            if context.individual and context.cardarea == G.play  and not context.blueprint then
                if true then
                    if SMODS.pseudorandom_probability(card, 'group_0_907da3f5', 1, card.ability.extra.odds, 'j_rosemod2_factorfictionchalkboard', false) then
                        G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound("voice10")
                            
                            return true
                            end,
                        }))
                        
                    end
                end
            end
        end
}