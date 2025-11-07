SMODS.Enhancement {
    key = 'taken',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            x_mult = 1.25,
            x_chips = 1.25,
            odds = 2
        }
    },
    loc_txt = {
        name = 'Taken',
        text = {
        [1] = '{X:chips,C:white}X1.25{} Chips when scored',
        [2] = '{X:mult,C:white}X1.25{} Mult when scored',
        [3] = 'Can be used as any suit',
        [4] = 'Always scores',
        [5] = '{C:green}#1#{} in {C:green}#2#{} chance to',
        [6] = '{C:red}destroy{} a random Joker',
        [7] = 'when discarded'
    }
    },
    atlas = 'CustomEnhancements',
    any_suit = true,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = true,
    unlocked = true,
    discovered = false,
    no_collection = false,
    weight = 1,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'm_rosemod2_taken')
        return {vars = {numerator, denominator}}
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return { x_mult = card.ability.extra.x_mult, x_chips = card.ability.extra.x_chips }
        end
        if context.discard and context.other_card == card then
            if SMODS.pseudorandom_probability(card, 'group_0_2402b412', 1, card.ability.extra.odds, 'm_rosemod2_taken') then
                local destructable_jokers = {}
                for i, joker in ipairs(G.jokers.cards) do
                    if not joker.ability.eternal and not joker.getting_sliced then
                        table.insert(destructable_jokers, joker)
                    end
                end
                local target_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker_enhanced')) or nil
                
                if target_joker then
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                end
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed Joker!", colour = G.C.RED})
            end
        end
    end
}