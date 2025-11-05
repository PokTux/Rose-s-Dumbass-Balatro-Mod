SMODS.Joker{ --Magic Hat
    key = "magichat",
    config = {
        extra = {
            ability = 1,
            xm = 3,
            hands = 1,
            round = 0,
            perishable = 0,
            respect = 0
        }
    },
    loc_txt = {
        ['name'] = 'Magic Hat',
        ['text'] = {
            [1] = 'Randomly do one of the following',
            [2] = 'when hand is played',
            [3] = '',
            [4] = '{X:mult,C:white}X#2#{} Mult',
            [5] = '{C:chips}+#3#{} Hand',
            [6] = 'Apply a {C:attention}Magic Hat Seal{} to scored cards',
            [7] = 'Create a {C:attention}perishable {}{C:common}Common {}Joker',
            [8] = '{C:inactive}(Must have room){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_SEALS["rosemod2_hatseal"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"rosemod2_hatseal\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.ability, card.ability.extra.xm, card.ability.extra.hands}}
    end,

    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  and not context.blueprint then
            if (card.ability.extra.ability or 0) == 2 then
                return {
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Extra Hand!", colour = G.C.GREEN})
                        G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + card.ability.extra.hands
                        return true
                        end
                    }
                elseif (card.ability.extra.ability or 0) == 4 then
                    return {
                        func = function()
                            
                            local created_joker = false
                            if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                                created_joker = true
                                G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                                G.E_MANAGER:add_event(Event({
                                func = function()
                                    local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'Common' })
                                    if joker_card then
                                        
                                        joker_card:add_sticker('perishable', true)
                                    end
                                    G.GAME.joker_buffer = 0
                                    return true
                                    end
                                }))
                            end
                            if created_joker then
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                            end
                            return true
                            end
                        }
                    end
                end
                if context.cardarea == G.jokers and context.joker_main  and not context.blueprint then
                    if (card.ability.extra.ability or 0) == 1 then
                        return {
                            Xmult = card.ability.extra.xm,
                            message = "Triple Score!"
                        }
                    end
                end
                if context.individual and context.cardarea == G.play  and not context.blueprint then
                    if (card.ability.extra.ability or 0) == 3 then
                        context.other_card:set_seal("rosemod2_hatseal", true)
                        return {
                            message = "Magic Hat!"
                        }
                    end
                end
                if context.after and context.cardarea == G.jokers  and not context.blueprint then
                    return {
                        func = function()
                            card.ability.extra.ability = pseudorandom('ability_07ca0bdf', 1, 4)
                            return true
                            end
                        }
                    end
                end
}