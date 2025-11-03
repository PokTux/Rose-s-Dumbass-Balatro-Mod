SMODS.Consumable {
    key = 'xg9lance',
    set = 'joker_launched_fighter',
    pos = { x = 0, y = 1 },
    config = { extra = {
        blind_size_value = 0.85,
        xchips = 1.5
    } },
    loc_txt = {
        name = 'XG9 Lance',
        text = {
        [1] = 'Reduces blind size by {C:attention}15%{}',
        [2] = '{C:white}.{}',
        [3] = '{X:chips,C:white}X1.5{} Chips while held in consumable slot'
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
                xchips = card.ability.extra.xchips,
            }
        end
    end
}