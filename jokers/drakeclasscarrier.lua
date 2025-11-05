SMODS.Joker{ --Drake-Class Carrier
    key = "drakeclasscarrier",
    config = {
        extra = {
            decomdrake = 0,
            dollars = 2,
            dollars2 = 5,
            dollars3 = 3,
            start_dissolve = 0,
            n = 0
        }
    },
    loc_txt = {
        ['name'] = 'Drake-Class Carrier',
        ['text'] = {
            [1] = 'Earn {C:money}$2{} when a hand is played',
            [2] = 'Lose {C:red}$3{} at start of round',
            [3] = '{C:white}.{}',
            [4] = 'This Joker is automatically {C:red}decommissioned{}',
            [5] = 'at the beginning of the next blind and',
            [6] = '{C:money}$5{} are refunded if money reaches {C:money}$0{} at',
            [7] = 'end of round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 4
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
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true },

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                dollars = card.ability.extra.dollars
            }
        end
    if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
        if G.GAME.dollars <= to_big(0) then
            return {
                func = function()
                    card.ability.extra.decomdrake = 1
                    return true
                    end,
                    message = "Slated for decommission!"
                    }
                end
            end
            if context.setting_blind  and not context.blueprint then
                if (card.ability.extra.decomdrake or 0) >= 1 then
                    return {
                        dollars = card.ability.extra.dollars2,
                        extra = {
                        func = function()
                            card:start_dissolve()
                            return true
                            end,
                            colour = G.C.RED
                        }
                    }
                else
                    return {
                        dollars = -card.ability.extra.dollars3
                    }
                end
            end
        end
}