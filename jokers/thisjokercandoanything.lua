SMODS.Joker{ --This Joker Can Do Anything!
    key = "thisjokercandoanything",
    config = {
        extra = {
            c = 40,
            m = 10,
            x = 1.5,
            s = 2,
            h = 1,
            rosemod2_jevil = 0
        }
    },
    loc_txt = {
        ['name'] = 'This Joker Can Do Anything!',
        ['text'] = {
            [1] = '{C:chips}+#1#{} Chips',
            [2] = '{C:mult}+#2#{} Mult',
            [3] = '{X:mult,C:white}X#3#{} Mult',
            [4] = 'Earn {C:money}$#4#{}',
            [5] = '{C:attention}+#5#{} hand size'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 2
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
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true, ["rosemod2_rosemod2_toby"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.c, card.ability.extra.m, card.ability.extra.x, card.ability.extra.s, card.ability.extra.h}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            G.E_MANAGER:add_event(Event({
            func = function()
                play_sound("rosemod2_jevil")
                    SMODS.calculate_effect({message = "Chaos! Chaos!"}, card)
                    return true
                    end,
                }))
                return {
                    chips = card.ability.extra.c,
                    extra = {
                    mult = card.ability.extra.m,
                    extra = {
                    Xmult = card.ability.extra.x,
                    extra = {
                    dollars = card.ability.extra.s,
                    colour = G.C.MONEY
                }
            }
        }
    }
end
end,

    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.h)
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.h)
    end
}