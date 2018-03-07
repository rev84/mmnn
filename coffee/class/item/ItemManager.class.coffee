class ItemManager
  @ID: 'item'

  @init:(@gameElement, savedata)->

    @divObject = $('<div>').attr('id', @ID)

    # キャラを持つ
    @characters = []
    @characters.push c for k, c of GameManager.characters
    # アイテムのインスタンス
    @items = {}
    @setItems savedata

    ItemCharacterPicker.init(@)
    ItemEquipmentEditor.init(@)
    ItemEditor.init(@)

    @divObject.appendTo @gameElement

  @setItems:(savedata)->
    for itemId, itemBody of GameManager.items
      @items[itemId] = new Item(itemId, itemBody)
      for level in [0...itemBody.cost.length]
        # セーブデータに持ってる数があればセット
        if savedata isnt null and itemId of savedata and level of savedata[itemId]
          @items[itemId].setAmount level, savedata[itemId][level]
        # なければ0個
        else
          ;

  @repick:->
    ItemEquipmentEditor.select @characters[0]

  @show:->
    @divObject.removeClass('no_display')

  @hide:->
    @divObject.addClass('no_display')
