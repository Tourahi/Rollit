import insert from table

loadMultichoice = (multiC, data = nil) ->
  if data
    multiC\Clear!
    for i = 1, #data
      with multiC
        \AddChoice data[i]

addCharacter = (name, characterChoices) ->
  for _,v in ipairs Data.characters
    if name == v
      return
  insert Data.characters, name
  characterChoices\AddChoice name



{
  :loadMultichoice
  :addCharacter
}

