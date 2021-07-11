empty = {
  draw: ->,
  update: ->,
  enter: ->,
  exit: ->
}

class StateMachine
  new: (states) =>
    @empty = empty
    @states = states or {}
    @current = @empty

  change: (stateName, params) =>
    assert @states[stateName], "State does not exist."
    @current\exit!
    -- Dump params
    @current = @states[stateName] params
    @current\enter params

  update: (dt) =>
    -- print dt
    @current\update dt

  draw: =>
    @current\draw!
