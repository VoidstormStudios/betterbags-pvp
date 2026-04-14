local addonName = ...
---@class ns
local addon = select(2, ...)

local BetterBags = LibStub('AceAddon-3.0'):GetAddon("BetterBags")
assert(BetterBags, addonName .. " requires BetterBags")

local Categories = BetterBags:GetModule('Categories')
local context = BetterBags:GetModule('Context')

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(_, event, name)
    if event == "ADDON_LOADED" and name == addonName then
        frame:UnregisterEvent("ADDON_LOADED")
        Categories:CreateCategory(context:New('PvPGear_Init'), {
            name = "PvP Gear",
            itemList = {},
            save = false,
        })
    end
end)