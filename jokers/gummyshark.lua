SMODS.Joker{ --Gummy Shark
    key = "gummyshark",
    config = {
        extra = {
            thisjokersellvalue = 0
        }
    },
    loc_txt = {
        ['name'] = 'Gummy Shark',
        ['text'] = {
            [1] = 'Does Nothing'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' and args.source ~= 'jud' and args.source ~= 'rif' 
          or args.source == 'buf' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    
    calculate = function(self, card, context)
        if context.hand_drawn  and not context.blueprint then
            return {
                message = "2 Pounds of Gummy Sharks!"
            }
        end
        if context.first_hand_drawn  and not context.blueprint then
            return {
                message = "2 Pounds of Gummy Sharks!"
            }
        end
        if context.selling_self  and not context.blueprint then
            return {
            dollars = -(function() for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do if joker == card then return joker.sell_cost end end end)()
            }
        end
        if context.selling_card  and not context.blueprint then
            return {
                message = "2 Pounds of Gummy Sharks!"
            }
        end
    end
}

local check_for_buy_space_ref = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
    if card.config.center.key == "j_rosemod2_gummyshark" then -- ignore slot limit when bought
        return true
    end
    return check_for_buy_space_ref(card)
end

local can_select_card_ref = G.FUNCS.can_select_card
G.FUNCS.can_select_card = function(e)
	if e.config.ref_table.config.center.key == "j_rosemod2_gummyshark" then
		e.config.colour = G.C.GREEN
		e.config.button = "use_card"
	else
		can_select_card_ref(e)
	end
end