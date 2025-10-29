SMODS.Joker{ --This Joker Can Do Anything!
    key = "thisjokercandoanything",
    config = {
        extra = {
            chips = 60,
            mult = 20,
            Xmult = 1.5,
            dollars = 2,
            rosemod2_jevil = 0
        }
    },
    loc_txt = {
        ['name'] = 'This Joker Can Do Anything!',
        ['text'] = {
            [1] = '{C:chips}+60{} Chips',
            [2] = '{C:mult}+20{} Mult',
            [3] = '{X:mult,C:white}X1.5{} Mult',
            [4] = 'Earn {C:money}$2{}',
            [5] = '{C:attention}+1{} hand size'
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
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true, ["rosemod2_rosemod2_toby"] = true },

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            G.E_MANAGER:add_event(Event({
            func = function()
                play_sound("rosemod2_jevil")
                
                return true
                end,
            }))
            return {
                chips = card.ability.extra.chips,
                extra = {
                mult = card.ability.extra.mult,
                extra = {
                Xmult = card.ability.extra.Xmult,
                extra = {
                dollars = card.ability.extra.dollars,
                colour = G.C.MONEY
            }
        }
    }
}
end
end,

    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(1)
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-1)
    end
}