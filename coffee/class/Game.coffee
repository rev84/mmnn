class Game
  @scene:
    field : null
  @characters:[]
  @field:[]
  @init:
    characters:false
    field:false

  @init:->
    @initCharacters()

  @initField:->


  # キャラ初期化
  @initCharacters:->
    return if @init.characters
    @init.characters = true
    @characters = window.characters
    window.characters = undefined

  # フィールド初期化
  @initField:->
    return if @init.field
    @init.field = true
    for x in [0...Const.FIELD.SIZE.X]
      @field[x] = []
      for y in [0...Const.FIELD.SIZE.Y]
        @field[x][y] = null