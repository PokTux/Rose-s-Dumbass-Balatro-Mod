SMODS.Joker{ --Javelin-Class Carrier
    key = "javelinclasscarrier",
    config = {
        extra = {
            slots = 5,
            decom = 0,
            dollars = 25,
            dollars2 = 5,
            start_dissolve = 0,
            y = 0
        }
    },
    loc_txt = {
        ['name'] = 'Javelin-Class Carrier',
        ['text'] = {
            [1] = '{C:dark_edition}+#1#{} Joker Slots',
            [2] = 'Lose {C:red}$5{} at start of round',
            [3] = '{C:white}.{}',
            [4] = 'This Joker is automatically {C:red}decommissioned{}',
            [5] = 'at the beginning of the next blind and',
            [6] = '{C:money}$25{} are refunded if money reaches {C:money}$0{} at',
            [7] = 'end of round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 25,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'buf' 
          or args.source == 'sho' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.slots}}
    end,

    
    calculate = function(self, card, context)
    if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
        if G.GAME.dollars <= to_big(0) then
            return {
                func = function()
                    card.ability.extra.decom = 1
                    return true
                    end,
                    message = "Slated for decommission!"
                    }
                end
            end
            if context.setting_blind  and not context.blueprint then
                if (card.ability.extra.decom or 0) >= 1 then
                    return {
                        dollars = card.ability.extra.dollars,
                        extra = {
                        func = function()
                            card:start_dissolve()
                            return true
                            end,
                            message = "Decommissioned!",
                            colour = G.C.RED
                        }
                    }
                else
                    return {
                        dollars = -card.ability.extra.dollars2
                    }
                end
            end
        end,

    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.slots
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.slots
    end
}

local check_for_buy_space_ref = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
    if card.config.center.key == "j_rosemod2_javelinclasscarrier" then -- ignore slot limit when bought
        return true
    end
    return check_for_buy_space_ref(card)
end

local can_select_card_ref = G.FUNCS.can_select_card
G.FUNCS.can_select_card = function(e)
	if e.config.ref_table.config.center.key == "j_rosemod2_javelinclasscarrier" then
		e.config.colour = G.C.GREEN
		e.config.button = "use_card"
	else
		can_select_card_ref(e)
	end
end