loader = assert require 'src/DataLoaders'

logFile = (loveF, centerArea) ->
  frame = loveF.Create "frame"
  with frame
    \SetName "Logs location"
    \SetSize 250, 90
    \CenterWithinArea unpack centerArea

  nameInput = loveF.Create "textinput", frame
  with nameInput
    \SetPos 5, 30
    \SetWidth 240
  if LOG
    if LOG.logFileName! != nil
      nameInput\SetText LOG.logFileName!

  addBtn = loveF.Create "button", frame
  with addBtn
    \SetPos 5, 60
    \SetWidth 240
    \SetText "Save"
    .OnClick = (obj, x, y) ->
      if nameInput\GetText! ~= ""
        loader.setLogFile nameInput\GetText!
        frame\Remove!


logFile
