import floor from math
import random from love.math

class Die
  new: (sides = 4) =>
    @sides = sides -- deprecated

  roll: (die) =>
    print "DEBUG::ROLLSTR", die if DEBUG_ENABLED
    local _rolls, _sides, _modOperation, _modifier
    _modOperation = '+'
    _modifier = 0

    i, j = string.find die, "D"
    -- Get number of rolls to be performed
    if i == 1
      _rolls = 1
    else
      _rolls = tonumber string.sub(die, 0, (j-1))
    
    -- Get the die sides
    afterD = string.sub die, (j+1), string.len(die)
    i, j = string.find afterD, "%d+" -- Find the first digits in afterD ["2D10+4"] -> 10
    _sides = tonumber string.sub(afterD, i, j) -- get the sides

    -- Now we get the modifier and the operation on that modifier
    afterSides = string.sub afterD, (j+1), string.len(afterD)

    if string.len(afterSides) != 0
      _modOperation = string.sub afterSides, 1, 1
      _modifier = tonumber string.sub(afterSides, 2, string.len(afterSides))

    print("ROLLS::SIDES::ModOPERATION::MODIFIER", _rolls, _sides, _modOperation, _modifier) if DEBUG_ENABLED
    
    math.randomseed(os.time! + tonumber(tostring({})\sub(8)))

    roll, total = 0, 0

    while roll < _rolls
      total += math.random 1, _sides
      roll += 1

    print "DEBUG::ROLL::BEFORE::MODIFIER", total if DEBUG_ENABLED
    if _modOperation == "+"
      total += _modifier
    elseif _modOperation == "-"
      total -= _modifier
    print "DEBUG::ROLL", total if DEBUG_ENABLED
    total


