SMODS.Joker{ --JOAKER OF PURE DARK
    key = "joakerofpuredark",
    config = {
        extra = {
            ch = 40,
            rosemod2_toolong = 0
        }
    },
    loc_txt = {
        ['name'] = 'JOAKER OF PURE DARK',
        ['text'] = {
            [1] = '{C:chips}+#1#{} CHIPS',
            [2] = '{C:red}DESTROAYS {}ALL SCOARED CAIRDS',
            [3] = 'ON {C:attention}FINAIL HAIND{} OF ROAUND'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true, ["rosemod2_rosemod2_toby"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.ch}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.ch
            }
        end
        if context.hand_drawn  and not context.blueprint then
            if G.GAME.current_round.hands_left == 1 then
                G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("rosemod2_toolong")
                        SMODS.calculate_effect({message = "YOUR TAKING TOO LONG"}, card)
                        return true
                        end,
                    }))
                end
            end
            if context.destroy_card and context.destroy_card.should_destroy  then
                return { remove = true }
            end
            if context.individual and context.cardarea == G.play  then
                context.other_card.should_destroy = false
                if G.GAME.current_round.hands_left == 0 then
                    context.other_card.should_destroy = true
                    return {
                        message = "Destroyed!"
                    }
                end
            end
        end
}