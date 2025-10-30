SMODS.Joker{ --Fatass Teto Plush
    key = "fatasstetoplush",
    config = {
        extra = {
            xm = 3.5,
            sl = 1
        }
    },
    loc_txt = {
        ['name'] = 'Fatass Teto Plush',
        ['text'] = {
            [1] = '{X:mult,C:white}X#1#{} Mult',
            [2] = '{C:dark_edition}-#2#{} Joker Slot'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 1
    },
    display_size = {
        w = 71 * 1.69, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.xm, card.ability.extra.sl}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.xm
            }
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = math.max(1, G.jokers.config.card_limit - card.ability.extra.sl)
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.sl
    end
}