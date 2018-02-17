class GameManager
  @scene:
    field : null
  @characters:[]
  @field:[]
  @initialized:
    characters:false
    field:false

  @init:->
    @initCharacters()

  # キャラ初期化
  @initCharacters:->
    return if @initialized.characters
    @initialized.characters = true
    @characters = window.characters
    window.characters = undefined

  # フィールド初期化
  @initField:->
