SMODS.Joker{ --Temporal Joker
    key = "temporaljoker",
    config = {
        extra = {
            currenthours = 0,
            currentminutes = 0
        }
    },
    loc_txt = {
        ['name'] = 'Temporal Joker',
        ['text'] = {
            [1] = '{C:green}Gives +Mult Equivalent To Current Hour{}',
            [2] = '{C:green}And +Chips Equivalent To Current Minute{}',
            [3] = '{C:mult}#1#{}:{C:chips}#2#{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true, ["rosemod2_rosemod2_toby"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {os.date("*t", os.time()).hour, os.date("*t", os.time()).min}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = os.date("*t", os.time()).hour,
                extra = {
                chips = os.date("*t", os.time()).min,
                colour = G.C.CHIPS
            }
        }
    end
end
}