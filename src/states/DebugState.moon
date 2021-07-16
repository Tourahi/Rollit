BaseState = assert require 'src/states/BaseState'
toolbox = assert require 'src/GUI/toolbox'
main = assert require 'src/GUI/mainPanel'

class DebugState extends BaseState
  new: (P) =>
    @loveF = P.loveframes
    @toolBoxWidth = 35
    @mainCenterArea = {0, 10, Graphics.getWidth!, Graphics.getHeight! - @toolBoxWidth}
    toolbox.create @loveF, @toolBoxWidth
    main.create @loveF, @mainCenterArea
