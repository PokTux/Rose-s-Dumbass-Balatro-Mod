SMODS.Joker{ --This Is Stupid
    key = "thisisstupid",
    config = {
        extra = {
            ignore = 0,
            explode = 0,
            n = 0
        }
    },
    loc_txt = {
        ['name'] = 'This Is Stupid',
        ['text'] = {
            [1] = 'This joker is a direct reference to a semi-obscure piece of',
            [2] = 'media that I love! Firstly, it gives {C:red}+2{} Mult and',
            [3] = '{C:blue}+7{} Chips for each scored card only IF the',
            [4] = 'hand played consists of two {C:inactive}light {}suits and',
            [5] = 'one {C:dark_edition}dark {}suit BUT NOT MORE. And each',
            [6] = '{C:diamonds}(Diamond){} card suit within that played hand adds a permanent',
            [7] = '{C:red}+1{} Mult (suit changes every Ante).',
            [8] = 'If this joker is triggered and the player has more than {C:money}$18{},',
            [9] = 'it gains an additional {C:blue}+4{} Chips for every',
            [10] = 'played card (resets if the player does not have more than {C:money}$10{})',
            [11] = 'If the played hand has exactly 4 cards,',
            [12] = 'and there are {C:spades}Spade{} cards in that hand,',
            [13] = 'then each {C:spades}Spade{} card has a {C:green}1 in 4{} chance to to provide {C:money}+$4{} dollars,',
            [14] = 'a {C:green}1 in 6{} chance to give {X:red,C:white}X1.05{} Mult,',
            [15] = 'and a {C:green}2 in 5{} chance to retrigger the leftmost card in the played hand',
            [16] = '(the latter is not affected by probability manipulation)',
            [17] = 'This joker has direct synergy with the custom suits that are',
            [18] = 'included as part of the mod it came with,',
            [19] = 'and has a {C:green}1 in 10{} chance to convert',
            [20] = 'any played cards into the {X:legendary,C:white}Gingglemabob {}Suit. As a bonus,',
            [21] = 'it provides a {C:planet}planet{} card for your most played hand when a round ends',
            [22] = 'and you have exactly {C:money}$13{} and at least one {X:legendary,C:white}Gingglemabob {}card held in hand.',
            [23] = 'This joker perishes after completing 12 blinds,',
            [24] = 'unless it is exactly Ante 6, in which case it simply consumes',
            [25] = 'the rightmost joker instead, OR the date on your computer',
            [26] = 'says that it\'s a Thursday evening between 4:22-4:44 P.M,',
            [27] = 'and it transforms itself into Cavendish',
            [28] = '(this is actually an inside-joke with my friends on the private',
            [29] = 'channel on the mod\'s discord server).',
            [30] = 'Skipping blinds with this joker has a {C:green}1 in 37{}',
            [31] = 'chance to give a random consumable (excluding {C:attention}The Fool{})',
            [32] = '(this is also another an inside-joke because a random on the',
            [33] = 'server kept spamming the number 37 and it was funny)',
            [34] = '{C:white}.{}',
            [35] = '{C:inactive}Art by ToxicPlayer as {}',
            [36] = '{C:inactive}part of JokerForge placeholders{}',
            [37] = '{C:inactive}Description by u/Chrystales on r/Balatro{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 2,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true },

    
    calculate = function(self, card, context)
        if context.first_hand_drawn  then
            return {
                func = function()
                    
                    local created_joker = false
                    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                        created_joker = true
                        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                        G.E_MANAGER:add_event(Event({
                        func = function()
                            local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_joker' })
                            if joker_card then
                                
                                
                            end
                            G.GAME.joker_buffer = 0
                            return true
                            end
                        }))
                    end
                    if created_joker then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                    end
                    return true
                    end,
                    extra = {
                    func = function()
                        card:explode()
                        return true
                        end,
                        colour = G.C.RED
                    }
                }
            end
        end
}