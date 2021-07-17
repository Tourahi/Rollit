import floor from math
import random from love.math

class Die
  new: (sides = 4) =>
    @sides = sides

  roll: (c) =>
    switch c
      when "D4"
        return floor random! * 4 + 1
      when "D6"
        return floor random! * 6 + 1
      when "D8"
        return floor random! * 8 + 1
      when "D10"
        return floor random! * 10 + 1
      when "D12"
        return floor random! * 12 + 1
      when "D20"
        return floor random! * 20 + 1
      when "D100"
        return floor random! * 100 + 1


