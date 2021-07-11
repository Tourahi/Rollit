StateMachine = assert require 'src/StateMachine'

export G_stateMachine = StateMachine {
  ['Debug']: (params) -> ServeState params
}
