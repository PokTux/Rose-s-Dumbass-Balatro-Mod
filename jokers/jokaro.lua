SMODS.Joker{ --Go Ahead, Mr Jokestarr
    key = "jokaro",
    config = {
        extra = {
            flip = 0,
            xm = 3
        }
    },
    loc_txt = {
        ['name'] = 'Go Ahead, Mr Jokestarr',
        ['text'] = {
            [1] = '{X:mult,C:white}X#2#{} Mult',
            [2] = 'All Jokers are {C:attention}flipped and shuffled {}',
            [3] = 'until{C:attention} first hand {}is played'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.flip, card.ability.extra.xm}}
    end,

    
    calculate = function(self, card, context)
        if context.first_hand_drawn  and not context.blueprint then
            if #G.jokers.cards > 0 then
                for _, joker in ipairs(G.jokers.cards) do
                    joker:flip()
                end
            end
            if #G.jokers.cards > 1 then
                G.jokers:unhighlight_all()
                G.E_MANAGER:add_event(Event({
                trigger = 'before',
                func = function()
                    G.E_MANAGER:add_event(Event({
                    func = function()
                        G.jokers:shuffle('aajk')
                        play_sound('cardSlide1', 0.85)
                        return true
                        end,
                    }))
                    delay(0.15)
                    G.E_MANAGER:add_event(Event({
                    func = function()
                        G.jokers:shuffle('aajk')
                        play_sound('cardSlide1', 1.15)
                        return true
                        end
                    }))
                    delay(0.15)
                    G.E_MANAGER:add_event(Event({
                    func = function()
                        G.jokers:shuffle('aajk')
                        play_sound('cardSlide1', 1)
                        return true
                        end
                    }))
                    delay(0.5)
                    return true
                    end
                }))
            end
            return {
                func = function()
                    card.ability.extra.flip = 1
                    return true
                    end,
                    extra = {
                    message = "Flip!",
                    colour = G.C.ORANGE,
                    extra = {
                    message = "Shuffle!",
                    colour = G.C.ORANGE
                }
            }
        }
    end
    if context.cardarea == G.jokers and context.joker_main  then
        return {
            Xmult = card.ability.extra.xm
        }
    end
    if context.after and context.cardarea == G.jokers  and not context.blueprint then
        if (card.ability.extra.flip or 0) == 1 then
            if #G.jokers.cards > 0 then
                for _, joker in ipairs(G.jokers.cards) do
                    joker:flip()
                end
            end
            return {
                message = "Flip!",
                extra = {
                func = function()
                    card.ability.extra.flip = 0
                    return true
                    end,
                    colour = G.C.BLUE
                }
            }
        end
    end
end
}