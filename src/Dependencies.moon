StateMachine = assert require 'src/StateMachine'
M = assert require "moon"

export Dump = M.p

export Graphics = love.graphics
export Window = love.window
export Keyboard = love.keyboard
--States
DebugState = assert require 'src/states/DebugState'

export G_stateMachine = StateMachine {
  ['debug']: (params) -> DebugState params
}
