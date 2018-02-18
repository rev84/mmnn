class GameManager
  @ID = 'game'
  
  @gameElement = null
  @characters:[]
  @initialized:
    characters:false
    field:false

  @init:->
    @gameElement = $('<div>').attr('id', @ID)

    @initCharacters(null)
    @initField(null)

    @gameElement.appendTo('body')

  @initField:(savedata)->
    return if @initialized.field
    @initialized.field = true

    FieldManager.init(@gameElement, 400, 0)


  # キャラ初期化
  @initCharacters:(savedata)->
    return if @initialized.characters
    @initialized.characters = true

    CharacterPalletManager.init(@gameElement, 0, 0)

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
