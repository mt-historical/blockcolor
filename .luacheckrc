unused_args = false
allow_defined_top = true

ignore = {
    "611", -- A line consists of nothing but whitespace.
    "612", -- A line contains trailing whitespace.
    "613", -- Trailing whitespace in a string.
    "614", -- Trailing whitespace in a comment.
    "621", -- Inconsistent indentation (SPACE followed by TAB).
    "631", -- Line is too long.
}

globals = {
    "DIR_DELIM", "INIT",

    "minetest", "core",
    "dump", "dump2",

    "Raycast",
    "Settings",
    "PseudoRandom",
    "PerlinNoise",
    "VoxelManip",
    "SecureRandom",
    "VoxelArea",
    "PerlinNoiseMap",
    "PcgRandom",
    "ItemStack",
    "AreaStore",

    "vector",

    table = {
        fields = {
            "copy",
            "indexof",
            "insert_all",
            "key_value_swap",
            "shuffle",
        }
    },

    string = {
        fields = {
            "split",
            "trim",
        }
    },

    math = {
        fields = {
            "hypot",
            "sign",
            "factorial"
        }
    },

    "default", "sethome", "boats", "creative", "doors", "tnt", "cmi", "screwdriver",

    "awards", "mobs", "music", "sfinv", "noncubic", "inventory_plus", "signs_lib", "pkarcs", "detail_level", "FB", "carts",
}

for i = 1, 10, 1 do
    table.insert(globals, "color"..i)
end