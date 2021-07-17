error = assert require "src/GUI/error"
Rollit = (inputs, loveF, centerArea) ->
  characterName = inputs.characterChoices\GetChoice!
  dieType = inputs.dieType\GetChoice!
  numberOfDices = tonumber inputs.numberboxD\GetValue!
  primAttribName =  inputs.attribPrim\GetChoice!
  primAttribValue = tonumber inputs.modifP\GetValue!
  secAttribName =  inputs.attribSec\GetChoice!
  secAttribValue = tonumber inputs.modifS\GetValue!
  modifier = tonumber inputs.numberboxModi\GetValue!
  logStr = ""
  if dieType == "None" or dieType == ""
    error loveF, centerArea, "You must choose the type of the die."
    return

  if primAttribValue ~= 0 and primAttribName == ""
    error loveF, centerArea, "You must choose an attribute."
    return

  if secAttribValue ~= 0 and secAttribName == ""
    error loveF, centerArea, "You must choose an attribute."
    return

  if characterName == ""
    logStr = logStr.."Default".. " rolled : "..tostring(numberOfDices).." "..dieType.." + "..modifier
  else
    logStr = logStr..characterName.. " rolled "..tostring(numberOfDices).." "..dieType.." + "..modifier

  if primAttribName ~= "None" and primAttribName ~= ""
    logStr = logStr.." + "..primAttribName.."("..primAttribValue..")"

  if secAttribName ~= "None" and secAttribName ~= ""
    logStr = logStr.." + "..secAttribName.."("..secAttribValue..")"

  inputs.logClist\AddRow logStr
  inputs.logClist\SetAllRowsFont Graphics.newFont(15)

Rollit
