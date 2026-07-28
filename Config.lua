--=============================================================================
-- NovaAlert
-- File: Config.lua
-- Purpose: Slash commands and settings
--=============================================================================

NovaAlert.Enabled = true


------------------------------------------------
-- Slash Commands
------------------------------------------------

SLASH_NOVAALERT1 = "/novaalert"
SLASH_NOVAALERT2 = "/na"


SlashCmdList["NOVAALERT"] = function(msg)

    msg = string.lower(msg or "")


    if msg == "" then

        NovaAlert:Print(
            "Commands: /novaalert on, /novaalert off, /novaalert test"
        )


    elseif msg == "on" then

        NovaAlert.Enabled = true

        NovaAlert:Print(
            "Alerts enabled."
        )


    elseif msg == "off" then

        NovaAlert.Enabled = false

        NovaAlert:Print(
            "Alerts disabled."
        )


    elseif msg == "test" then

        if GetNumRaidMembers() > 0 then

            SendChatMessage(
                "⚠ I am SAP (Test)",
                "RAID"
            )

        elseif GetNumPartyMembers() > 0 then

            SendChatMessage(
                "⚠ I am SAP (Test)",
                "PARTY"
            )

        else

            NovaAlert:Print(
                "Not in a party or raid."
            )

        end


    else

        NovaAlert:Print(
            "Unknown command."
        )

    end

end
