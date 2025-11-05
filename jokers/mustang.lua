SMODS.Joker{ --2012 Ford Mustang
    key = "mustang",
    config = {
        extra = {
            ch = 250,
            odds = 5,
            rosemod2_crash = 0,
            no = 0,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = '2012 Ford Mustang',
        ['text'] = {
            [1] = '{C:chips}+#1#{} Chips',
            [2] = '{C:green}#5# in #6#{} chance to {C:red}destroy{}',
            [3] = 'adjacent Jokers when first',
            [4] = 'hand of round is drawn'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 3
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
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_rosemod2_mustang') 
        return {vars = {card.ability.extra.ch, card.ability.extra.no, card.ability.extra.rosemod2_crash, card.ability.extra.var1, new_numerator, new_denominator}}
    end,

    
    calculate = function(self, card, context)
        if context.first_hand_drawn  and not context.blueprint then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_a5ea6c05', 1, card.ability.extra.odds, 'j_rosemod2_mustang', false) then
                    G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("rosemod2_crash")
                            SMODS.calculate_effect({message = "CRASH!"}, card)
                            return true
                            end,
                        }))
                            SMODS.calculate_effect({func = function()
                                local my_pos = nil
                                for i = 1, #G.jokers.cards do
                                    if G.jokers.cards[i] == card then
                                        my_pos = i
                                        break
                                    end
                                end
                                local target_joker = nil
                                if my_pos and my_pos < #G.jokers.cards then
                                    local joker = G.jokers.cards[my_pos + 1]
                                    if not SMODS.is_eternal(joker) and not joker.getting_sliced then
                                        target_joker = joker
                                    end
                                end
                                
                                if target_joker then
                                    target_joker.getting_sliced = true
                                    G.E_MANAGER:add_event(Event({
                                    func = function()
                                        target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                        return true
                                        end
                                    }))
                                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                                end
                                return true
                                end}, card)
                                    SMODS.calculate_effect({func = function()
                                        local my_pos = nil
                                        for i = 1, #G.jokers.cards do
                                            if G.jokers.cards[i] == card then
                                                my_pos = i
                                                break
                                            end
                                        end
                                        local target_joker = nil
                                        if my_pos and my_pos > 1 then
                                            local joker = G.jokers.cards[my_pos - 1]
                                            if not SMODS.is_eternal(joker) and not joker.getting_sliced then
                                                target_joker = joker
                                            end
                                        end
                                        
                                        if target_joker then
                                            target_joker.getting_sliced = true
                                            G.E_MANAGER:add_event(Event({
                                            func = function()
                                                target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                                return true
                                                end
                                            }))
                                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                                        end
                                        return true
                                        end}, card)
                                    end
                                end
                            end
                            if context.cardarea == G.jokers and context.joker_main  then
                                return {
                                    chips = card.ability.extra.ch
                                }
                            end
                        end
}