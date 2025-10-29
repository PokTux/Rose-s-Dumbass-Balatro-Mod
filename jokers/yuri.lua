SMODS.Joker{ --The Gay Agenda
    key = "yuri",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'The Gay Agenda',
        ['text'] = {
            [1] = 'Playing a hand that contains a',
            [2] = '{C:attention}Straight {}will {C:red}crash the game{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = "rosemod2_utility",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'sou' 
          or args.source == 'rif' or args.source == 'rta' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,

    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  then
            if next(context.poker_hands["Straight"]) then
                error("EasternFarmer Was Here")
            end
        end
    end
}

local check_for_buy_space_ref = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
    if card.config.center.key == "j_rosemod2_yuri" then -- ignore slot limit when bought
        return true
    end
    return check_for_buy_space_ref(card)
end

local can_select_card_ref = G.FUNCS.can_select_card
G.FUNCS.can_select_card = function(e)
	if e.config.ref_table.config.center.key == "j_rosemod2_yuri" then
		e.config.colour = G.C.GREEN
		e.config.button = "use_card"
	else
		can_select_card_ref(e)
	end
end