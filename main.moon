assert require 'src/Dependencies'
loveframes = assert require 'lib/loveframes'

with love
  .load = (args) ->
    Graphics.setDefaultFilter 'nearest', 'nearest'
    G_stateMachine\change 'debug', {
      loveframes: loveframes
    }
    Keyboard.keysPressed = {}

  .update = (dt) ->
    G_stateMachine\update dt
    Keyboard.keysPressed = {}
    loveframes.update dt

  .draw = () ->
    G_stateMachine\draw!
    loveframes.draw!

  .mousepressed = (x, y, button) ->
    loveframes.mousepressed x, y, button

  .keypressed = (key, is_r) ->
    Keyboard.keysPressed[key] = true
    loveframes.keypressed key, is_r

  .mousepressed = (x, y, button) ->
    loveframes.mousepressed x, y, button

  .mousereleased = (x, y, button) ->
    loveframes.mousereleased x, y, button

  .wheelmoved = (x, y) ->
    loveframes.wheelmoved x, y

  .keyreleased = (key) ->
    loveframes.keyreleased key

  .textinput = (text) ->
    loveframes.textinput text

Keyboard.wasPressed = (key) ->
    if Keyboard.keysPressed[key]
      return true
    else
      return false
