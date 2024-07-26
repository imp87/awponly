AddEventHandler("OnPlayerSpawn", function(event)
    local playerid = event:GetInt("userid")
    SetTimeout(3, function() handleWeapons(playerid) end)
    return EventResult.Continue
end)

AddEventHandler("OnRoundStart", function()
    setConvars()

    if config:Fetch("awponly.deleteBuyzones") == true then
        deleteBuyzones()
    end

    if config:Fetch("awponly.allowArmor") == true then
        handleArmor()
    end

    return EventResult.Continue
end)
