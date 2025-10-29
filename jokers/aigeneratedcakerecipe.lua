SMODS.Joker{ --AI Generated Cake Recipe
    key = "aigeneratedcakerecipe",
    config = {
        extra = {
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'AI Generated Cake Recipe',
        ['text'] = {
            [1] = 'I asked an {C:attention}AI {}to come up with a Joker and it just',
            [2] = 'gave me a recipe for {C:blue}Lemon Blueberry Ricotta Cake{}',
            [3] = '{C:white}.{}',
            [4] = 'This Joker doesn\'t even do anything',
            [5] = '{C:white}.{}',
            [6] = 'You can sell it for a {C:common}Jimbo {}I guess',
            [7] = 'I\'ll even make it a fancy {C:dark_edition}Foil {}one for you',
            [8] = '{C:white}.{}',
            [9] = '{C:inactive}Art by EasternFarmer as {}',
            [10] = '{C:inactive}part of JokerForge placeholders{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 3,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true },

    
    calculate = function(self, card, context)
        if context.selling_self  then
            return {
                func = function()
                    
                    local created_joker = false
                    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                        created_joker = true
                        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                        G.E_MANAGER:add_event(Event({
                        func = function()
                            local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_joker' })
                            if joker_card then
                                joker_card:set_edition("e_foil", true)
                                
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
}