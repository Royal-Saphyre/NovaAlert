--=============================================================================
-- NovaAlert
-- File: Events.lua
-- Purpose: Combat event detection
--=============================================================================

local EventFrame = CreateFrame("Frame")


------------------------------------------------
-- Crowd Control List
------------------------------------------------

local CrowdControl = {

    -- Stuns
    ["Kidney Shot"] = true,
    ["Cheap Shot"] = true,
    ["Hammer of Justice"] = true,
    ["Bash"] = true,
    ["Pounce"] = true,

    -- Incapacitate
    ["Sap"] = true,
    ["Polymorph"] = true,
    ["Hibernate"] = true,

    -- Fear
    ["Fear"] = true,
    ["Psychic Scream"] = true,
    ["Howl of Terror"] = true,

    -- Silence
    ["Silence"] = true,
    ["Counterspell"] = true,

    -- Freeze / Root
    ["Frost Nova"] = true,
    ["Deep Freeze"] = true,
    ["Entangling Roots"] = true,

    -- Disorient
    ["Blind"] = true,
    ["Cyclone"] = true,
}


------------------------------------------------
-- Chat Announcement
------------------------------------------------

local function Announce(message)

    if GetNumRaidMembers() > 0 then

        SendChatMessage(
            message,
            "RAID"
        )

    elseif GetNumPartyMembers() > 0 then

        SendChatMessage(
            message,
            "PARTY"
        )

    end

end


------------------------------------------------
-- Combat Log Handler
------------------------------------------------

local function CombatEvent()

    local timestamp,
    event,
    hideCaster,
    sourceGUID,
    sourceName,
    sourceFlags,
    sourceRaidFlags,
    destGUID,
    destName,
    destFlags,
    destRaidFlags,
    spellID,
    spellName = CombatLogGetCurrentEventInfo()


    if event == "SPELL_AURA_APPLIED" then


        -- Check if player received the effect

        if destGUID == UnitGUID("player") then


            if CrowdControl[spellName] then


                local message =
                "⚠ I am "..string.upper(spellName)


                if sourceName then

                    message = message.." by "..sourceName

                end


                Announce(message)

            end
        end
    end
end


------------------------------------------------
-- Register Events
------------------------------------------------

EventFrame:RegisterEvent(
    "COMBAT_LOG_EVENT_UNFILTERED"
)


EventFrame:SetScript(
    "OnEvent",
    CombatEvent
)
