SMODS.Consumable {
    key = 'taipan',
    set = 'joker_launched_fighter',
    pos = { x = 9, y = 0 },
    config = { extra = {
        blind_size_value = 0.85,
        xmult = 1.5
    } },
    loc_txt = {
        name = 'Taipan',
        text = {
        [1] = 'Reduces blind size by {C:attention}15%{}',
        [2] = '{C:white}.{}',
        [3] = '{X:mult,C:white}X1.5{} Mult while held in consumable slot'
    }
    },
    cost = 4,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',use = function(self, card, area, copier)
        local used_card = copier or card
            G.E_MANAGER:add_event(Event({
      func = function()
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = "X"..tostring(0.85).." Blind Size", colour = G.C.GREEN})
                G.GAME.blind.chips = G.GAME.blind.chips * 0.85
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                G.HUD_blind:recalculate()
                return true
            end
                    }))
        delay(0.5)
    end,
    can_use = function(self, card)
        return true
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult,
            }
        end
    end
}