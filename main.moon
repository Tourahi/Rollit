assert require 'src/Dependencies'

Graphics = love.graphics
Window = love.window

with love
  .load = (args) ->
    Graphics.setDefaultFilter 'nearest', 'nearest'
    Window.setTitle "Rollit"
    G_stateMachine\change 'debug'

  .update = (dt) ->
    G_stateMachine\update dt

  .draw = () ->
    G_stateMachine\draw!
