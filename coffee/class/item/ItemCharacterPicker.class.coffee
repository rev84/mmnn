class ItemCharacterPicker
  @ID: 'item_character_picker'

  @init:(@parentObject)->
    @divObject = $('<div>').attr('id', @ID)

    @characters = []

    @divObject.appendTo @parentObject.divObject

  @draw:->
    @characters = []
    for k, c of GameManager.characters
      continue unless c.isJoined()
      @characters.push c

    @characters.sort (a, b)->
      Number(a.getId()) - Number(b.getId())
    
    @panels = []
    $('#'+@ID+' > .panel').remove()
    for c, index in @characters
      top = index * Panel.SIZE_Y
      panel = new Panel(@divObject, c, top)
      # キャラ選択パネルに、キャラ選択イベントを登録
      panel.divObject.on('click', @onClick.bind(@, c))
      @panels.push panel

  @onClick:(characterObject)->
    ItemEquipmentEditor.select characterObject