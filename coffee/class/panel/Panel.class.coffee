class Panel
  @SIZE_X = 400
  @SIZE_Y = 200
  constructor:->
    @div = $('<div>')
    @isCharacter = false
    @character = null

  generate:->


  setSide:(isCharacter)->
    @isCharacter = isCharacter

  setCharacter:(character)->
    @character = character

