SMODS.Rarity {
    key = "utility",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('717171'),
    loc_txt = {
        name = "Utility"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}