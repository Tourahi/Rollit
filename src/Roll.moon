error = assert require "src/GUI/error"
Rollit = (inputs, loveF, centerArea) ->
  characterName = inputs.characterChoices\GetChoice!
  dieType = inputs.dieType\GetChoice!
  numberOfDices = tonumber inputs.numberboxD\GetValue!
  primAttribName =  inputs.attribPrim\GetChoice!
  primAttribValue = tonumber inputs.modifP\GetValue!
  secAttribName =  inputs.attribSec\GetChoice!
  secAttribValue = tonumber inputs.modifS\GetValue!
  modifier = inputs.numberboxModi\GetValue!
  res = 0
  logStr = ""

  if tonumber(modifier) >= 0
    modifier = "+"..modifier

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
    logStr = logStr.."You".. " rolled : "..tostring(numberOfDices)..""..dieType .. modifier
  else
    logStr = logStr..characterName.. " rolled "..tostring(numberOfDices)..""..dieType ..modifier

  if primAttribName ~= "None" and primAttribName ~= ""
    logStr = logStr.." + "..primAttribName.."("..primAttribValue..")"
    res += primAttribValue

  if secAttribName ~= "None" and secAttribName ~= ""
    logStr = logStr.." + "..secAttribName.."("..secAttribValue..")"
    res += secAttribValue
  
  res += Die\roll numberOfDices .. dieType .. modifier

  inputs.logClist\AddRow logStr, "        "..res
  inputs.logClist\SetAllRowsFont Graphics.newFont(15)
  if numberOfDices == 1 then Sounds.oneDie\play!
  elseif numberOfDices > 1 then Sounds.multiDie\play!

Rollit
