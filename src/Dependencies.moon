StateMachine = assert require 'src/StateMachine'
M = assert require 'moon'

export Dump = M.p

export Graphics = love.graphics
export Window = love.window
export Keyboard = love.keyboard

assert require 'src/colors'
assert require 'src/Data'

die = assert require 'src/Die'
export Die = die!

--States
DebugState = assert require 'src/states/DebugState'

export G_stateMachine = StateMachine {
  ['debug']: (params) -> DebugState params
}
