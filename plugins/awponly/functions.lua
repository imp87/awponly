function deleteBuyzones()
    local buyzones = FindEntitiesByClassname("func_buyzone")
    if #buyzones < 1 then
        return
    end
    for i = 1,#buyzones do
        CBaseEntity(buyzones[i]:ToPtr()):Despawn()
    end
end

function setConvars()
    local roundtime = config:Fetch("awponly.roundTime")
    convar:Set("mp_roundtime", tostring(roundtime))
    convar:Set("mp_roundtime_defuse", tostring(roundtime))
    convar:Set("mp_limitteams", "1")
    convar:Set("mp_autoteambalance", "0")
    convar:Set("mp_buytime", "0")
    convar:Set("mp_free_amor", "2")
end

function handleWeapons(playerid)
    local player = GetPlayer(playerid)
    if not player or player:IsFakeClient() then
        return
    end
    player:GetWeaponManager():RemoveWeapons()
    player:GetWeaponManager():RemoveWeapons()
    if config:Fetch("awponly.allowDeagle") then
        player:GetWeaponManager():GiveWeapon("weapon_deagle")
    end
    player:GetWeaponManager():GiveWeapon("weapon_awp")
    player:GetWeaponManager():GiveWeapon("weapon_knife")
end

function handleArmor()
    for i = 1, playermanager:GetPlayerCap() do
        local player = GetPlayer(i - 1)
        if player then
            player:CCSPlayerPawn().ArmorValue = 100
        end
    end
end
