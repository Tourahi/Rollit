
toolbox = {}

toolbox.create = (loveF,width) ->

  panel = loveF.Create "panel"
  width = Graphics.getWidth!
  height = Graphics.getHeight!
  with panel
    \SetPos 0, 0
    \SetSize width, 35

  info = loveF.Create "text", panel
  with info
    \SetPos 5, 3
    \SetText {
      {colors: Colors.chocolate},
      "Rollit : ",
      {colors: Colors.skyblue},
      "v1.0 (Alpha)"
    }
  themesList = loveF.Create "multichoice", panel
  with themesList
    \SetPos panel\GetWidth! - 150, 5
    \SetWidth 140
    \SetChoice "Choose a theme"
    .OnChoiceSelected = (obj, choice) ->
      loveF.SetActiveSkin choice

  for _, v in pairs loveF.skins
    themesList\AddChoice v.name
  themesList\Sort!





toolbox
