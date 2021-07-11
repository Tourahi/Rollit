import floor from math
import random from love.math

class Die
  new: (sides = 4) =>
    @sides = sides

  roll: =>
    floor random! * @sides + 1

  rollAdvantage: =>
    r1 = floor random! * @sides + 1
    r2 = floor random! * @sides + 1
    r1, r2


