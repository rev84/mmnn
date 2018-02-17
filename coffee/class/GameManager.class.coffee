class GameManager
  @scene:
    field : null
  @characters:[]
  @field:[]
  @initialized:
    characters:false
    field:false

  @init:->
    CharacterPalletManager.init()
    @initCharacters(null)

  # キャラ初期化
  @initCharacters:(savedata)->
    return if @initialized.characters
    @initialized.characters = true

    @characters = {}
    for characterId, className of window.CharacterList
      if savedata? and 'characters' of savedata and characterId of savedata.characters
        params = savedata.characters[characterId]
      else
        params = 
          joined : null
          level : 1
          hp : null
          items : []

      @characters[characterId] = new window[className](params)
    for characterId, characterObject of @characters
      CharacterPalletManager.addCharacter(characterObject)
    CharacterPalletManager.show()

  # フィールド初期化
  @initField:->
