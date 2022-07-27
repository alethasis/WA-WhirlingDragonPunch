function()
  if aura_env.states and aura_env.states[2] and aura_env.states[3] then
    local getCooldown = function(spellTrigger)
      local curTime = GetTime()
      local expirationTime

      if (spellTrigger.expirationTime > 0) then
        expirationTime = spellTrigger.expirationTime
      else
        expirationTime = curTime
      end

      return math.abs(Round(expirationTime - curTime))
    end

    local cooldownRSK = getCooldown(aura_env.states[2])
    local cooldownFOF = getCooldown(aura_env.states[3])

    if (cooldownRSK > 0 and cooldownFOF > 0) then
      return math.min(cooldownRSK, cooldownFOF)
    elseif (cooldownRSK > 0) then
      return cooldownRSK
    else
      return cooldownFOF
    end
  end
end