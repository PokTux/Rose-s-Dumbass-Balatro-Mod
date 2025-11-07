SMODS.Joker{ --Arachnid Joker
    key = "arachnidjoker",
    config = {
        extra = {
            _8sindeck = 0,
            yes = 0,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Arachnid Joker',
        ['text'] = {
            [1] = '{C:mult}+8{} Mult for each {C:attention}8{} in your full deck',
            [2] = '{C:inactive}(Currently{}{C:mult} +#3# {}{C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true, ["rosemod2_rosemod2_toby"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.var1, card.ability.extra.yes, ((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.id == 8 then count = count + 1 end end; return count end)()) * 8}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i].config.center.key == "j_8_ball" then
                        return true
                        end
                    end
                    return false
                    end)() then
                        local target_joker = nil
                        for i, joker in ipairs(G.jokers.cards) do
                            if joker.config.center.key == "j_8_ball" and not joker.getting_sliced then
                                target_joker = joker
                                break
                            end
                        end
                        
                        if target_joker then
                            if target_joker.ability.eternal then
                                target_joker.ability.eternal = nil
                            end
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                            func = function()
                                target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Addiction is a Powerful Thing", colour = G.C.RED})
                        end
                    else
                        return {
                        mult = ((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.id == 8 then count = count + 1 end end; return count end)()) * 8
                        }
                    end
                end
            end
}