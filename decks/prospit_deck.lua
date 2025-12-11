
SMODS.Back {
    key = 'prospit_deck',
    pos = { x = 6, y = 0 },
    config = {
    },
    loc_txt = {
        name = 'Prospit Deck',
        text = {
            [1] = '{C:red}-1{} discard every round',
            [2] = '{C:blue}+2{} hands every round'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        G.GAME.starting_params.hands = G.GAME.starting_params.hands + 2
        G.GAME.starting_params.discards = G.GAME.starting_params.discards - 1
    end
}