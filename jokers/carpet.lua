SMODS.Joker{ --Carpet
    key = "carpet",
    config = {
        extra = {
            n = 0,
            rosemod2_carpet = 0
        }
    },
    loc_txt = {
        ['name'] = 'Carpet',
        ['text'] = {
            [1] = 'Create a random {C:attention}consumable{} if played',
            [2] = 'hand contains a {C:attention}Full House{}',
            [3] = '{C:inactive}(Must have room){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true, ["rosemod2_rosemod2_toby"] = true },

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Full House"]) then
                for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                    G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        play_sound('timpani')
                        local sets = {'Tarot', 'Planet', 'Spectral'}
                        local random_set = pseudorandom_element(sets, 'random_consumable_set')
                        SMODS.add_card({ set = random_set, })                            
                        card:juice_up(0.3, 0.5)
                        return true
                        end
                    }))
                end
                delay(0.6)
                G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("rosemod2_carpet")
                    
                    return true
                    end,
                }))
                return {
                    message = "Like Carpet"
                }
            end
        end
    end
}