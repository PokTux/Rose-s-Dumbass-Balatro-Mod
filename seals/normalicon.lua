SMODS.Seal {
    key = 'normalicon',
    pos = { x = 1, y = 0 },
    config = {
        extra = {
            x_chips = 1.25
        }
    },
    badge_colour = HEX('31bf31'),
   loc_txt = {
        name = 'Normal Icon',
        label = 'Normal Icon',
        text = {
        [1] = '{X:mult,C:white}X1.25{} Mult when scored'
    }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            G.E_MANAGER:add_event(Event({
     func = function()
    play_sound("rosemod2_firehole")
    SMODS.calculate_effect({message = "FIRE IN THE HOLE!"}, card)
    return true
    end,
}))
            SMODS.calculate_effect({x_chips = card.ability.seal.extra.x_chips}, card)
        end
    end
}