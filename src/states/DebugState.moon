BaseState = assert require 'src/states/BaseState'
toolbox = assert require 'src/GUI/toolbox'
main = assert require 'src/GUI/mainPanel'
Audio = love.audio

export Sounds = {
  oneDie: Audio.newSource "res/oneDie.flac", "stream"
  multiDie: Audio.newSource "res/multiDie.wav", "stream"
  dieShake: Audio.newSource "res/dieShake.wav", "stream"
}

class DebugState extends BaseState
  new: (P) =>
    @loveF = P.loveframes
    @toolBoxWidth = 35
    @mainCenterArea = {0, 10, Graphics.getWidth!, Graphics.getHeight! - @toolBoxWidth}
    toolbox.create @loveF, @toolBoxWidth
    main\create @loveF, @mainCenterArea
