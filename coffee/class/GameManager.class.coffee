class GameManager
  @scene:
    field : null
  @characters:[]
  @field:[]
  @init:
    characters:false
    field:false

  @init:->
    @initCharacters()

  # キャラ初期化
  @initCharacters:->
    return if @init.characters
    @init.characters = true
    @characters = window.characters
    window.characters = undefined

  # フィールド初期化
  @initField:->
