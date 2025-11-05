SMODS.Joker{ --¿%:? EXTR!UDE JOKER
    key = "extrudejoker",
    config = {
        extra = {
            rnds = 0,
            scale = 1,
            rotation = 1,
            joker_slots = 1,
            constant = 0
        }
    },
    loc_txt = {
        ['name'] = '¿%:? EXTR!UDE JOKER',
        ['text'] = {
            [1] = '{s:1.5}JOKER: JOKER{}{}{}',
            [2] = '{C:white}.{}',
            [3] = 'After {C:attention}4{} rounds, sell this card to',
            [4] = 'gain an additional {C:attention}Joker {}slot',
            [5] = '{C:inactive}(Currently{} {C:attention}#1#{}{C:inactive}/4){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.rnds}}
    end,

    
    calculate = function(self, card, context)
    if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
        if (card.ability.extra.rnds or 0) >= 4 then
            local target_card = context.other_card
            local function juice_card_until_(card, eval_func, first, delay) -- balatro function doesn't allow for custom scale and rotation
                G.E_MANAGER:add_event(Event({
                trigger = 'after',delay = delay or 0.1, blocking = false, blockable = false, timer = 'REAL',
            func = (function() if eval_func(card) then if not first or first then card:juice_up(card.ability.extra.scale, card.ability.extra.rotation) end;juice_card_until_(card, eval_func, nil, 0.8) end return true end)
            }))
        end
        return {
            func = function()
            local eval = function() return not G.RESET_JIGGLES end
                juice_card_until_(card, eval, true)
                return true
                end
            }
        else
            return {
                func = function()
                    card.ability.extra.rnds = (card.ability.extra.rnds) + 1
                    return true
                    end
                }
            end
        end
        if context.selling_self  and not context.blueprint then
            if (card.ability.extra.rnds or 0) >= 4 then
                return {
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.joker_slots).." Joker Slot", colour = G.C.DARK_EDITION})
                        G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.joker_slots
                        return true
                        end
                    }
                end
            end
        end
}