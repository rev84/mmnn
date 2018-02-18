class GameManager
  @ID = 'game'

  @gameElement = null
  @characters = []
  @initialized = 
    characters:false
    field:false
  @flags = 
    # キャラクター出撃モードに遷移していい状態であるか
    isEnableCharacterPick : true
    # 現在、キャラクター出撃モードであるか
    isCharacterPick : true
    # キャラクター出撃をしている場合、現在ドラッグされているキャラクターオブジェクト
    pickedCharacterObject : null
    # キャラクター出撃をしている場合、現在ドラッグされているキャラクターの要素
    pickedCharacterElement : null

  @onMouseDown:(evt)->

  @onMouseUp:(evt)->
    console.log('game mouseup')
    # 出撃選択を解除
    if @flags.pickedCharacterObject isnt null
      @flags.pickedCharacterObject = null
      if @flags.pickedCharacterElement isnt null
        @flags.pickedCharacterElement.remove()
        @flags.pickedCharacterElement = null

  @onMouseLeave:(evt)->

  @onMouseMove:(evt)->
    # キャラクター出撃モードで、キャラクターがピックされている場合
    if @flags.pickedCharacterElement isnt null
      # そのキャラクターの絵をマウスに追随させる
      @flags.pickedCharacterElement.css({
        left: Utl.e2localPos(evt)[0] - 90/2
        top: Utl.e2localPos(evt)[1] - 90/2
      }).removeClass('no_display')

  @doCharacterPick:->
    # キャラクター出撃モードに遷移可能な状態ではない
    return unless @flags.isEnableCharacterPick
    # キャラクター出撃モードにする
    @flags.isCharacterPick = true
    @flags.pickedCharacterId = null

  @init:->
    @gameElement = $('<div>').attr('id', @ID)
                   .on('mousemove', @onMouseMove.bind(@))
                   .on('mouseup', @onMouseUp.bind(@))
                   .on('mousedown', @onMouseDown.bind(@))
                   .on('mouseleave', @onMouseLeave.bind(@))
                   .css({
                      width: 1200
                      height: 800
                    })

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
          inField : false

      @characters[characterId] = new window[className](params)
    for characterId, characterObject of @characters
      CharacterPalletManager.addCharacter(characterObject)
    CharacterPalletManager.show()
