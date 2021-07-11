StateMachine = assert require 'src/StateMachine'
M = assert require "moon"

export Dump = M.p

--States
DebugState = assert require 'src/states/DebugState'

export G_stateMachine = StateMachine {
  ['debug']: (params) -> DebugState params
}
