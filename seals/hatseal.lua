SMODS.Seal {
    key = 'hatseal',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            highestrankinhand = 0
        }
    },
    badge_colour = HEX('433262'),
   loc_txt = {
        name = 'Hat Seal',
        label = 'Hat Seal',
        text = {
        [1] = 'This card gives {C:chips}Chips {}equivalent to {C:attention}highest{} ranked',
        [2] = 'card held in hand when scored'
    }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = false,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return { chips = (function() local max = 0; for _, card in ipairs(G.hand and G.hand.cards or {}) do if card.base.id > max then max = card.base.id end end; return max end)() }
        end
    end
}