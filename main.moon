assert require 'src/Dependencies'

with love
  .load = (args) ->
    Graphics.setDefaultFilter 'nearest', 'nearest'
    Window.setTitle "Rollit"
    G_stateMachine\change 'debug'
    Keyboard.keysPressed = {}

  .update = (dt) ->
    G_stateMachine\update dt
    Keyboard.keysPressed = {}

  .draw = () ->
    G_stateMachine\draw!

  .keypressed = (key, is_r) ->
    Keyboard.keysPressed[key] = true

Keyboard.wasPressed = (key) ->
    if Keyboard.keysPressed[key]
      return true
    else
      return false
