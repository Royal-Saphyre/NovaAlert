--=============================================================================
-- NovaAlert
-- File: Core.lua
-- Purpose: Core addon framework
-- Supports: Vanilla 1.12.1, TBC, WotLK 3.3.5a, Cata, MoP + Ascension
--=============================================================================

------------------------------------------------
-- Main Addon Object
------------------------------------------------

NovaAlert = {}

NovaAlert.Name = "NovaAlert"
NovaAlert.Version = "1.0.0"


------------------------------------------------
-- Compatibility Detection
------------------------------------------------

NovaAlert.IsVanilla = (GetBuildInfo and select(1, GetBuildInfo()) == "1.12.1")

NovaAlert.HasCombatLogInfo = (CombatLogGetCurrentEventInfo ~= nil)


------------------------------------------------
-- Debug / Chat Output
------------------------------------------------

function NovaAlert:Print(msg)

    DEFAULT_CHAT_FRAME:AddMessage(
        "|cff00aaffNova|r|cffffffffAlert|r: "..tostring(msg)
    )

end


------------------------------------------------
-- Initialization
------------------------------------------------

function NovaAlert:Initialize()

    self:Print("Loaded v"..self.Version)

end


------------------------------------------------
-- Event Handler
------------------------------------------------

local CoreFrame = CreateFrame("Frame")

CoreFrame:RegisterEvent("PLAYER_LOGIN")

CoreFrame:SetScript("OnEvent", function()

    NovaAlert:Initialize()

end)
