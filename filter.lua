---@class ns
local addon = select(2, ...)

-- BetterBags namespace
-----------------------------------------------------------
---@class BetterBags: AceAddon
local BetterBags = LibStub('AceAddon-3.0'):GetAddon("BetterBags")
---@class Categories: AceModule
local Categories = BetterBags:GetModule('Categories')
---@class Context: AceModule
local context = BetterBags:GetModule('Context')

-- Lua API
-----------------------------------------------------------
local string_find = string.find

-- PvP Item Name Patterns
-- Update this table at the start of each new PvP season.
-- Add the honor and conquest gear name prefixes for the new season.
-----------------------------------------------------------
local PVP_NAME_PATTERNS = {
    "Galactic Aspirant's",   -- Season 1 Honor (12.0)
    "Galactic Gladiator's",  -- Season 1 Conquest (12.0)
}

local CATEGORY_NAME = "PvP Gear"

-- Create the category before registering the filter function so that
-- IsCategoryEnabled returns true when items are first processed.
-- If CreateCategory is called after RegisterCategoryFunction, items processed
-- in the intervening window will be written to itemsWithNoCategory and
-- permanently skipped for categorization.
-----------------------------------------------------------
Categories:CreateCategory(context:New('PvPGear_Init'), {
    name = CATEGORY_NAME,
    itemList = {},
    save = false,
    priority = 1,
})

-- Register the category filter function with BetterBags.
-- This function is called once per item and the result is cached.
-- Returning a string places the item in that category.
-- Returning nil leaves the item uncategorized by this filter.
-----------------------------------------------------------
Categories:RegisterCategoryFunction("PvPGearCategoryFilter", function(data)
    if data.isItemEmpty then return nil end
    if not data.itemInfo then return nil end

    local itemName = data.itemInfo.itemName
    if not itemName then return nil end

    for i = 1, #PVP_NAME_PATTERNS do
        -- plain=true treats the search string as a literal, not a Lua pattern.
        -- This is both safer and faster for our use case.
        if string_find(itemName, PVP_NAME_PATTERNS[i], 1, true) then
            return CATEGORY_NAME
        end
    end

    return nil
end)