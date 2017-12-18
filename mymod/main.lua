local mod = RegisterMod("Sandbox", 1)
local toggle_pressed = false

function mod:CallbackInputAction(entity, inputHook, buttonAction)
  if Input.IsButtonPressed(Keyboard.KEY_0, 0) then
    if toggle_pressed == false then
      toggle_pressed = true
      Isaac.ConsoleOutput("DBG: KEY_0.")
      local player = Isaac.GetPlayer(0)
      player:AddCoins(100)
    end
  elseif Input.IsButtonPressed(Keyboard.KEY_9, 0) then
    if toggle_pressed ~= true then
      toggle_pressed = true
      Isaac.ConsoleOutput("DBG: KEY_9.")
      local player = Isaac.GetPlayer(0)
      player:SetActiveCharge(100)
    end
  elseif Input.IsButtonPressed(Keyboard.KEY_8, 0) then
    if toggle_pressed ~= true then
      toggle_pressed = true
      Isaac.ConsoleOutput("DBG: KEY_8.")
      Isaac.ExecuteCommand("spawn shop item")
    end
  elseif Input.IsButtonPressed(Keyboard.KEY_7, 0) then
    if toggle_pressed ~= true then
      toggle_pressed = true
      Isaac.ConsoleOutput("DBG: KEY_7.")
      Isaac.ExecuteCommand("reseed")
    end
  else
    toggle_pressed = false
  end
end

mod:AddCallback(ModCallbacks.MC_INPUT_ACTION, mod.CallbackInputAction)

Isaac.ConsoleOutput("Sandbox loaded.")
