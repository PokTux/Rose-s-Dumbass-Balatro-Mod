
SMODS.Back {
    key = 'derse_deck',
    pos = { x = 5, y = 0 },
    config = {
    },
    loc_txt = {
        name = 'Derse Deck',
        text = {
            [1] = '{C:red}-1{} hand every round',
            [2] = '{C:red}+2{} discards every round'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        G.GAME.starting_params.hands = G.GAME.starting_params.hands - 1
        G.GAME.starting_params.discards = G.GAME.starting_params.discards + 2
    end
}