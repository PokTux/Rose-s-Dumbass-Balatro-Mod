
SMODS.Joker{ --Havel Joker
    key = "haveljoker",
    config = {
        extra = {
            minusslots = 1,
            handsize = 3
        }
    },
    loc_txt = {
        ['name'] = 'Havel\'s Joker',
        ['text'] = {
            [1] = '{C:red}-#1#{} consumable slot',
            [2] = '{C:attention}+#2#{} hand size'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.minusslots, card.ability.extra.handsize}}
    end,
    
    calculate = function(self, card, context)
    end,
    
    add_to_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({func = function()
            G.consumeables.config.card_limit = math.max(0, G.consumeables.config.card_limit - card.ability.extra.minusslots)
            return true
        end }))
        G.hand:change_size(card.ability.extra.handsize)
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({func = function()
            G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.minusslots
            return true
        end }))
        G.hand:change_size(-card.ability.extra.handsize)
    end
}