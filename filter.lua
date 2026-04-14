---@class ns
local addon = select(2, ...)

local BetterBags = LibStub('AceAddon-3.0'):GetAddon("BetterBags")
---@class Categories: AceModule
local Categories = BetterBags:GetModule('Categories')

local string_find = string.find

-- Update this table each season with the new honor/conquest gear name prefixes.
local PVP_NAME_PATTERNS = {
    "Galactic Aspirant's",  -- Season 1 Honor (Midnight 12.0)
    -- "Next Season Prefix",
}

local CATEGORY_NAME = "PvP Gear"

Categories:RegisterCategoryFunction("PvPGearCategoryFilter", function(data)
    if data.isItemEmpty then return nil end

    local itemName = data.itemInfo.itemName
    if not itemName then return nil end

    for i = 1, #PVP_NAME_PATTERNS do
        -- plain=true disables pattern matching for literal string search, safer and faster
        if string_find(itemName, PVP_NAME_PATTERNS[i], 1, true) then
            return CATEGORY_NAME
        end
    end

    return nil
end)