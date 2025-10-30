SMODS.Joker{ --Arachnid Joker
    key = "arachnidjoker",
    config = {
        extra = {
            _8sindeck = 0
        }
    },
    loc_txt = {
        ['name'] = 'Arachnid Joker',
        ['text'] = {
            [1] = '{C:mult}+8{} Mult for each {C:attention}8{} in your full deck',
            [2] = '{C:inactive}(Currently{}{C:mult} +#1# {}{C:inactive}Mult){}'
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
        
        return {vars = {((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.id == 8 then count = count + 1 end end; return count end)()) * 8}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
            mult = ((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.id == 8 then count = count + 1 end end; return count end)()) * 8
            }
        end
    end
}