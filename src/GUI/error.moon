
error = (loveF, centerArea, msg) ->
  frame = loveF.Create "frame"
  with frame
    \SetName "Error"
    \SetSize 250, 90
    \CenterWithinArea unpack centerArea

  err = loveF.Create "text", frame
  with err
    \SetPos 5, 30
    \SetWidth 240
    \SetDefaultColor 1, 0, 0, 1
    \SetText msg

  addBtn = loveF.Create "button", frame
  with addBtn
    \SetPos 5, 60
    \SetWidth 240
    \SetText "Ok"
    .OnClick = (obj, x, y) ->
      frame\Remove!


error
