class CharacterPalletManager
  @ID = 'character_pallet'

  @SIZE_X = 400
  @SIZE_Y = 600

  @characters = []
  @panels = []

  @init:(@parentElement, @posX, @posY)->
    @divObject = $('<div>').attr('id', @ID)
    .addClass('no_display').css({
      width: @SIZE_X
      height: @SIZE_Y
      left: @posX
      top: @posY
    }).appendTo(@parentElement)
    
  @show:->
    $(@divObject).removeClass('no_display')

  @hide:->
    $(@divObject).addClass('no_display')

  @addCharacter:(characterObject)->
    @characters.push characterObject
    @draw()

  @draw:->
    @characters.sort (a, b)->
      Number(a.constructor.characterId) - Number(b.constructor.characterId)
    
    @panels = []
    $('#'+@ID+' > .'+Panel.CLASSNAME).remove()
    for c, index in @characters
      top = index * Panel.SIZE_Y
      @panels.push(new Panel(@divObject, c, top, 0, true))

  @redraw:(object = null)->
    $.each @panels, ->
      if object is null or @object isnt null and object.getCharacterId() is @object.getCharacterId()
        @draw()

  @pickCharacter:(characterObject)->
    # キャラオブジェクトを選択中キャラにセット
    GameManager.flags.pickedCharacterObject = characterObject
    # アイコンのキャラを一時的に消す
    #@divObject.find('.field_icon').css('background-image', 'none')
    # このキャラが仮置きしてあったセルの仮置きを全削除
    FieldManager.removeAllTempObject characterObject

    # 移動中のアイコンを作成
    GameManager.flags.pickedCharacterElement = $('<div>')
      .addClass('picked_character no_display')
      .css({
        width:90
        height:90
        'background-image': 'url('+characterObject.getBaseImage()+')'
      })
      .appendTo(GameManager.gameElement)
    # 追随させる
    GameManager.followPickedCharacterElement()