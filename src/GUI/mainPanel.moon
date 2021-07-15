
main = {}

main.create = (loveF, centerArea) ->
  characterForm = loveF.Create "form"
  with characterForm
    \SetName "Character"
    \SetSize 225, 50
    \SetPos centerArea[1] + 10, centerArea[2]
    \SetLayoutType "horizontal"
  characterChoices = loveF.Create "multichoice", characterForm
  with characterChoices
    \SetPos centerArea[1] + 15, centerArea[2] + 15
    \SetSize 215, 30


  promptForm = loveF.Create "form"
  promptFormX =  centerArea[1] + 10 + 230
  promptFormY =  centerArea[2]
  promptFormW =  550
  promptFormH =  500
  with promptForm
    \SetName "Log"
    \SetSize promptFormW, promptFormH
    \SetPos promptFormX, promptFormY
    \SetLayoutType "horizontal"





main
