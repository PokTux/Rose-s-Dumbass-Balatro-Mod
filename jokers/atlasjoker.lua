SMODS.Joker{ --Crimson Interface
    key = "atlasjoker",
    config = {
        extra = {
            atlascardsscored = 0,
            n = 0,
            y = 0,
            explode = 0
        }
    },
    loc_txt = {
        ['name'] = 'Crimson Interface',
        ['text'] = {
            [1] = 'After 16 cards are scored create 2 random {C:planet}',
            [2] = 'Planet{} cards and {C:red}explode spectacularly{}',
            [3] = '',
            [4] = '',
            [5] = '{C:inactive}(Currently{} {C:attention}#1#{}{C:inactive}/16){}{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosesmod2_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.atlascardsscored}}
    end,

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            card.ability.extra.atlascardsscored = (card.ability.extra.atlascardsscored) + 1
        end
        if context.after and context.cardarea == G.jokers  and not context.blueprint then
            if (card.ability.extra.atlascardsscored or 0) >= 16 then
                return {
                    func = function()
                        
                        for i = 1, 2 do
                            G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.4,
                            func = function()
                                play_sound('timpani')
                                SMODS.add_card({ set = 'Planet', })                            
                                card:juice_up(0.3, 0.5)
                                return true
                                end
                            }))
                        end
                        delay(0.6)
                        
                        if created_consumable then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_planet'), colour = G.C.SECONDARY_SET.Planet})
                        end
                        return true
                        end,
                        extra = {
                        func = function()
                            card:explode()
                            return true
                            end,
                            message = "16 // 16 // 16 // 16",
                            colour = G.C.RED
                        }
                    }
                end
            end
        end
}