class ItemManager
  @ID: 'item'

  @init:(@gameElement)->

    @divObject = $('<div>').attr('id', @ID)

    # キャラを持つ
    @characters = []
    @characters.push c for k, c of GameManager.characters
    # アイテムのインスタンス
    @items = {}

    ItemCharacterPicker.init(@)
    ItemEquipmentEditor.init(@)
    ItemEditor.init(@)

    @divObject.appendTo @gameElement

  @setItems:(savedata)->
    for itemId, itemBody of GameManager.items
      @items[itemId] = new Item(itemId, itemBody)
      for index in [0...itemBody[itemId]['cost']]
        # セーブデータに持ってる数があればセット
        if savedata isnt null and itemId of savedata
          @items[itemId].setAmount savedata[itemId][index]
        # なければ0個
        else
          ;

  @show:->
    @divObject.addClass('no_display')

  @hide:->
    @divObject.addClass('no_display')
