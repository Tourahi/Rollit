loader = assert require 'src/DataLoaders'

addCharacter = (loveF, centerArea, characterChoices) ->
  frame = loveF.Create "frame"
  with frame
    \SetName "Add Character"
    \SetSize 250, 90
    \CenterWithinArea unpack centerArea

  nameInput = loveF.Create "textinput", frame
  with nameInput
    \SetPos 5, 30
    \SetWidth 240

  addBtn = loveF.Create "button", frame
  with addBtn
    \SetPos 5, 60
    \SetWidth 240
    \SetText "Add"
    .OnClick = (obj, x, y) ->
      if nameInput\GetText! ~= ""
        loader.addCharacter nameInput\GetText!, characterChoices
        frame\Remove!







addCharacter

