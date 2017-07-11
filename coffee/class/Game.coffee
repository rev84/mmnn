class Game
  @scene:
    field : null
  @characters:[]

  @init:->
    console.log @scene.field
    @initCharacters()

  @initField:->


  @initCharacters:->
    @characters = window.characters